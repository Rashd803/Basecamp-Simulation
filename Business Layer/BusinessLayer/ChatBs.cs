using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;
using System;
using System.Threading.Tasks;

namespace BusinessLayer
{
    /// <summary>
    /// Provides arguments for the OnMessageAdded event.
    /// </summary>
    public class NewMessage 
    {
        /// <summary>
        /// Gets the ID of the project where the message was added.
        /// </summary>
        public int ProjectId { get; }

        /// <summary>
        /// Initializes a new instance of the <see cref="MessageAddedEventArgs"/> class.
        /// </summary>
        /// <param name="projectId">The ID of the project.</param>
        public NewMessage(int projectId)
        {
            ProjectId = projectId;
        }
    }


    /// <summary>
    /// Handles business logic for chat messages.
    /// </summary>
    public class ChatBs
    {
        private readonly AppDbContext _context;
        private readonly ChatSPs _chatSPs;

        /// <summary>
        /// Occurs when a new message is added to a chat.
        /// This event allows other parts of the application, such as a notification service,
        /// to react to new messages without being tightly coupled to the chat business logic.
        /// </summary>
        public event EventHandler<NewMessage>? OnMessageAdded;

        /// <summary>
        /// Initializes a new instance of the <see cref="ChatBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public ChatBs(AppDbContext context)
        {
            _context = context;
            _chatSPs = new ChatSPs(context);
        }

        /// <summary>
        /// Adds a message to the chat and raises the OnMessageAdded event.
        /// This method abstracts the data access details and orchestrates the business process
        /// of sending a message and notifying subscribers.
        /// </summary>
        /// <param name="text">The text of the message.</param>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="memberId">The ID of the member sending the message.</param>
        /// <param name="isPrivate">Indicates whether the message is private.</param>
        public async Task AddMessageToChatAsync(string text, int projectId, int memberId, bool isPrivate)
        {
            if(string.IsNullOrWhiteSpace(text)|| projectId <= 0 || memberId <= 0)
            {
                throw new ArgumentException("Message text/Member ID/ Project ID cannot be empty.", nameof(text));
            }
            else
                await _chatSPs.AddMessageToChatAsync(text, projectId, memberId, isPrivate);

            var NewMessage = new NewMessage(projectId);

            // Raise the event asynchronously if there are subscribers.
            // This notifies listeners that a new message has been posted.
            OnNewMessageAdded(NewMessage);
        }

        protected void OnNewMessageAdded(NewMessage NewMessage)
        {
            OnMessageAdded?.Invoke(this, NewMessage);
        }

        /// <summary>
        /// Subscribes the internal event handler to the <see cref="OnMessageAdded"/> event.
        /// This allows the class to automatically fetch the latest chat messages when a new message is added.
        /// </summary>
        public void SubscribeToNewMessages()
        {
            OnMessageAdded += GetChatByProjectIdAsync!;
        }

        /// <summary>
        /// Handles the <see cref="OnMessageAdded"/> event by fetching the latest chat messages for the project.
        /// This method can be extended to update the dashboard or notify other components as needed.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="NewMessage">The event data containing the project ID.</param>
        private async void GetChatByProjectIdAsync(object? sender, NewMessage NewMessage)
        {
            await GetChatByProjectIdAsync<ChatByProjectIdDTO>(NewMessage.ProjectId, true);
            // Additional logic to handle the retrieved messages can be added here.
        }

        /// <summary>
        /// Retrieves the chat history for a project.
        /// This business layer method fetches chat data and can be extended to apply filtering or other rules.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="memberOrClient">Indicates whether the user is a member or a client.</param>
        /// <returns>The chat history for the specified project.</returns>
        public async Task<List<ChatByProjectIdDTO>> GetChatByProjectIdAsync<T>(int projectId, bool memberOrClient) where T : class
        {
            return await _chatSPs.GetChatByProjectIdAsync<ChatByProjectIdDTO>(projectId, memberOrClient);
        }

        /// <summary>
        /// Updates a chat message.
        /// This method provides a business-level interface for updating a message.
        /// </summary>
        /// <param name="chatId">The ID of the chat message to update.</param>
        /// <param name="text">The updated text of the message.</param>
        /// <param name="isPrivate">The updated privacy status of the message.</param>
        public async Task UpdateChatAsync(int chatId, string text, bool isPrivate)
        {
            Chat? chat = await _context.Chats.FindAsync(chatId);

            if (chat == null)
            {
                throw new ArgumentException("Chat message not found.", nameof(chatId));
            }
            else if (string.IsNullOrWhiteSpace(text))
            {
                throw new ArgumentException("Message text cannot be empty.", nameof(text));
            }
            else
                await _chatSPs.UpdateChatAsync(chatId, text, isPrivate);
        }

        /// <summary>
        /// Deletes a message from the chat.
        /// This method encapsulates the logic for deleting a chat message.
        /// </summary>
        /// <param name="chatId">The ID of the chat message to delete.</param>
        public async Task DeleteMessageFromChatAsync(int chatId)
        {
            Chat? chat = await _context.Chats.FindAsync(chatId);

            if (chat == null)
            {
                throw new ArgumentException("Chat message not found.", nameof(chatId));
            }
            else
                await _chatSPs.DeleteMessageFromChatAsync(chatId);
        }
    }
}
