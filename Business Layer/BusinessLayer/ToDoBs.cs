using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;
using DataAccessLayer.StoredProceduresRepository;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for to-do items.
    /// </summary>
    public class ToDoBs
    {

        private readonly AppDbContext _Context;
        private readonly ToDoSPs _ToDoSPs;
        private readonly NoteFilesSPs _FileSPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="ToDoBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public ToDoBs(AppDbContext context)
        {
            _Context = context;
            _ToDoSPs = new ToDoSPs(context);
            _FileSPs = new NoteFilesSPs(context);
        }

        /// <summary>
        /// Adds a new to-do item to a list.
        /// This method centralizes the logic for creating a to-do item, ensuring all business rules are applied.
        /// </summary>
        /// <param name="text">The text of the to-do item.</param>
        /// <param name="listId">The ID of the list to add the to-do item to.</param>
        /// <param name="memberId">The ID of the member creating the to-do item.</param>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="isPrivate">Indicates whether the to-do item is private.</param>
        /// <param name="fromDate">The start date of the to-do item (optional).</param>
        /// <param name="toDate">The end date of the to-do item (optional).</param>
        /// <param name="noteText">The text of an associated note (optional).</param>
        /// <param name="urlLink">A URL link for the note (optional).</param>
        /// <param name="files">Files to be added to the note (optional).</param>
        public async Task AddToDoToListAsync(string Text, int ListId, int MemberId, int ProjectId, bool IsPrivate, DateTime? FromDate = null, DateTime? ToDate = null, string? NoteText = null, string? UrlLink = null, Dictionary<string, string>? Files = null)

        { // Validate the inputs before proceeding
            bool HasFiles = Files != null && Files.Any();
            if (string.IsNullOrEmpty(NoteText) && string.IsNullOrEmpty(UrlLink) && !HasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _ToDoSPs.AddToDoToListAsync(
                         Text,
                         ListId,
                         MemberId,
                         ProjectId,
                         IsPrivate,
                         FromDate,
                         ToDate,
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
        /// Updates an existing to-do item.
        /// This business logic method ensures that all updates to to-do items are consistent and valid.
        /// </summary>
        /// <param name="toDoId">The ID of the to-do item to update.</param>
        /// <param name="text">The updated text of the to-do item.</param>
        /// <param name="isPrivate">The updated privacy status of the to-do item.</param>
        /// <param name="checkedValue">The updated checked status of the to-do item.</param>
        /// <param name="noteText">The updated text of the associated note (optional).</param>
        /// <param name="urlLink">The updated URL link for the note (optional).</param>
        /// <param name="fromDate">The updated start date of the to-do item (optional).</param>
        /// <param name="toDate">The updated end date of the to-do item (optional).</param>
        /// <param name="fileIdstodelete">The IDs of the files associated with the note (optional).</param>
        /// <param name="files">Files associated with the comment (optional).</param>

        public async Task UpdateToDoAsync(int ToDoId, string Text, bool IsPrivate, bool CheckedValue, string? NoteText = null, string? UrlLink = null, DateTime? FromDate = null, DateTime? ToDate = null, Dictionary<string, string>? Files = null, List<int>? FileIdsToDelete = null)
        {
            bool HasFiles = Files != null && Files.Any();
            ToDo Todo = (ToDo)_Context.ToDos.Select(td => td.Id == ToDoId);

            if (Todo == null)
            {
                throw new Exception("To-Do not found.");
            }

            if (NoteText != null || UrlLink != null)
            {
                await _ToDoSPs.UpdateToDoAsync(ToDoId, Text, IsPrivate, CheckedValue, NoteText, UrlLink, FromDate, ToDate);
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

                        await _FileSPs.AddFileAsync((int)Todo.NoteId, File.Value, File.Key);
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
        /// Deletes a to-do item.
        /// This method provides a clear, business-focused interface for deleting a to-do item.
        /// </summary>
        /// <param name="toDoId">The ID of the to-do item to delete.</param>
        public async Task DeleteToDoAsync(int ToDoId)
        {
            ToDo? Todo = await _Context.ToDos.FindAsync(ToDoId);

            if (Todo == null)
            {
                throw new Exception("To-Do not found.");
            }
            else
                await _ToDoSPs.DeleteToDoAsync(ToDoId);
        }

        /// <summary>
        /// Retrieves all to-do items for a given list ID.
        /// This method fetches to-do item data from the data access layer and enables further business processing.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="listId">The ID of the list.</param>
        /// <param name="memberorclient">Indicates whether the user is a client.</param>
        /// <returns>A list of to-do items for the specified list.</returns>
        public async Task<List<ToDoByListIdDTO>> GetToDoByListIdAsync<T>(int ListId, bool MemberOrClient) where T : class
        {
            List? List = await _Context.Lists.FindAsync(ListId);

            if (List == null)
            {
                throw new Exception("List not found.");
            }
            else
                return await _ToDoSPs.GetToDoByListIdAsync<ToDoByListIdDTO>(ListId, MemberOrClient);
        }

        /// <summary>
        /// Retrieves a to-do item by its ID.
        /// This method fetches a single to-do item and can be used to apply additional business rules.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="toDoId">The ID of the to-do item to retrieve.</param>
        /// <returns>The to-do item with the specified ID.</returns>
        public async Task<ToDoByToDoIdDTO?> GetToDoByToDoIdAsync<T>(int ToDoId) where T : class
        {
            ToDo? Todo = await _Context.ToDos.FindAsync(ToDoId);

            if (Todo == null)
            {
                throw new Exception("To-Do not found.");
            }
            else
                return await _ToDoSPs.GetToDoByToDoIdAsync<ToDoByToDoIdDTO>(ToDoId);
        }
    }
}
