using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class AssignmentSPs
{
    private readonly AppDbContext _context;
    public AssignmentSPs(AppDbContext context) { _context = context; }

    public async Task AddAssignmentAsync(int memberId, int? eventId, int? toDoId, int? cardId, int? stepId, int? questionId, int projectId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddAssignment @MemberID = {0}, @EventID = {1}, @To_DoID = {2}, @CardID = {3}, @StepID = {4}, @QuestionID = {5}, @ProjectID = {6}",
            memberId, eventId, toDoId, cardId, stepId, questionId, projectId);
    }

    public async Task DeleteAssignmentAsync(int assignmentId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteAssignment @AssignmentID = {0}", assignmentId);
    }

    public async Task<List<T>> GetAssignmentByElementIdAsync<T>(int? eventId, int? toDoId, int? stepId, int? questionId, int? cardId) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_GetAssignmentByElementID @EventID = {0}, @To_DoID = {1}, @StepID = {2}, @QuestionID = {3}, @CardID = {4}",
            eventId, toDoId, stepId, questionId, cardId).ToListAsync();
    }
}
