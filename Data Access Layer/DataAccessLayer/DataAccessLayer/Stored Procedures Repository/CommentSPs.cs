using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class CommentSPs
{
    private readonly AppDbContext _context;
    public CommentSPs(AppDbContext context) { _context = context; }

    /// <summary>
    /// Adds a new comment to an element.
    /// </summary>
    public async Task AddCommentAsync(int memberId, int projectId, string noteText, int? eventId = null, int? toDoId = null, int? cardId = null, int? stepId = null, int? messageId = null, int? documentId = null, string? urlLink = null)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddComment @MemberID = {0}, @EventID = {1}, @To_DoID = {2}, @CardID = {3}, @StepID = {4}, @MessageID = {5}, @DocumentID = {6}, @ProjectID = {7}, @NoteText = {8}, @URLLink = {9}",
            memberId, eventId, toDoId, cardId, stepId, messageId, documentId, projectId, noteText, urlLink);
    }

    /// <summary>
    /// Updates an existing comment.
    /// </summary>
    public async Task UpdateCommentAsync(int commentId, string? noteText = null, string? urlLink = null, int? fileId = null)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateComment @CommentID = {0}, @NoteText = {1}, @URLLink = {2}, @FileID = {3}",
            commentId, noteText, urlLink, fileId);
    }

    /// <summary>
    /// Deletes a comment.
    /// </summary>
    public async Task DeleteCommentAsync(int commentId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteComment @CommentID = {0}", commentId);
    }

    /// <summary>
    /// Retrieves all comments for a given element ID.
    /// </summary>
    public async Task<List<T>> SP_GetCommentByElementIDAsync<T>(int? eventId = null, int? toDoId = null, int? stepId = null, int? messageId = null, int? documentId = null, int? cardId = null) where T : class
    {
        return await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetCommentByElementID @EventID = {0}, @To_DoID = {1}, @StepID = {2}, @MessageID = {3}, @DocumentID = {4}, @CardID = {5}",
            eventId, toDoId, stepId, messageId, documentId, cardId)
            .AsNoTracking()
            .ToListAsync();

        
    }
}
