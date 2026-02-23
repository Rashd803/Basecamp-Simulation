using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class ToDoSPs
{
    private readonly AppDbContext _context;
    public ToDoSPs(AppDbContext context) { _context = context; }

    /// <summary>
    /// Adds a new to-do item to a list.
    /// </summary>
    public async Task<int> AddToDoToListAsync(string text, int listId, int memberId, int projectId, bool isPrivate, DateTime? fromDate = null, DateTime? toDate = null, string? noteText = null, string? noteUrlLink = null)
    {
        var result = await _context.Database.SqlQueryRaw<int>(
            "EXEC SP_AddTo_DoToList @Text = {0}, @ListID = {1}, @MemberID = {2}, @ProjectID = {3}, @FromDate = {4}, @ToDate = {5}, @NoteText = {6}, @NoteURLLink = {7}, @IsPrivate = {8}",
            text, 
            listId, 
            memberId,
            projectId,
            fromDate ?? (object) DBNull.Value,
            toDate ?? (object)DBNull.Value, 
            noteText ?? (object)DBNull.Value,
            noteUrlLink ?? (object)DBNull.Value,
            isPrivate).ToListAsync();

        return result.FirstOrDefault();
    }

    /// <summary>
    /// Updates an existing to-do item.
    /// </summary>
    public async Task UpdateToDoAsync(int toDoId, string text, bool isPrivate, bool checkedValue, string? noteText = null, string? noteUrlLink = null, DateTime? fromDate = null, DateTime? toDate = null)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateTo_Do @To_DoID = {0}, @Text = {1}, @NoteText = {2}, @NoteURLLink = {3}, @FromDate = {4}, @ToDate = {5}, @IsPrivate = {6}, @Checked = {7}",
            toDoId, text, noteText, noteUrlLink, fromDate, toDate, isPrivate, checkedValue);
    }

    /// <summary>
    /// Deletes a to-do item.
    /// </summary>
    public async Task DeleteToDoAsync(int toDoId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteTo_Do @To_DoID = {0}", toDoId);
    }

    /// <summary>
    /// Retrieves all to-do items for a given list ID.
    /// </summary>
    public async Task<List<T>> GetToDoByListIdAsync<T>(int listId, bool isClient) where T : class
    {
        return await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetToDoByListID @ListID = {0}, @IsClient = {1}", listId, isClient)
            .AsNoTracking(
            ).ToListAsync();
    }

    /// <summary>
    /// Retrieves a to-do item by its ID.
    /// </summary>
    public async Task<T?> GetToDoByToDoIdAsync<T>(int toDoId) where T : class
    {
        var results = await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetToDoByToDoID @To_DoID = {0}", toDoId)
            .AsNoTracking()
            .ToListAsync();

        return results.FirstOrDefault();
    }
}
