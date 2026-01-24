using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;
public class QuestionSPs
{
    private readonly AppDbContext _context;
    public QuestionSPs(AppDbContext context) { _context = context; }

    public async Task AddQuestionAsync(int memberId, int projectId, string text, DateTime fromdate, DateTime todate, bool isprivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddQuestion @MemberID = {0}, @ProjectID = {1}, @Text = {2}, @fromdate = {3}, @todate = {4}, @IsPrivate = {5}",
            memberId, projectId, text, fromdate, todate, isprivate);
    }


    public async Task UpdateQuestionAsync(int questionId, string text, DateTime fromdate, DateTime todate, bool isprivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateQuestion @MemberID = {0} = {1}, @Text = {2}, @FromDate = {3}, @ToDate = {4}, @IsPrivate = {5}",
            questionId, text, fromdate, todate, isprivate);
    }

    public async Task DeleteQuestionAsync(int questionId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteQuestion @QuestionID = {0}", questionId);
    }

    public async Task<List<T>> GetQuestionByProjectIdAsync<T>(int projectId, bool memberorclient) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_GetQuestionByProjectID @ProjectID = {0}, , @MemberOrClient = {1}", projectId, memberorclient).ToListAsync();
    }

    public async Task<List<T>> GetQuestionByQuestionIdAsync<T>(int questionId) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_GetQuestionByQuestionID @QuestionID = {0}", questionId).ToListAsync();
    }
}