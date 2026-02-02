using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class AnswerSPs
{
    private readonly AppDbContext _context;
    public AnswerSPs(AppDbContext context) { _context = context; }

    /// <summary>
    /// Adds a new answer to a question.
    /// </summary>
    public async Task AddAnswerAsync(int memberId, int questionId, int projectId, string? answerText = null, string? urlLink = null)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddAnswer @MemberID = {0}, @QuestionID = {1}, @ProjectID = {2}, @AnswerText = {3}, @URLLink = {4}",
            memberId, questionId, projectId, answerText, urlLink);
    }

    /// <summary>
    /// Updates an existing answer.
    /// </summary>
    public async Task UpdateAnswerAsync(int answerId, string? answerText = null, string? urlLink = null)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateAnswer @AnswerID = {0}, @AnswerText = {1}, @URLLink = {2}",
            answerId, answerText, urlLink);
    }

    /// <summary>
    /// Deletes an answer.
    /// </summary>
    public async Task DeleteAnswerAsync(int answerId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteAnswer @AnswerID = {0}", answerId);
    }

    /// <summary>
    /// Retrieves all answers for a given question ID.
    /// </summary>
    public async Task<List<T>> GetAnswerByQuestionIdAsync<T>(int questionId) where T : class
    {
        return await _context.Set<T>().FromSqlRaw("EXEC SP_GetAnswerByQuestionID @QuestionID = {0}", questionId)
            .AsNoTracking()
            .ToListAsync();
    }
}
