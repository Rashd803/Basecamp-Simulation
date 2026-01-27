using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.StoredProceduresRepository;

public class MessageBoardSPs
{
    private readonly AppDbContext _context;

    public MessageBoardSPs(AppDbContext context)
    {
        _context = context;
    }

    public async Task AddMessageToBoardAsync(int projectId, string? title, int memberId, string? noteText, string? noteUrlLink, string? filePath, string? fileCaption, bool isPrivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddMessageToBoard @ProjectID = {0}, @Title = {1}, @MemberID = {2}, @NoteText = {3}, @NoteURLLink = {4}, @FilePath = {5}, @FileCaption = {6}, @IsPrivate = {7}",
            projectId, title, memberId, noteText, noteUrlLink, filePath, fileCaption, isPrivate);
    }

    public async Task UpdateMessageInBoardAsync(int messageBoardId, string title, string? noteText, string? noteUrlLink, int? fileId, string? filePath, string? fileCaption, bool isPrivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateMessageInBoard @MessageBoardID = {0}, @Title = {1}, @NoteText = {2}, @NoteURLLink = {3}, @FileID = {4}, @FilePath = {5}, @FileCaption = {6}, @IsPrivate = {7}",
            messageBoardId, title, noteText, noteUrlLink, fileId, filePath, fileCaption, isPrivate);
    }

    public async Task DeleteMessageInBoardAsync(int messageBoardId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteMessageInBoard @MessageBoardID = {0}",
            messageBoardId);
    }

    public async Task<T?> GetMessageBoardByMessageIdAsync<T>(int messageId) where T : class
    {
        var results = await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetMessageBoardByMessageID @MessageID = {0}",
            messageId)
            .AsNoTracking()
            .ToListAsync();

        return results.FirstOrDefault();
    }

    public async Task<List<T>> GetMessageBoardByProjectIdAsync<T>(int projectId, bool memberOrClient) where T : class
    {
        return await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetMessageBoardByProjectID @ProjectID = {0}, @MemberOrClient = {1}",
            projectId, memberOrClient)
            .AsNoTracking()
            .ToListAsync();
    }
}
