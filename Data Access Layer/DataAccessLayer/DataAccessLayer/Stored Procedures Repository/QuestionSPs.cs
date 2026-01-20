using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;
public class QuestionSPs
{
    private readonly AppDbContext _context;
    public QuestionSPs(AppDbContext context) { _context = context; }

    public async Task AddQuestionAsync(int memberId, int projectId, string text, string? noteText, string? urlLink, string? filePath, string? caption)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddQuestion @MemberID = {0}, @ProjectID = {1}, @Text = {2}, @NoteText = {3}, @URLLink = {4}, @FilePath = {5}, @Caption = {6}",
            memberId, projectId, text, noteText, urlLink, filePath, caption);
    }

    public async Task DeleteQuestionAsync(int questionId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteQuestion @QuestionID = {0}", questionId);
    }

    public async Task<List<T>> GetQuestionByProjectIdAsync<T>(int projectId) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_GetQuestionByProjectID @ProjectID = {0}", projectId).ToListAsync();
    }

    public async Task<List<T>> GetQuestionByQuestionIdAsync<T>(int questionId) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_GetQuestionByQuestionID @QuestionID = {0}", questionId).ToListAsync();
    }
}