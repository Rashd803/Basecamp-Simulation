using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class AssignmentSPs
{
    private readonly AppDbContext _context;
    public AssignmentSPs(AppDbContext context) { _context = context; }

    /// <summary>
    /// Assigns a member to a specific task or event within a project.
    /// </summary>
    public async Task AddAssignmentAsync(int memberId, int projectId, int? eventId = null, int? toDoId = null, int? cardId = null, int? stepId = null, int? questionId = null)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddAssignment @MemberID = {0}, @EventID = {1}, @To_DoID = {2}, @CardID = {3}, @StepID = {4}, @QuestionID = {5}, @ProjectID = {6}",
            memberId, eventId, toDoId, cardId, stepId, questionId, projectId);
    }

    /// <summary>
    /// Deletes an assignment.
    /// </summary>
    public async Task DeleteAssignmentAsync(int assignmentId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteAssignment @AssignmentID = {0}", assignmentId);
    }

    /// <summary>
    /// Retrieves all assignments for a given element ID.
    /// </summary>
    public async Task<List<T>> GetAssignmentByElementIdAsync<T>(int? eventId = null, int? toDoId = null, int? stepId = null, int? questionId = null, int? cardId = null) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_GetAssignmentByElementID @EventID = {0}, @To_DoID = {1}, @StepID = {2}, @QuestionID = {3}, @CardID = {4}",
            eventId, toDoId, stepId, questionId, cardId)
            .AsNoTracking()
            .ToListAsync();
    }
}
