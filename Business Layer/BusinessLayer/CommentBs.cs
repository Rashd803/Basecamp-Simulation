using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;
using DataAccessLayer.StoredProceduresRepository;
using System.ComponentModel.Design;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for comments.
    /// </summary>
    public class CommentBs
    {
        private readonly AppDbContext _Context;
        private readonly CommentSPs _CommentSPs;
        private readonly NoteFilesSPs _FileSPs;


        /// <summary>
        /// Initializes a new instance of the <see cref="CommentBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public CommentBs(AppDbContext context)
        {
            _Context = context;
            _CommentSPs = new CommentSPs(context);
            _FileSPs = new NoteFilesSPs(context);

        }

        /// <summary>
        /// Adds a new comment to a card.
        /// This method centralizes the business logic for adding comment to cards, providing a clean interface to the data access layer.
        /// </summary>
        /// <param name="memberId">The ID of the member adding the comment.</param>
        /// <param name="noteText">The text of the comment.</param>
        /// <param name="cardId">The ID of the card.</param>
        /// <param name="urlLink">A URL link associated with the comment (optional).</param>
        /// <param name="files">Files associated with the comment (optional).</param>

        public async Task AddCommentToCardAsync(int MemberId, int CardId, string? NoteText = null, string? UrlLink = null, Dictionary<string, string>? Files = null)
        {
            // Validate the inputs before proceeding
            bool HasFiles = Files != null && Files.Any();
            if (string.IsNullOrEmpty(NoteText) && string.IsNullOrEmpty(UrlLink) && !HasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _CommentSPs.AddCommentAsync(
                         MemberId,
                         NoteText,
                         cardId: CardId, // Named argument for clarity
                         urlLink: UrlLink);

                    if (NewNoteID > 0 && HasFiles)
                    {
                        // Add files to the newly created note
                        foreach (var File in Files!)
                        {

                            await _FileSPs.AddFileAsync(NewNoteID, File.Value, File.Key);
                        }
                    }
                    else
                    {
                        return;
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }

        /// <summary>
        /// Adds a new comment to a document.
        /// This method centralizes the business logic for adding comment to documents, providing a clean interface to the data access layer.
        /// </summary>
        /// <param name="memberId">The ID of the member adding the comment.</param>
        /// <param name="noteText">The text of the comment.</param>
        /// <param name="docId">The ID of the  document.</param>
        /// <param name="urlLink">A URL link associated with the comment (optional).</param>
        /// <param name="files">Files associated with the comment (optional).</param>

        public async Task AddCommentToDocumentAsync(int MemberId, string NoteText, int DocId, string? UrlLink = null, Dictionary<string, string>? Files = null)
        {
            // Validate the inputs before proceeding
            bool HasFiles = Files != null && Files.Any();
            if (string.IsNullOrEmpty(NoteText) && string.IsNullOrEmpty(UrlLink) && !HasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _CommentSPs.AddCommentAsync(
                         MemberId,
                         NoteText,
                         documentId: DocId, // Named argument for clarity
                         urlLink: UrlLink);

                    if (NewNoteID > 0 && HasFiles)
                    {
                        // Add files to the newly created note
                        foreach (var File in Files!)
                        {

                            await _FileSPs.AddFileAsync(NewNoteID, File.Value, File.Key);
                        }
                    }
                    else
                    {
                        return;
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }


        /// <summary>
        /// Adds a new comment to an event.
        /// This method centralizes the business logic for adding comment to events, providing a clean interface to the data access layer.
        /// </summary>
        /// <param name="memberId">The ID of the member adding the comment.</param>
        /// <param name="noteText">The text of the comment.</param>
        /// <param name="eventId">The ID of the event.</param>
        /// <param name="urlLink">A URL link associated with the comment (optional).</param>
        /// <param name="files">Files associated with the comment (optional).</param>

        public async Task AddCommentToEventAsync(int MemberId, string NoteText, int EventId, string? UrlLink = null, Dictionary<string, string>? Files = null)
        {
            // Validate the inputs before proceeding
            bool HasFiles = Files != null && Files.Any();
            if (string.IsNullOrEmpty(NoteText) && string.IsNullOrEmpty(UrlLink) && !HasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _CommentSPs.AddCommentAsync(
                         MemberId,
                         NoteText,
                         eventId: EventId, // Named argument for clarity
                         urlLink: UrlLink);

                    if (NewNoteID > 0 && HasFiles)
                    {
                        // Add files to the newly created note
                        foreach (var File in Files!)
                        {

                            await _FileSPs.AddFileAsync(NewNoteID, File.Value, File.Key);
                        }
                    }
                    else
                    {
                        return;
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }


        /// <summary>
        /// Adds a new comment to a message.
        /// This method centralizes the business logic for adding comment to messges, providing a clean interface to the data access layer.
        /// </summary>
        /// <param name="memberId">The ID of the member adding the comment.</param>
        /// <param name="noteText">The text of the comment.</param>
        /// <param name="messageId">The ID of the message.</param>
        /// <param name="urlLink">A URL link associated with the comment (optional).</param>
        /// <param name="files">Files associated with the comment (optional).</param>

        public async Task AddCommentToMessageAsync(int MemberId, string NoteText, int MessageId, string? UrlLink = null, Dictionary<string, string>? Files = null)
        {
            // Validate the inputs before proceeding
            bool HasFiles = Files != null && Files.Any();
            if (string.IsNullOrEmpty(NoteText) && string.IsNullOrEmpty(UrlLink) && !HasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _CommentSPs.AddCommentAsync(
                         MemberId,
                         NoteText,
                         messageId: MessageId, // Named argument for clarity
                         urlLink: UrlLink);

                    if (NewNoteID > 0 && HasFiles)
                    {
                        // Add files to the newly created note
                        foreach (var File in Files!)
                        {

                            await _FileSPs.AddFileAsync(NewNoteID, File.Value, File.Key);
                        }
                    }
                    else
                    {
                        return;
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }

        /// <summary>
        /// Adds a new comment to a step.
        /// This method centralizes the business logic for adding comment to steps, providing a clean interface to the data access layer.
        /// </summary>
        /// <param name="memberId">The ID of the member adding the comment.</param>
        /// <param name="noteText">The text of the comment.</param>
        /// <param name="stepId">The ID of the step.</param>
        /// <param name="urlLink">A URL link associated with the comment (optional).</param>
        /// <param name="files">Files associated with the comment (optional).</param>

        public async Task AddCommentToStepAsync(int MemberId, string NoteText, int StepId, string? UrlLink = null, Dictionary<string, string>? Files = null)
        {
            // Validate the inputs before proceeding
            bool HasFiles = Files != null && Files.Any();
            if (string.IsNullOrEmpty(NoteText) && string.IsNullOrEmpty(UrlLink) && !HasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _CommentSPs.AddCommentAsync(
                         MemberId,
                         NoteText,
                         stepId: StepId, // Named argument for clarity
                         urlLink: UrlLink);

                    if (NewNoteID > 0 && HasFiles)
                    {
                        // Add files to the newly created note
                        foreach (var File in Files!)
                        {

                            await _FileSPs.AddFileAsync(NewNoteID, File.Value, File.Key);
                        }
                    }
                    else
                    {
                        return;
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }

        /// <summary>
        /// Adds a new comment to a to-do.
        /// This method centralizes the business logic for adding comment to to-dos, providing a clean interface to the data access layer.
        /// </summary>
        /// <param name="memberId">The ID of the member adding the comment.</param>
        /// <param name="noteText">The text of the comment.</param>
        /// <param name="to_doId">The ID of the to-do.</param>
        /// <param name="urlLink">A URL link associated with the comment (optional).</param>
        /// <param name="files">Files associated with the comment (optional).</param>
        public async Task AddCommentToTo_DoAsync(int MemberId, string NoteText, int ToDoId, string? UrlLink = null, Dictionary<string, string>? Files = null)
        {
            // Validate the inputs before proceeding
            bool HasFiles = Files != null && Files.Any();
            if (string.IsNullOrEmpty(NoteText) && string.IsNullOrEmpty(UrlLink) && !HasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _CommentSPs.AddCommentAsync(
                         MemberId,
                         NoteText,
                         todoId: ToDoId, // Named argument for clarity
                         urlLink: UrlLink);

                    if (NewNoteID > 0 && HasFiles)
                    {
                        // Add files to the newly created note
                        foreach (var File in Files!)
                        {

                            await _FileSPs.AddFileAsync(NewNoteID, File.Value, File.Key);
                        }
                    }
                    else
                    {
                        return;
                    }
                }
                catch (Exception)
                {

                    throw;
                }
            }
        }

        /// <summary>
        /// Updates an existing comment.
        /// This business logic method ensures that comment updates are handled consistently and correctly.
        /// </summary>
        /// <param name="commentId">The ID of the comment to update.</param>
        /// <param name="noteText">The updated text of the comment (optional).</param>
        /// <param name="urlLink">The updated URL link (optional).</param>
        /// <param name="fileIdstodelete">The IDs of the files associated with the comment (optional).</param>
        /// <param name="files">Files associated with the comment (optional).</param>

        public async Task UpdateCommentAsync(int CommentId, string? NoteText = null, string? UrlLink = null, List<int>? FileIdsToDelete = null, Dictionary<string, string>? Files = null)
        {
            bool HasFiles = Files != null && Files.Any();
            ProjectComment? Comment = await _Context.Comments.FindAsync(CommentId);

            if (Comment == null)
            {
                throw new Exception("Comment not found.");
            }

            if (NoteText != null || UrlLink != null)
            {
                await _CommentSPs.UpdateCommentAsync(CommentId, NoteText, UrlLink);
            }

            if (FileIdsToDelete != null && FileIdsToDelete.Any())
            {
                foreach (var Id in FileIdsToDelete)
                {
                    await _FileSPs.DeleteFileAsync(Id);
                }
            }

            try
            {

                if (HasFiles)
                {

                    // Add files to the selected created note
                    foreach (var File in Files!)
                    {

                        await _FileSPs.AddFileAsync(Comment.NoteId, File.Value, File.Key);
                    }
                }
                else
                {
                    return;
                }
            }

            catch (Exception)
            {

                throw;
            }

        }

        /// <summary>
        /// Deletes a comment.
        /// This method provides a clear, business-focused interface for deleting a comment.
        /// </summary>
        /// <param name="commentId">The ID of the comment to delete.</param>
        public async Task DeleteCommentAsync(int CommentId)
        {
            ProjectComment? Comment = await _Context.Comments.FindAsync(CommentId);

            if (Comment == null)
            {
                throw new Exception("Comment not found.");
            }
            else
                await _CommentSPs.DeleteCommentAsync(CommentId);
        }

        /// <summary>
        /// Retrieves all comments for a given event ID.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="eventId">The ID of the event.</param>
        /// <returns>A list of comments for the specified event.</returns>
        public async Task<List<CommentByElementIDDTO>> GetCommentsByEventIDAsync<T>(int EventId) where T : class
        {
            Event? Event = await _Context.Events.FindAsync(EventId);

            if (Event == null)
            {
                throw new Exception("Event not found.");
            }
            else
                return await _CommentSPs.GetCommentByElementIDAsync<CommentByElementIDDTO>(eventId: EventId);
        }


        /// <summary>
        /// Retrieves all comments for a given to-do ID.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="todoId">The ID of the event.</param>
        /// <returns>A list of comments for the specified to-do.</returns>
        public async Task<List<CommentByElementIDDTO>> GetCommentsByTo_DoIDAsync<T>(int TodoId) where T : class
        {
            ToDo? ToDo = await _Context.ToDos.FindAsync(TodoId);

            if (ToDo == null)
            {
                throw new Exception("ToDo not found.");
            }
            else
                return await _CommentSPs.GetCommentByElementIDAsync<CommentByElementIDDTO>(toDoId: TodoId);
        }

        /// <summary>
        /// Retrieves all comments for a given card ID.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="cardId">The ID of the event.</param>
        /// <returns>A list of comments for the specified card.</returns>
        public async Task<List<CommentByElementIDDTO>> GetCommentByCardIDAsync<T>(int CardId) where T : class
        {
            Card? Card = await _Context.Cards.FindAsync(CardId);

            if (Card == null)
            {
                throw new Exception("Card not found.");
            }
            else
                return await _CommentSPs.GetCommentByElementIDAsync<CommentByElementIDDTO>(cardId: CardId);
        }

        /// <summary>
        /// Retrieves all comments for a given message ID.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="messageId">The ID of the event.</param>
        /// <returns>A list of comments for the specified message.</returns>
        public async Task<List<CommentByElementIDDTO>> GetCommentsByMessageIDAsync<T>(int MessageId) where T : class
        {
            MessageBoard? Message = await _Context.MessageBoards.FindAsync(MessageId);

            if (Message == null)
            {
                throw new Exception("Message not found.");
            }
            else
                return await _CommentSPs.GetCommentByElementIDAsync<CommentByElementIDDTO>(messageId: MessageId);
        }

        /// <summary>
        /// Retrieves all comments for a given document ID.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="DocumentID">The ID of the event.</param>
        /// <returns>A list of comments for the specified document.</returns>
        public async Task<List<CommentByElementIDDTO>> GetCommentsByDocumentIDAsync<T>(int DocumentID) where T : class
        {
            Document? Document = await _Context.Documents.FindAsync(DocumentID);

            if (Document == null)
            {
                throw new Exception("Document not found.");
            }
            else
                return await _CommentSPs.GetCommentByElementIDAsync<CommentByElementIDDTO>(documentId: DocumentID);
        }

        /// <summary>
        /// Retrieves all comments for a given to-do ID.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="stepId">The ID of the event (optional).</param>
        /// <returns>A list of comments for the specified to-do.</returns>
        public async Task<List<CommentByElementIDDTO>> GetCommentsByStepIDAsync<T>(int StepId) where T : class
        {
            Step? Step = await _Context.Steps.FindAsync(StepId);

            if (Step == null)
            {
                throw new Exception("Step not found.");
            }
            else
                return await _CommentSPs.GetCommentByElementIDAsync<CommentByElementIDDTO>(stepId: StepId);
        }
    }
}
