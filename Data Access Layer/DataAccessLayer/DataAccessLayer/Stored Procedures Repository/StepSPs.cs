using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;
public class StepSPs
{
    private readonly AppDbContext _context;
    public StepSPs(AppDbContext context) { _context = context; }

    public async Task AddStepAsync(int memberId, int? toDoId, int? cardId, string text, int projectId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddStep @MemberID = {0}, @To_DoID = {1}, @CardID = {2}, @Text = {3}, @ProjectID = {4}",
            memberId, toDoId, cardId, text, projectId);
    }

    public async Task DeleteStepAsync(int stepId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteStep @StepID = {0}", stepId);
    }

    public async Task<List<T>> GetStepByMixedIdAsync<T>(int? toDoId, int? cardId) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_GetStepByMixedID @To_DoID = {0}, @CardID = {1}", toDoId, cardId).ToListAsync();
    }
}