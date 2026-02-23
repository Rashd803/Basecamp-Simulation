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

    /// <summary>
    /// Adds a new message to the message board.
    /// </summary>
    public async Task<int> AddMessageToBoardAsync(int projectId, string? title, int memberId, bool isPrivate, string? noteText = null, string? noteUrlLink = null)
    {
        var result = await _context.Database.SqlQueryRaw<int>(
            "EXEC SP_AddMessageToBoard @ProjectID = {0}, @Title = {1}, @MemberID = {2}, @NoteText = {3}, @NoteURLLink = {4}, @IsPrivate = {7}",
            projectId, title, memberId, noteText, noteUrlLink, isPrivate).ToListAsync();

        return result.FirstOrDefault();
    }

    /// <summary>
    /// Updates an existing message on the message board.
    /// </summary>
    public async Task UpdateMessageInBoardAsync(int messageBoardId, string title, bool isPrivate, string? noteText = null, string? noteUrlLink = null)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateMessageInBoard @MessageBoardID = {0}, @Title = {1}, @NoteText = {2}, @NoteURLLink = {3}, @IsPrivate = {4}",
            messageBoardId, title, noteText, noteUrlLink, isPrivate);
    }

    /// <summary>
    /// Deletes a message from the message board.
    /// </summary>
    public async Task DeleteMessageInBoardAsync(int messageBoardId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteMessageInBoard @MessageBoardID = {0}",
            messageBoardId);
    }

    /// <summary>
    /// Retrieves a message from the message board by its ID.
    /// </summary>
    public async Task<T?> GetMessageBoardByMessageIdAsync<T>(int messageId) where T : class
    {
        var results = await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetMessageBoardByMessageID @MessageID = {0}",
            messageId)
            .AsNoTracking()
            .ToListAsync();

        return results.FirstOrDefault();
    }

    /// <summary>
    /// Retrieves all messages from the message board for a given project ID.
    /// </summary>
    public async Task<List<T>> GetMessageBoardByProjectIdAsync<T>(int projectId, bool memberOrClient) where T : class
    {
        return await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetMessageBoardByProjectID @ProjectID = {0}, @MemberOrClient = {1}",
            projectId, memberOrClient)
            .AsNoTracking()
            .ToListAsync();
    }
}
