using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;
public class QuestionSPs
{
    private readonly AppDbContext _context;
    public QuestionSPs(AppDbContext context) { _context = context; }

    /// <summary>
    /// Adds a new question to a project.
    /// </summary>
    public async Task AddQuestionAsync(int memberId, int projectId, string text, DateTime fromdate, DateTime todate, bool isprivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddQuestion @MemberID = {0}, @ProjectID = {1}, @Text = {2}, @fromdate = {3}, @todate = {4}, @IsPrivate = {5}",
            memberId, projectId, text, fromdate, todate, isprivate);
    }

    /// <summary>
    /// Updates an existing question.
    /// </summary>
    public async Task UpdateQuestionAsync(int questionId, string text, DateTime fromdate, DateTime todate, bool isprivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateQuestion @QuestionID = {0} , @Text = {1}, @FromDate = {2}, @ToDate = {3}, @IsPrivate = {4}",
            questionId, text, fromdate, todate, isprivate);
    }

    /// <summary>
    /// Deletes a question.
    /// </summary>
    public async Task DeleteQuestionAsync(int questionId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteQuestion @QuestionID = {0}", questionId);
    }

    /// <summary>
    /// Retrieves all questions for a given project ID.
    /// </summary>
    public async Task<List<T>> GetQuestionByProjectIdAsync<T>(int projectId, bool memberorclient) where T : class
    {
        return await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetQuestionByProjectID @ProjectID = {0}, @MemberOrClient = {1}", projectId, memberorclient)
            .AsNoTracking()
            .ToListAsync();
    }

    /// <summary>
    /// Retrieves a question by its ID.
    /// </summary>
    public async Task<T?> GetQuestionByQuestionIdAsync<T>(int questionId) where T : class
    {
        var results = await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetQuestionByQuestionID @QuestionID = {0}", questionId)
            .AsNoTracking()
            .ToListAsync();

        return results.FirstOrDefault();
    }
}