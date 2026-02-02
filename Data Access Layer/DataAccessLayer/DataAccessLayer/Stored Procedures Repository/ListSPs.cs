using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class ListSPs
{
    private readonly AppDbContext _context;
    public ListSPs(AppDbContext context) { _context = context; }

    /// <summary>
    /// Adds a new list to a project.
    /// </summary>
    public async Task AddListAsync(int memberId, int projectId, string title, bool isPrivate, string? noteText = null, string? urlLink = null)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddList @MemberID = {0}, @ProjectID = {1}, @Title = {2}, @NoteText = {3}, @URLLink = {4}, @IsPrivate = {5}",
            memberId, projectId, title, noteText, urlLink, isPrivate);
    }

    /// <summary>
    /// Updates an existing list.
    /// </summary>
    public async Task UpdateListAsync(int listId, string title, bool isPrivate, string? noteText = null, string? urlLink = null)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateList @ListID = {0}, @Title = {1}, @NoteText = {2}, @URLLink = {3}, @IsPrivate = {6}",
            listId, title, noteText, urlLink, isPrivate);
    }

    /// <summary>
    /// Deletes a list.
    /// </summary>
    public async Task DeleteListAsync(int listId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteList @ListID = {0}", listId);
    }

    /// <summary>
    /// Retrieves a list by its ID.
    /// </summary>
    public async Task<T?> GetListByListIdAsync<T>(int listId) where T : class
    {
        var results = await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetListByListID @ListID = {0}", listId)
            .AsNoTracking()
            .ToListAsync();

        return results.FirstOrDefault();
    }

    /// <summary>
    /// Retrieves all lists for a given project ID.
    /// </summary>
    public async Task<List<T>> GetListByProjectIdAsync<T>(int projectId, bool memberOrClient) where T : class
    {
        return await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetListByProjectID @ProjectID = {0}, @MemberOrClient = {1}", projectId, memberOrClient)
            .AsNoTracking()
            .ToListAsync();
    }
}
