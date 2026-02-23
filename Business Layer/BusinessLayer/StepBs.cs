using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for steps.
    /// </summary>
    public class StepBs
    {
        private readonly AppDbContext _context;
        private readonly StepSPs _stepSPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="StepBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public StepBs(AppDbContext context)
        {
            _context = context;
            _stepSPs = new StepSPs(context);
        }

        /// <summary>
        /// Adds a new step to a card.
        /// This method centralizes the logic for adding a step, ensuring all business rules are applied.
        /// </summary>
        /// <param name="memberId">The ID of the member adding the step.</param>
        /// <param name="cardId">The ID of the card to add the step to.</param>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="text">The text of the step.</param>
        public async Task AddStepToCardAsync(int memberId, int cardId, int projectId, string text)
        {
            if(cardId >= 0 || projectId >= 0 || memberId >= 0)
            {
                throw new Exception("Card/Project/Member not found");
            }
            else
                await _stepSPs.AddStepToCardAsync(memberId, cardId, projectId, text);
        }

        /// <summary>
        /// Updates an existing step.
        /// This business logic method ensures that all updates to steps are consistent and valid.
        /// </summary>
        /// <param name="stepId">The ID of the step to update.</param>
        /// <param name="text">The updated text of the step.</param>
        /// <param name="isChecked">The updated checked status of the step.</param>
        public async Task UpdateStepAsync(int stepId, string text, bool isChecked)
        {
            Step? Step = await _context.Steps.FindAsync(stepId);
            if (Step == null)
            {
                throw new Exception("Step not found");
            }
            else
                await _stepSPs.UpdateStepAsync(stepId, text, isChecked);
        }

        /// <summary>
        /// Deletes a step.
        /// This method provides a clear, business-focused interface for deleting a step.
        /// </summary>
        /// <param name="stepId">The ID of the step to delete.</param>
        public async Task DeleteStepAsync(int stepId)
        {
            Step? Step = await _context.Steps.FindAsync(stepId);
            if (Step == null)
            {
                throw new Exception("Step not found");
            }
            else
                await _stepSPs.DeleteStepAsync(stepId);
        }

        /// <summary>
        /// Retrieves all steps for a given card ID.
        /// This method fetches step data from the data access layer and enables further business processing.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="cardId">The ID of the card.</param>
        /// <returns>A list of steps for the specified card.</returns>
        public async Task<List<StepByCardIdDTO>> GetStepByCardIdAsync<T>(int cardId) where T : class
        {
            Card? Card = await _context.Cards.FindAsync(cardId);
            if (Card == null)
            {
                throw new Exception("Card not found");
            }
            else
                return await _stepSPs.GetStepByCardIdAsync<StepByCardIdDTO>(cardId);
        }
    }
}
