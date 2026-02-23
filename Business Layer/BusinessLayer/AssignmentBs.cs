using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;
using Microsoft.Extensions.Logging;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for assignments.
    /// </summary>
    public class AssignmentBs
    {

        private readonly AppDbContext _context;
        private readonly AssignmentSPs _assignmentSPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="AssignmentBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public AssignmentBs(AppDbContext context)
        {
            _context = context;
            _assignmentSPs = new AssignmentSPs(context);
        }

        /// <summary>
        /// Assigns a member to a specific event within a project.
        /// This method abstracts the data access details of creating an event assignment.
        /// </summary>
        /// <param name="memberId">The ID of the member being assigned.</param>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="eventId">The ID of the event.</param>
        public async Task AddAssignmentForEventAsync(int memberId, int projectId, int? eventId)
        {
            if(memberId <= 0 || projectId  <= 0 || eventId <= 0)
            {
                throw new Exception("Member ID/ Project ID/ Event ID should not be null");
            }
            else
                await _assignmentSPs.AddAssignmentAsync(memberId, projectId, eventId: eventId);
        }

        /// <summary>
        /// Assigns a member to a specific to_do within a project.
        /// This method abstracts the data access details of creating a to_do assignment.
        /// </summary>
        /// <param name="memberId">The ID of the member being assigned.</param>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="todoId">The ID of the to-do item.</param>
        public async Task AddAssignmentForToDoAsync(int memberId, int projectId, int todoId)
        {
            if (memberId <= 0 || projectId <= 0 || todoId <= 0)
            {
                throw new Exception("Member ID/ Project ID/ To-Do ID should not be null");
            }
            else
                await _assignmentSPs.AddAssignmentAsync(memberId, projectId, todoId: todoId);
        }

        /// <summary>
        /// Assigns a member to a specific card within a project.
        /// This method abstracts the data access details of creating a card assignment.
        /// </summary>
        /// <param name="memberId">The ID of the member being assigned.</param>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="cardId">The ID of the card.</param>
        public async Task AddAssignmentForCardAsync(int memberId, int projectId, int cardId)
        {
            if (memberId <= 0 || projectId <= 0 || cardId <= 0)
            {
                throw new Exception("Member ID/ Project ID/ Card ID should not be null");
            }
            else
                await _assignmentSPs.AddAssignmentAsync(memberId, projectId, cardId:cardId);
        }

        /// <summary>
        /// Assigns a member to a specific step within a project.
        /// This method abstracts the data access details of creating a step assignment.
        /// </summary>
        /// <param name="memberId">The ID of the member being assigned.</param>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="stepId">The ID of the step.</param>
        public async Task AddAssignmentForStepAsync(int memberId, int projectId, int stepId)
        {
            if (memberId <= 0 || projectId <= 0 || stepId <= 0)
            {
                throw new Exception("Member ID/ Project ID/ Step ID should not be null");
            }
            else
                await _assignmentSPs.AddAssignmentAsync(memberId, projectId, stepId:stepId);
        }

        /// <summary>
        /// Assigns a member to a specific question within a project.
        /// This method abstracts the data access details of creating a question assignment.
        /// </summary>
        /// <param name="memberId">The ID of the member being assigned.</param>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="questionId">The ID of the question.</param>
        public async Task AddAssignmentFotQuestionAsync(int memberId, int projectId, int questionId)
        {
            if (memberId <= 0 || projectId <= 0 || questionId <= 0)
            {
                throw new Exception("Member ID/ Project ID/ Question ID should not be null");
            }
            else
                await _assignmentSPs.AddAssignmentAsync(memberId, projectId, questionId:questionId);
        }

    

        /// <summary>
        /// Deletes an assignment.
        /// This business layer method provides a clear interface for deleting an assignment.
        /// </summary>
        /// <param name="assignmentId">The ID of the assignment to delete.</param>
        public async Task DeleteAssignmentAsync(int assignmentId)
        {
            Question? Question = await _context.Questions.FindAsync(assignmentId);

            if (Question == null)
            {
                throw new Exception("Question not found");
            }
            else
                await _assignmentSPs.DeleteAssignmentAsync(assignmentId);
        }

        /// <summary>
        /// Retrieves all assignments for a given event ID.
        /// This method can be used to check the members assigned with a given Event.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="eventId">The ID of the event.</param>
        /// <returns>A list of assignments for the specified Event.</returns>
        public async Task<List<AssignmentByElementIdDTO>> GetAssignedMembersOnElementByEventIdAsync<T>(int eventId) where T : class
        {
            return await _assignmentSPs.GetAssignmentByElementIdAsync<AssignmentByElementIdDTO>(eventId:eventId);
        }

        /// <summary>
        /// Retrieves all assignments for a given To_Do ID.
        /// This method can be used to check the members assigned with a given To_Do.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="toDoID">The ID of the to-do item (optional).</param>
        /// <returns>A list of assignments for the specified To_Do.</returns>
        public async Task<List<AssignmentByElementIdDTO>> GetAssignedMembersWithTo_DoByTo_DoIdAsync<T>(int toDoID) where T : class
        {
            return await _assignmentSPs.GetAssignmentByElementIdAsync<AssignmentByElementIdDTO>(toDoId:toDoID);
        }

        /// <summary>
        /// Retrieves all assignments for a given element ID.
        /// This method can be used to check the members assigned with a given Card.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="cardId">The ID of the card (optional).</param>
        /// <returns>A list of assignments for the specified Card.</returns>
        public async Task<List<AssignmentByElementIdDTO>> GetAssignedMembersWithCardByCardIdAsync<T>(int cardId) where T : class
        {
            return await _assignmentSPs.GetAssignmentByElementIdAsync<AssignmentByElementIdDTO>(cardId:cardId);
        }

        /// <summary>
        /// Retrieves all assignments for a given step ID.
        /// This method can be used to check the members assigned with a given Step.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="stepId">The ID of the step (optional).</param>
        /// <returns>A list of assignments for the specified Step.</returns>
        public async Task<List<AssignmentByElementIdDTO>> GetAssignedMembersWithStepByStepIdAsync<T>(int stepId) where T : class
        {
            return await _assignmentSPs.GetAssignmentByElementIdAsync<AssignmentByElementIdDTO>(stepId:stepId);
        }

        /// <summary>
        /// Retrieves all assignments for a given question ID.
        /// This method can be used to check the members assigned with a given question.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="questionId">The ID of the question (optional).</param>
        /// <returns>A list of assignments for the specified question.</returns>
        public async Task<List<AssignmentByElementIdDTO>> GetAssignmentByElementIdAsync<T>(int questionId) where T : class
        {
            return await _assignmentSPs.GetAssignmentByElementIdAsync<AssignmentByElementIdDTO>(questionId:questionId);
        }
    }
}
