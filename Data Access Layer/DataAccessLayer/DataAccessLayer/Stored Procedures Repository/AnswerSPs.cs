using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class AnswerSPs
{
    private readonly AppDbContext _context;
    public AnswerSPs(AppDbContext context) { _context = context; }

    public async Task AddAnswerAsync(int memberId, int questionId, int projectId, string? answerText, string? urlLink, string? filePath, string? caption)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddAnswer @MemberID = {0}, @QuestionID = {1}, @ProjectID = {2}, @AnswerText = {3}, @URLLink = {4}, @FilePath = {5}, @Caption = {6}",
            memberId, questionId, projectId, answerText, urlLink, filePath, caption);
    }

    public async Task UpdateAnswerAsync(int answerId, string? answerText, string? urlLink, string? filePath, string? caption)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateAnswer @AnswerID = {0}, @AnswerText = {1}, @URLLink = {2}, @FilePath = {3}, @Caption = {4}",
            answerId, answerText, urlLink, filePath, caption);
    }

    public async Task DeleteAnswerAsync(int answerId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteAnswer @AnswerID = {0}", answerId);
    }

    public async Task<List<T>> GetAnswerByQuestionIdAsync<T>(int questionId) where T : class
    {
        return await _context.Set<T>().FromSqlRaw("EXEC SP_GetAnswerByQuestionID @QuestionID = {0}", questionId)
            .AsNoTracking()
            .ToListAsync();
    }
}
