using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for answers.
    /// </summary>
    public class AnswerBs
    {
        private readonly AppDbContext _context;
        private readonly AnswerSPs _answerSPs;
        private  NoteFilesSPs _fileSPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="AnswerBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public AnswerBs(AppDbContext context)
        {
            _context = context;
            _answerSPs = new AnswerSPs(context);
            _fileSPs = new NoteFilesSPs(context);
        }

        /// <summary>
        /// Adds a new answer to a question.
        /// This method encapsulates the logic for adding an answer, abstracting the data access details.
        /// </summary>
        /// <param name="memberId">The ID of the member adding the answer.</param>
        /// <param name="questionId">The ID of the question being answered.</param>
        /// <param name="answerText">The text of the answer (Optional).</param>
        /// <param name="urlLink">A URL link associated with the answer (Optional).</param>
        /// <param name="files">Files associated with the answer (Optional).</param>
        public async Task AddAnswerAsync(int memberId, int questionId, int projectId, string? answerText = null, string? urlLink = null, Dictionary<string, string>? files = null)
        {// Validate the inputs before proceeding
            bool hasFiles = files != null && files.Any();
            if (string.IsNullOrEmpty(answerText) && string.IsNullOrEmpty(urlLink) && !hasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _answerSPs.AddAnswerAsync(

                        memberId: memberId,
                        questionId: questionId,
                         answerText: answerText,
                         urllink: urlLink);

                    if (NewNoteID > 0 && hasFiles)
                    {
                        // Add files to the newly created note
                        foreach (var file in files!)
                        {

                            await _fileSPs.AddFileAsync(NewNoteID, file.Value, file.Key);
                        }
                    }
                    else
                    {
                        return;
                    }
                }
                catch (Exception ex)
                {

                    throw;
                }
            }
        }

        /// <summary>
        /// Updates an existing answer.
        /// This business logic method orchestrates the update of an answer by calling the corresponding data access layer method.
        /// </summary>
        /// <param name="answerId">The ID of the answer to update.</param>
        /// <param name="answerText">The updated text of the answer.</param>
        /// <param name="urlLink">The updated URL link associated with the answer.</param>
        /// <param name="fileIdstodelete">The IDs of the files associated with the comment (optional).</param>
        /// <param name="files">Files associated with the answer (Optional).</param>

        public async Task UpdateAnswerAsync(int answerId, string? answerText = null, string? urlLink = null, Dictionary<string, string>? files = null, List<int>? fileIdstodelete = null)
        {
            bool hasFiles = files != null && files.Any();
            Answer? answer = await _answerSPs.GetAnswerByAnswerIdAsync<Answer>(answerId);

            if (answer == null)
            {
                throw new Exception("Answer not found.");
            }

            if (answerText != null || urlLink != null)
            {
                await _answerSPs.UpdateAnswerAsync(answerId, answerText, urlLink);
            }

            if (fileIdstodelete != null && fileIdstodelete.Any())
            {
                foreach (var id in fileIdstodelete)
                {
                    await _fileSPs.DeleteFileAsync(id);
                }
            }

            try
            {

                if (hasFiles)
                {

                    // Add files to the selected created note
                    foreach (var file in files!)
                    {

                        await _fileSPs.AddFileAsync(answer.NoteId, file.Value, file.Key);
                    }
                }
                else
                {
                    return;
                }
            }

            catch (Exception ex)
            {

                throw;
            }
        }

        /// <summary>
        /// Deletes an answer.
        /// This method provides a business-level interface for deleting an answer, promoting loose coupling.
        /// </summary>
        /// <param name="answerId">The ID of the answer to delete.</param>
        public async Task DeleteAnswerAsync(int answerId)
        {
            Answer? answer = await _context.Anwers.FindAsync(answerId);

            if(answer == null)
            {
                throw new Exception("Answer not found");
            }
            else
                await _answerSPs.DeleteAnswerAsync(answerId);
        }

        /// <summary>
        /// Retrieves all answers for a given question ID.
        /// This method fetches data through the data access layer and can be extended to include additional business rules.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="questionId">The ID of the question.</param>
        /// <returns>A list of answers for the specified question.</returns>
        public async Task<List<AnswerByQuestionIdDTO>> GetAnswerByQuestionIdAsync<T>(int questionId) where T : class
        {
            Question? answer = await _context.Questions.FindAsync(questionId);

            if (answer == null)
            {
                throw new Exception("Question not found");
            }
            else
                return await _answerSPs.GetAnswerByQuestionIdAsync<AnswerByQuestionIdDTO>(questionId);
        }

       
    }
}
