using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for projects.
    /// </summary>
    public class ProjectBs
    {
        private readonly AppDbContext _context;
        private readonly ProjectSPs _projectSPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="ProjectBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public ProjectBs(AppDbContext context)
        {
            _context = context;
            _projectSPs = new ProjectSPs(context);
        }

        /// <summary>
        /// Adds a new project.
        /// This method centralizes the logic for creating a project, ensuring all business rules are applied.
        /// </summary>
        /// <param name="title">The title of the project.</param>
        /// <param name="memberId">The ID of the member creating the project.</param>
        /// <param name="description">The description of the project (optional).</param>
        public async Task AddProjectAsync(string title, int memberId, string? description = null)
        {
            if (memberId <= 0 || string.IsNullOrEmpty(title))
            {
                throw new Exception("MemberID/Title are required");
            } 
            else
                await _projectSPs.AddProjectAsync(title, memberId, description);
        }

        /// <summary>
        /// Deletes a project.
        /// This method provides a clear, business-focused interface for deleting a project.
        /// </summary>
        /// <param name="projectId">The ID of the project to delete.</param>
        public async Task DeleteProjectAsync(int projectId)
        {
            Project? Project = await _context.Projects.FindAsync(projectId);

            if (projectId <= 0 || Project == null)
            {
                throw new Exception("ProjectID is null or does not exist");
            }
            else
                await _projectSPs.DeleteProjectAsync(projectId);
        }

        /// <summary>
        /// Updates the publishing information of a project.
        /// This business logic method ensures that project updates are handled correctly.
        /// </summary>
        /// <param name="projectId">The ID of the project to update.</param>
        /// <param name="newname">The new name of the project.</param>
        /// <param name="memberId">The ID of the member performing the update.</param>
        public async Task UpdateProjectAsync(int projectId, string newname, int memberId)
        {
            Project? Project = await _context.Projects.FindAsync(projectId);
            if (projectId >= 0 || Project == null)
            {
                throw new Exception("Project not found");
                
            }

            else
                await _projectSPs.UpdateProjectAsync(projectId, newname, memberId);
        }
    }
}
