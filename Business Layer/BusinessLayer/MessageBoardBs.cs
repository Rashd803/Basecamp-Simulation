using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;
using DataAccessLayer.StoredProceduresRepository;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for message boards.
    /// </summary>
    public class MessageBoardBs
    {
        AppDbContext _Context;

        private readonly MessageBoardSPs _MessageBoardSPs;
        private readonly NoteFilesSPs _FileSPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="MessageBoardBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public MessageBoardBs(AppDbContext context)
        {
            _Context = context;
            _MessageBoardSPs = new MessageBoardSPs(context);
            _FileSPs = new NoteFilesSPs(context);
        }

        /// <summary>
        /// Adds a new message to the message board.
        /// This method centralizes the logic for creating a message, ensuring all business rules are applied.
        /// </summary>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="title">The title of the message.</param>
        /// <param name="memberId">The ID of the member posting the message.</param>
        /// <param name="isPrivate">Indicates whether the message is private.</param>
        /// <param name="noteText">The text of an associated note (optional).</param>
        /// <param name="urlLink">A URL link for the note (optional).</param>
        /// <param name="files">Files to be associated with the note (optional).</param>       

        public async Task AddMessageToBoardAsync(int ProjectId, string? Title, int MemberId, bool IsPrivate, string? NoteText = null, string? UrlLink = null, Dictionary<string, string>? Files = null)

        { // Validate the inputs before proceeding
            bool HasFiles = Files != null && Files.Any();
            if (string.IsNullOrEmpty(NoteText) && string.IsNullOrEmpty(UrlLink) && !HasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _MessageBoardSPs.AddMessageToBoardAsync(
                         ProjectId,
                         Title,
                         MemberId,
                         IsPrivate,
                         NoteText,
                         UrlLink);

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
        /// Updates an existing message on the message board.
        /// This business logic method ensures that all updates to messages are consistent and valid.
        /// </summary>
        /// <param name="messageBoardId">The ID of the message to update.</param>
        /// <param name="title">The updated title of the message.</param>
        /// <param name="isPrivate">The updated privacy status of the message.</param>
        /// <param name="noteText">The updated text of the associated note (optional).</param>
        /// <param name="urlLink">The updated URL link for the note (optional).</param>
        /// <param name="fileIdstodelete">The IDs of the files associated with the comment (optional).</param>
        /// <param name="files">Files associated with the comment (optional).</param>

        public async Task UpdateMessageInBoardAsync(int MessageBoardId, string Title, bool IsPrivate, string? NoteText = null, string? UrlLink = null, Dictionary<string, string>? Files = null, List<int>? FileIdsToDelete = null)
        {
            bool HasFiles = Files != null && Files.Any();
            MessageBoard MessageBoard = (MessageBoard)_Context.MessageBoards.Select(m => m.Id == MessageBoardId);

            if (MessageBoard == null)
            {
                throw new Exception("Message not found.");
            }

            if (NoteText != null || UrlLink != null)
            {
                await _MessageBoardSPs.UpdateMessageInBoardAsync(MessageBoardId, Title, IsPrivate, NoteText, UrlLink);
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

                        await _FileSPs.AddFileAsync(MessageBoard.NoteId, File.Value, File.Key);
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
        /// Deletes a message from the message board.
        /// This method provides a clear, business-focused interface for deleting a message.
        /// </summary>
        /// <param name="messageBoardId">The ID of the message to delete.</param>
        public async Task DeleteMessageInBoardAsync(int MessageId)
        {
            MessageBoard? MessageBoard = await _Context.MessageBoards.FindAsync(MessageId);

            if (MessageBoard == null)
            {
                throw new Exception("Message not found.");
            }
            else
                await _MessageBoardSPs.DeleteMessageInBoardAsync(MessageId);
        }

        /// <summary>
        /// Retrieves a message from the message board by its ID.
        /// This method fetches a single message and can be used to apply additional business rules.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="messageBoardId">The ID of the message to retrieve.</param>
        /// <returns>The message with the specified ID.</returns>
        public async Task<MessageBoardByMessageIdDTO?> GetMessageBoardByMessageIdAsync<T>(int MessageId) where T : class
        {
            MessageBoard? MessageBoard = await _Context.MessageBoards.FindAsync(MessageId);

            if (MessageBoard == null)
            {
                throw new Exception("Message not found.");
            }
            else
                return await _MessageBoardSPs.GetMessageBoardByMessageIdAsync<MessageBoardByMessageIdDTO>(MessageId);
        }

        /// <summary>
        /// Retrieves all messages from the message board for a given project ID.
        /// This method fetches message data from the data access layer and enables further business processing.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="memberOrClient">Indicates whether the user is a member or a client.</param>
        /// <returns>A list of messages for the specified project.</returns>
        public async Task<List<MessageBoardByProjectIdDTO>> GetMessageBoardByProjectIdAsync<T>(int ProjectId, bool MemberOrClient) where T : class
        {
            Project? Project = await _Context.Projects.FindAsync(ProjectId);

            if (Project == null)
            {
                throw new Exception("Project not found.");
            }
            else
                return await _MessageBoardSPs.GetMessageBoardByProjectIdAsync<MessageBoardByProjectIdDTO>(ProjectId, MemberOrClient);
        }
    }
}
