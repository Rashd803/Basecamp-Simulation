using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using Microsoft.Extensions.Logging;
using Column = DataAccessLayer.Entities.Column;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for columns.
    /// </summary>
    public class ColumnBs
    {
        private readonly AppDbContext _context;
        private readonly ColumnSPs _columnSPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="ColumnBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public ColumnBs(AppDbContext context)
        {
            _context = context;
            _columnSPs = new ColumnSPs(context);
        }

        /// <summary>
        /// Adds a new column to a project.
        /// This method encapsulates the business rules for creating a new column.
        /// </summary>
        /// <param name="memberId">The ID of the member creating the column.</param>
        /// <param name="title">The title of the column.</param>
        /// <param name="description">The description of the column.</param>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="isPrivate">Indicates whether the column is private.</param>
        public async Task AddColumnAsync(int memberId, string title, string description, int projectId, bool isPrivate)
        {
            await _columnSPs.AddColumnAsync(memberId, title, description, projectId, isPrivate);
        }

        /// <summary>
        /// Updates an existing column.
        /// This business layer method ensures that the update process adheres to business rules.
        /// </summary>
        /// <param name="columnId">The ID of the column to update.</param>
        /// <param name="title">The updated title of the column (optional).</param>
        /// <param name="description">The updated description of the column (optional).</param>
        /// <param name="isPrivate">The updated privacy status of the column.</param>
        public async Task UpdateColumnAsync(int columnId, bool isPrivate, string? title, string? description = null)
        {
            Column? Column = await _context.Columns.FindAsync(columnId);

            if (Column == null)
            {
                throw new Exception("Column not found.");
            }
            else
                await _columnSPs.UpdateColumnAsync(columnId, isPrivate, title, description);
        }

        /// <summary>
        /// Deletes a column.
        /// This method provides a clear, business-focused interface for deleting a column.
        /// </summary>
        /// <param name="columnId">The ID of the column to delete.</param>
        public async Task DeleteColumnAsync(int columnId)
        {
            Column? Column = await _context.Columns.FindAsync(columnId);

            if (Column == null)
            {
                throw new Exception("Column not found.");
            }
            else
                await _columnSPs.DeleteColumnAsync(columnId);
        }

        /// <summary>
        /// Retrieves all columns for a given project ID.
        /// This method fetches data from the data access layer and can be used to apply additional business logic.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="projectid">The ID of the project.</param>
        /// <param name="memberorclient">Indicates whether the user is a member or a client.</param>
        /// <returns>A list of columns for the specified project.</returns>
        public async Task<List<ColumnByProjectIdDTO>> GetColumnByProjectIDAsync<T>(int projectid, bool memberorclient) where T : class
        {
            Project? Project = await _context.Projects.FindAsync(projectid);

            if (Project == null)
            {
                throw new Exception("Project not found.");
            }
            else
                return await _columnSPs.GetColumnByProjectIDAsync<ColumnByProjectIdDTO>(projectid, memberorclient);
        }

        /// <summary>
        /// Retrieves a column by its ID.
        /// This method provides a direct way to fetch a single column and can be extended with business rules.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="columnId">The ID of the column to retrieve.</param>
        /// <returns>The column with the specified ID.</returns>
        public async Task<ColumnByColumnIdDTO?> GetColumnByColumnIDAsync<T>(int columnId) where T : class
        {
            Column? Column = await _context.Columns.FindAsync(columnId);

            if (Column == null)
            {
                throw new Exception("Column not found.");
            }
            else
                return await _columnSPs.GetColumnByColumnIDAsync<ColumnByColumnIdDTO>(columnId);
        }
    }
}
