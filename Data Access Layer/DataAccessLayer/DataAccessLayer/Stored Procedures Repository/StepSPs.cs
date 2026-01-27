using DataAccessLayer.Data;
using Microsoft.EntityFrameworkCore;
using System.Threading.Tasks;
public class StepSPs
{
    private readonly AppDbContext _context;
    public StepSPs(AppDbContext context) { _context = context; }

 

    public async Task AddStepToCardAsync(int memberId, int cardId, int projectId, string text)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddStepToCard @MemberID = {0}, @CardID = {1}, @ProjectID = {2}, @Text = {3}",
            memberId, cardId, projectId, text);
    }

    public async Task UpdateStepAsync(int stepId, string text, bool? isChecked)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateStep @StepID = {0}, @Text = {1}, @IsChecked = {2}",
            stepId, text, isChecked);
    }

    public async Task DeleteStepAsync(int stepId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteStep @StepID = {0}", stepId);
    }



    public async Task<List<T>> GetStepByCardIdAsync<T>(int cardId) where T : class
    {
        return await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetStepByCardID @CardID = {0}", cardId)
            .AsNoTracking()
            .ToListAsync();
    }
}