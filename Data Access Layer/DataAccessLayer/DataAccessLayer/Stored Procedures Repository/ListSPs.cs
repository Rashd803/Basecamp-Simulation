using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class ListSPs
{
    private readonly AppDbContext _context;
    public ListSPs(AppDbContext context) { _context = context; }

    public async Task AddListAsync(int memberId, int projectId, string title, string? noteText, string? urlLink, string? filePath, string? caption, bool isPrivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddList @MemberID = {0}, @ProjectID = {1}, @Title = {2}, @NoteText = {3}, @URLLink = {4}, @FilePath = {5}, @Caption = {6}, @IsPrivate = {7}",
            memberId, projectId, title, noteText, urlLink, filePath, caption, isPrivate);
    }

    public async Task UpdateListAsync(int listId, string title, string? noteText, string? urlLink, string? filePath, string? caption, bool isPrivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateList @ListID = {0}, @Title = {1}, @NoteText = {2}, @URLLink = {3}, @FilePath = {4}, @Caption = {5}, @IsPrivate = {6}",
            listId, title, noteText, urlLink, filePath, caption, isPrivate);
    }

    public async Task DeleteListAsync(int listId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteList @ListID = {0}", listId);
    }

    public async Task<T?> GetListByListIdAsync<T>(int listId) where T : class
    {
        var results = await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetListByListID @ListID = {0}", listId)
            .AsNoTracking()
            .ToListAsync();

        return results.FirstOrDefault();
    }

    public async Task<List<T>> GetListByProjectIdAsync<T>(int projectId, bool memberOrClient) where T : class
    {
        return await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetListByProjectID @ProjectID = {0}, @MemberOrClient = {1}", projectId, memberOrClient)
            .AsNoTracking()
            .ToListAsync();
    }
}
