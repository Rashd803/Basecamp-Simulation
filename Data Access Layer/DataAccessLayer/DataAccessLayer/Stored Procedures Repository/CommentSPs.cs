using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class CommentSPs
{
    private readonly AppDbContext _context;
    public CommentSPs(AppDbContext context) { _context = context; }

    public async Task AddCommentAsync(int memberId, int? eventId, int? toDoId, int? cardId, int? stepId, int? messageId, int? documentId, int projectId, string noteText, string? urlLink, string? filePath, string? caption)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddComment @MemberID = {0}, @EventID = {1}, @To_DoID = {2}, @CardID = {3}, @StepID = {4}, @MessageID = {5}, @DocumentID = {6}, @ProjectID = {7}, @NoteText = {8}, @URLLink = {9}, @FilePath = {10}, @Caption = {11}",
            memberId, eventId, toDoId, cardId, stepId, messageId, documentId, projectId, noteText, urlLink, filePath, caption);
    }

    public async Task UpdateCommentAsync(int commentId, string? noteText, string? urlLink, int? fileId, string? filePath, string? caption)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateComment @CommentID = {0}, @NoteText = {1}, @URLLink = {2}, @FileID = {3}, @FilePath = {4}, @Caption = {5}",
            commentId, noteText, urlLink, fileId, filePath, caption);
    }

    public async Task DeleteCommentAsync(int commentId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteComment @CommentID = {0}", commentId);
    }

    public async Task<List<T>> SP_GetCommentByElementIDAsync<T>(int? eventId, int? toDoId, int? stepId, int? messageId, int? documentId, int? cardId) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_SP_GetCommentByElementID @EventID = {0}, @To_DoID = {1}, @StepID = {2}, @MessageID = {3}, @DocumentID = {4}, @CardID = {5}",
            eventId, toDoId, stepId, messageId, documentId, cardId).ToListAsync();
    }
}
