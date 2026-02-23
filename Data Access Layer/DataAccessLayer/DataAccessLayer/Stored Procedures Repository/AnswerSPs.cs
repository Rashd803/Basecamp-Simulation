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
    public async Task<int> AddAnswerAsync(int memberId, int questionId, string? answerText = null, string? urllink = null)
    {
        var result = await _context.Database.SqlQueryRaw<int>(
             "EXEC SP_AddAnswer @MemberID = {0}, @QuestionID = {1}, @AnswerText = {2}, @URLLink = {3}",
             memberId, questionId, answerText ?? (object)DBNull.Value, urllink ?? (object)DBNull.Value).ToListAsync();

        // Return the newly created comment's Note ID
        return result.FirstOrDefault();
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

    /// <summary>
    /// Retrieves a single answer for a given ID.
    /// </summary>
    public async Task<T?> GetAnswerByAnswerIdAsync<T>(int answerId) where T : class
    {
        try
        {
            var results = await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetAnswertByAnswerID @AnswerID = {0}", answerId)
            .AsNoTracking()
            .ToListAsync();
            return results.FirstOrDefault();
        }
        catch (Exception ex)
        {
           
            throw new Exception($"An error occurred while retrieving the answer with ID {answerId}.", ex);
        }


        
    }
}
