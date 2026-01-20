using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class ToDoSPs
{
    private readonly AppDbContext _context;
    public ToDoSPs(AppDbContext context) { _context = context; }

    public async Task AddToDoToListAsync(string text, int listId, int memberId, int projectId, DateTime? fromDate, DateTime? toDate, string? noteText, string? noteUrlLink, string? filePath, string? fileCaption, bool isPrivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddTo_DoToList @Text = {0}, @ListID = {1}, @MemberID = {2}, @ProjectID = {3}, @FromDate = {4}, @ToDate = {5}, @NoteText = {6}, @NoteURLLink = {7}, @FilePath = {8}, @FileCaption = {9}, @IsPrivate = {10}",
            text, listId, memberId, projectId, fromDate, toDate, noteText, noteUrlLink, filePath, fileCaption, isPrivate);
    }

    public async Task UpdateToDoAsync(int toDoId, string text, string? noteText, string? noteUrlLink, string? filePath, string? fileCaption, DateTime fromDate, DateTime toDate, bool isPrivate, bool checkedValue)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateTo_Do @To_DoID = {0}, @Text = {1}, @NoteText = {2}, @NoteURLLink = {3}, @FilePath = {4}, @FileCaption = {5}, @FromDate = {6}, @ToDate = {7}, @IsPrivate = {8}, @Checked = {9}",
            toDoId, text, noteText, noteUrlLink, filePath, fileCaption, fromDate, toDate, isPrivate, checkedValue);
    }

    public async Task DeleteToDoAsync(int toDoId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteTo_Do @To_DoID = {0}", toDoId);
    }

    public async Task<List<T>> GetToDoByListIdAsync<T>(int listId, bool isClient) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_GetToDoByListID @ListID = {0}, @IsClient = {1}", listId, isClient).ToListAsync();
    }

    public async Task<List<T>> GetToDoByToDoIdAsync<T>(int toDoId) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_GetToDoByToDoID @To_DoID = {0}", toDoId).ToListAsync();
    }
}
