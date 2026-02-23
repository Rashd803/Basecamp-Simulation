using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for questions.
    /// </summary>
    public class QuestionBs
    {
        private readonly AppDbContext _context;
        private readonly QuestionSPs _questionSPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="QuestionBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public QuestionBs(AppDbContext context)
        {
            _context = context;
            _questionSPs = new QuestionSPs(context);
        }

        /// <summary>
        /// Adds a new question to a project.
        /// This method centralizes the logic for creating a question, ensuring all business rules are applied.
        /// </summary>
        /// <param name="memberId">The ID of the member asking the question.</param>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="text">The text of the question.</param>
        /// <param name="fromdate">The start date for the question's relevance.</param>
        /// <param name="todate">The end date for the question's relevance.</param>
        /// <param name="isprivate">Indicates whether the question is private.</param>
        public async Task AddQuestionAsync(int memberId, int projectId, string text, DateTime fromdate, DateTime todate, bool isprivate)
        {
            Project? Project = await _context.Projects.FindAsync(projectId);
            if (projectId >= 0 || Project == null)
            {
                throw new Exception("Project not found");

            }
            else
                await _questionSPs.AddQuestionAsync(memberId, projectId, text, fromdate, todate, isprivate);
        }

        /// <summary>
        /// Updates an existing question.
        /// This business logic method ensures that all updates to questions are consistent and valid.
        /// </summary>
        /// <param name="questionId">The ID of the question to update.</param>
        /// <param name="text">The updated text of the question.</param>
        /// <param name="fromdate">The updated start date for the question's relevance.</param>
        /// <param name="todate">The updated end date for the question's relevance.</param>
        /// <param name="isprivate">The updated privacy status of the question.</param>
        public async Task UpdateQuestionAsync(int questionId, string text, DateTime fromdate, DateTime todate, bool isprivate)
        {
            Question? Question = await _context.Questions.FindAsync(questionId);
            if (Question == null)
            {
                throw new Exception("Question not found");
            }
            else
                await _questionSPs.UpdateQuestionAsync(questionId, text, fromdate, todate, isprivate);
        }

        /// <summary>
        /// Deletes a question.
        /// This method provides a clear, business-focused interface for deleting a question.
        /// </summary>
        /// <param name="questionId">The ID of the question to delete.</param>
        public async Task DeleteQuestionAsync(int questionId)
        {
            Question? Question = await _context.Questions.FindAsync(questionId);
            if (Question == null)
            {
                throw new Exception("Question not found");
            }
            else
                await _questionSPs.DeleteQuestionAsync(questionId);
        }

        /// <summary>
        /// Retrieves all questions for a given project ID.
        /// This method fetches question data from the data access layer and enables further business processing.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="memberorclient">Indicates whether the user is a member or a client.</param>
        /// <returns>A list of questions for the specified project.</returns>
        public async Task<List<QuestionByProjectIdDTO>> GetQuestionByProjectIdAsync<T>(int projectId, bool memberorclient) where T : class
        {
            Project? Question = await _context.Projects.FindAsync(projectId);
            if (Question == null)
            {
                throw new Exception("Question not found");
            }
            else
                return await _questionSPs.GetQuestionByProjectIdAsync<QuestionByProjectIdDTO>(projectId, memberorclient);
        }

        /// <summary>
        /// Retrieves a question by its ID.
        /// This method fetches a single question and can be used to apply additional business rules.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="questionId">The ID of the question to retrieve.</param>
        /// <returns>The question with the specified ID.</returns>
        public async Task<QuestionByQuestionIdDTO?> GetQuestionByQuestionIdAsync<T>(int questionId) where T : class
        {
            Question? Question = await _context.Questions.FindAsync(questionId);
            if (Question == null)
            {
                throw new Exception("Question not found");
            }
            else
                return await _questionSPs.GetQuestionByQuestionIdAsync<QuestionByQuestionIdDTO>(questionId);
        }
    }
}
