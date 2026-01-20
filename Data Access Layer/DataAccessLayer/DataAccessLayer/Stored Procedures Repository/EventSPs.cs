using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class EventSPs
{
    private readonly AppDbContext _context;
    public EventSPs(AppDbContext context) { _context = context; }

    public async Task AddEventAsync(string name, int projectId, DateTime fromDate, DateTime toDate, int memberId, string? urlLink, string? noteText, string? noteUrlLink, string? filePath, string? fileCaption, bool isPrivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddEvent @Name = {0}, @ProjectID = {1}, @FromDate = {2}, @ToDate = {3}, @MemberID = {4}, @URLLink = {5}, @NoteText = {6}, @NoteURLLink = {7}, @FilePath = {8}, @FileCaption = {9}, @IsPrivate = {10}",
            name, projectId, fromDate, toDate, memberId, urlLink, noteText, noteUrlLink, filePath, fileCaption, isPrivate);
    }

    public async Task UpdateEventAsync(int eventId, string name, DateTime fromDate, DateTime toDate, string? urlLink, string? noteText, string? noteUrlLink, string? filePath, string? fileCaption, bool isPrivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateEvent @EventID = {0}, @Name = {1}, @FromDate = {2}, @ToDate = {3}, @URLLink = {4}, @NoteText = {5}, @NoteURLLink = {6}, @FilePath = {7}, @FileCaption = {8}, @IsPrivate = {9}",
            eventId, name, fromDate, toDate, urlLink, noteText, noteUrlLink, filePath, fileCaption, isPrivate);
    }

    public async Task DeleteEventAsync(int eventId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteEvent @EventID = {0}", eventId);
    }

    public async Task<List<T>> GetEventByEventIdAsync<T>(int eventId) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_GetEventByEventID @EventID = {0}", eventId).ToListAsync();
    }

    public async Task<List<T>> GetEventByProjectIdAsync<T>(int projectId, bool memberOrClient) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_GetEventByProjectID @ProjectID = {0}, @MemberOrClient = {1}", projectId, memberOrClient).ToListAsync();
    }
}
