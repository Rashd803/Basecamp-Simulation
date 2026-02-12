using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System.Linq;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for comments.
    /// </summary>
    public class CommentBs
    {
        private readonly CommentSPs _commentSPs;
        private readonly NoteFilesSPs _fileSPs;
     

        /// <summary>
        /// Initializes a new instance of the <see cref="CommentBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public CommentBs()
        {
            
        }

        /// <summary>
        /// Adds a new comment to a card.
        /// This method centralizes the business logic for adding comment to cards, providing a clean interface to the data access layer.
        /// </summary>
        /// <param name="memberId">The ID of the member adding the comment.</param>
        /// <param name="noteText">The text of the comment.</param>
        /// <param name="cardId">The ID of the card.</param>
        /// <param name="urlLink">A URL link associated with the comment (optional).</param>
        public async Task AddCommentToCardAsync(int memberId, int cardId, string? noteText = null, string? urlLink = null, Dictionary<string, string>? files = null)
        {
            // Validate the inputs before proceeding
            bool hasFiles = files != null && files.Any();
            if (string.IsNullOrEmpty(noteText) && string.IsNullOrEmpty(urlLink) && !hasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _commentSPs.AddCommentAsync(
                         memberId,
                         noteText,
                         cardId: cardId, // Named argument for clarity
                         urlLink: urlLink);

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
        /// Adds a new comment to a document.
        /// This method centralizes the business logic for adding comment to documents, providing a clean interface to the data access layer.
        /// </summary>
        /// <param name="memberId">The ID of the member adding the comment.</param>
        /// <param name="noteText">The text of the comment.</param>
        /// <param name="docId">The ID of the  document.</param>
        /// <param name="urlLink">A URL link associated with the comment (optional).</param>
        public async Task AddCommentToDocumentAsync(int memberId, string noteText, int docId, string? urlLink = null, Dictionary<string,string>? files = null)
        {
            // Validate the inputs before proceeding
            bool hasFiles = files != null && files.Any();
            if (string.IsNullOrEmpty(noteText) && string.IsNullOrEmpty(urlLink) && !hasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _commentSPs.AddCommentAsync(
                         memberId,
                         noteText,
                         documentId: docId, // Named argument for clarity
                         urlLink: urlLink);

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
        /// Adds a new comment to an event.
        /// This method centralizes the business logic for adding comment to events, providing a clean interface to the data access layer.
        /// </summary>
        /// <param name="memberId">The ID of the member adding the comment.</param>
        /// <param name="noteText">The text of the comment.</param>
        /// <param name="eventId">The ID of the event.</param>
        /// <param name="urlLink">A URL link associated with the comment (optional).</param>
        public async Task AddCommentToEventAsync(int memberId, string noteText, int eventId, string? urlLink = null, Dictionary<string, string>? files = null)
        {
            // Validate the inputs before proceeding
            bool hasFiles = files != null && files.Any();
            if (string.IsNullOrEmpty(noteText) && string.IsNullOrEmpty(urlLink) && !hasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _commentSPs.AddCommentAsync(
                         memberId,
                         noteText,
                         eventId: eventId, // Named argument for clarity
                         urlLink: urlLink);

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
        /// Adds a new comment to a message.
        /// This method centralizes the business logic for adding comment to messges, providing a clean interface to the data access layer.
        /// </summary>
        /// <param name="memberId">The ID of the member adding the comment.</param>
        /// <param name="noteText">The text of the comment.</param>
        /// <param name="messageId">The ID of the message.</param>
        /// <param name="urlLink">A URL link associated with the comment (optional).</param>
        public async Task AddCommentToMessageAsync(int memberId, string noteText, int messageId, string? urlLink = null, Dictionary<string, string>? files = null)
        {
            // Validate the inputs before proceeding
            bool hasFiles = files != null && files.Any();
            if (string.IsNullOrEmpty(noteText) && string.IsNullOrEmpty(urlLink) && !hasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _commentSPs.AddCommentAsync(
                         memberId,
                         noteText,
                         messageId: messageId, // Named argument for clarity
                         urlLink: urlLink);

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
        /// Adds a new comment to a step.
        /// This method centralizes the business logic for adding comment to steps, providing a clean interface to the data access layer.
        /// </summary>
        /// <param name="memberId">The ID of the member adding the comment.</param>
        /// <param name="noteText">The text of the comment.</param>
        /// <param name="stepId">The ID of the step.</param>
        /// <param name="urlLink">A URL link associated with the comment (optional).</param>
        public async Task AddCommentToStepAsync(int memberId, string noteText, int stepId, string? urlLink = null, Dictionary<string, string>? files = null)
        {
            // Validate the inputs before proceeding
            bool hasFiles = files != null && files.Any();
            if (string.IsNullOrEmpty(noteText) && string.IsNullOrEmpty(urlLink) && !hasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _commentSPs.AddCommentAsync(
                         memberId,
                         noteText,
                         stepId: stepId, // Named argument for clarity
                         urlLink: urlLink);

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
        /// Adds a new comment to a to-do.
        /// This method centralizes the business logic for adding comment to to-dos, providing a clean interface to the data access layer.
        /// </summary>
        /// <param name="memberId">The ID of the member adding the comment.</param>
        /// <param name="noteText">The text of the comment.</param>
        /// <param name="to_doId">The ID of the to-do.</param>
        /// <param name="urlLink">A URL link associated with the comment (optional).</param>
        public async Task AddCommentToTo_DoAsync(int memberId, string noteText, int to_doId, string? urlLink = null, Dictionary<string, string>? files = null)
        {
            // Validate the inputs before proceeding
            bool hasFiles = files != null && files.Any();
            if (string.IsNullOrEmpty(noteText) && string.IsNullOrEmpty(urlLink) && !hasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _commentSPs.AddCommentAsync(
                         memberId,
                         noteText,
                         todoId: to_doId, // Named argument for clarity
                         urlLink: urlLink);

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
        /// Updates an existing comment.
        /// This business logic method ensures that comment updates are handled consistently and correctly.
        /// </summary>
        /// <param name="commentId">The ID of the comment to update.</param>
        /// <param name="noteText">The updated text of the comment (optional).</param>
        /// <param name="urlLink">The updated URL link (optional).</param>
        /// <param name="fileIdstodelete">The IDs of the files associated with the comment (optional).</param>
        public async Task UpdateCommentAsync(int commentId, string? noteText = null, string? urlLink = null, List<int>? fileIdstodelete = null, Dictionary<string,string>? files = null)
        {
            bool hasFiles = files != null && files.Any();
            ProjectComment comment = await _commentSPs.GetCommentByCommentIdAsync<ProjectComment>(commentId);

            if (comment == null)
            {
                throw new Exception("Comment not found.");
            }

            if (noteText != null || urlLink != null)
            {
                await _commentSPs.UpdateCommentAsync(commentId, noteText, urlLink);
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

                        await _fileSPs.AddFileAsync(comment.NoteId, file.Value, file.Key);
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
        /// Deletes a comment.
        /// This method provides a clear, business-focused interface for deleting a comment.
        /// </summary>
        /// <param name="commentId">The ID of the comment to delete.</param>
        public async Task DeleteCommentAsync(int commentId)
        {
            await _commentSPs.DeleteCommentAsync(commentId);
        }

        /// <summary>
        /// Retrieves all comments for a given element ID.
        /// This method fetches comment data and can be extended to include additional business logic, such as filtering or sorting.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="eventId">The ID of the event (optional).</param>
        /// <param name="toDoId">The ID of the to-do item (optional).</param>
        /// <param name="stepId">The ID of the step (optional).</param>
        /// <param name="messageId">The ID of the message (optional).</param>
        /// <param name="documentId">The ID of the document (optional).</param>
        /// <param name="cardId">The ID of the card (optional).</param>
        /// <returns>A list of comments for the specified element.</returns>
        public async Task<List<T>> GetCommentByElementIDAsync<T>(int? eventId = null, int? toDoId = null, int? stepId = null, int? messageId = null, int? documentId = null, int? cardId = null) where T : class
        {
            return await _commentSPs.GetCommentByElementIDAsync<T>(eventId, toDoId, stepId, messageId, documentId, cardId);
        }
    }
}
