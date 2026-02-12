using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class ColumnSPs
{
    private readonly AppDbContext _context;
    public ColumnSPs(AppDbContext context) { _context = context; }

    /// <summary>
    /// Adds a new column to a project.
    /// </summary>
    public async Task AddColumnAsync(int memberId, string title, string description, int projectId, bool isPrivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddColumn @MemberID = {0}, @Title = {1}, @Description = {2}, @ProjectID = {3}, @IsPrivate = {4}",
            memberId, title, description, projectId, isPrivate);
    }

    /// <summary>
    /// Updates an existing column.
    /// </summary>
    public async Task UpdateColumnAsync(int columnId, bool isPrivate, string? title = null, string? description = null)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateColumn @ColumnID = {0}, @Title = {1}, @Description = {2}, @IsPrivate = {3}",
            columnId, title, description, isPrivate);
    }

    /// <summary>
    /// Deletes a column.
    /// </summary>
    public async Task DeleteColumnAsync(int columnId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteColumn @ColumnID = {0}", columnId);
    }

    /// <summary>
    /// Retrieves all columns for a given project ID.
    /// </summary>
    public async Task <List<T>> GetColumnByProjectIDAsync<T>(int projectid, bool memberorclient) where T : class
    {
        return await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetColumnByProjectID @ProjectID = {0}, @MemberOrClient = {1}", projectid, memberorclient)
            .AsNoTracking()
            .ToListAsync();
    }

    /// <summary>
    /// Retrieves a column by its ID.
    /// </summary>
    public async Task<T?> GetColumnByColumnIDAsync<T>(int columnId) where T : class
    {
       var results = await _context.Set<T>()
        .FromSqlRaw("EXEC SP_GetColumnByColumnID @ColumnID = {0}", columnId)
        .AsNoTracking()
        .ToListAsync();

        return results.FirstOrDefault();
    }
}
