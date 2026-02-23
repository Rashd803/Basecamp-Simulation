using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;
using System.ComponentModel.Design;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for lists.
    /// </summary>
    public class ListBs
    {

        private readonly AppDbContext _Context;

        private readonly ListSPs _ListSPs;
        private readonly NoteFilesSPs _FileSPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="ListBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public ListBs(AppDbContext context)
        {
            _Context = context;
            _ListSPs = new ListSPs(context);
            _FileSPs = new NoteFilesSPs(context);
        }

        /// <summary>
        /// Adds a new list to a project.
        /// This method centralizes the logic for creating a list, ensuring all business rules are applied.
        /// </summary>
        /// <param name="memberId">The ID of the member creating the list.</param>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="title">The title of the list.</param>
        /// <param name="isPrivate">Indicates whether the list is private.</param>
        /// <param name="noteText">The text of an associated note (optional).</param>
        /// <param name="urlLink">A URL link for the note (optional).</param>
        /// <param name="files">Files to be associated with the note (optional).</param>
        public async Task AddListAsync(int MemberId, int ProjectId, string Title, bool IsPrivate, string? NoteText = null, string? UrlLink = null, Dictionary<string, string>? Files = null)

        { // Validate the inputs before proceeding
            bool HasFiles = Files != null && Files.Any();
            if (string.IsNullOrEmpty(NoteText) && string.IsNullOrEmpty(UrlLink) && !HasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _ListSPs.AddListAsync(
                         MemberId,
                         ProjectId,
                         Title,
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
        /// Updates an existing list.
        /// This business logic method ensures that all updates to lists are consistent and valid.
        /// </summary>
        /// <param name="listId">The ID of the list to update.</param>
        /// <param name="title">The updated title of the list.</param>
        /// <param name="isPrivate">The updated privacy status of the list.</param>
        /// <param name="noteText">The updated text of the associated note (optional).</param>
        /// <param name="urlLink">The updated URL link for the note (optional).</param>
        /// <param name="fileIdstodelete">The IDs of the files associated with the comment (optional).</param>
        /// <param name="files">Files associated with the comment (optional).</param>

        public async Task UpdateListAsync(int ListId, string Title, bool IsPrivate, string? NoteText = null, string? UrlLink = null, Dictionary<string, string>? Files = null, List<int>? FileIdsToDelete = null)  
        {
                bool HasFiles = Files != null && Files.Any();
                List List = (List)_Context.Lists.Select(l => l.Id == ListId);

                if (List == null)
                {
                    throw new Exception("List not found.");
                }

                if (NoteText != null || UrlLink != null)
                {
                    await _ListSPs.UpdateListAsync(ListId, Title, IsPrivate, NoteText, UrlLink);
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

                            await _FileSPs.AddFileAsync((int)List.NoteId, File.Value, File.Key);
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
        /// Deletes a list.
        /// This method provides a clear, business-focused interface for deleting a list.
        /// </summary>
        /// <param name="listId">The ID of the list to delete.</param>
        public async Task DeleteListAsync(int ListId)
        {
            List List = (List)_Context.Lists.Select(l => l.Id == ListId);

            if (List == null)
            {
                throw new Exception("List not found.");
            }
            else
            {
                await _ListSPs.DeleteListAsync(ListId);
            }
        }

        /// <summary>
        /// Retrieves a list by its ID.
        /// This method fetches a single list and can be used to apply additional business rules.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="listId">The ID of the list to retrieve.</param>
        /// <returns>The list with the specified ID.</returns>
        public async Task<ListByListIdDTO?> GetListByListIdAsync<T>(int ListId) where T : class
        {
            List List = (List)_Context.Lists.Select(l => l.Id == ListId);

            if (List == null)
            {
                throw new Exception("List not found.");
            }
            else
                return await _ListSPs.GetListByListIdAsync<ListByListIdDTO>(ListId);
        }

        /// <summary>
        /// Retrieves all lists for a given project ID.
        /// This method fetches list data from the data access layer and enables further business processing.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="memberOrClient">Indicates whether the user is a member or a client.</param>
        /// <returns>A list of lists for the specified project.</returns>
        public async Task<List<ListByProjectIdDTO>> GetListByProjectIdAsync<T>(int ProjectId, bool MemberOrClient) where T : class
        {
            Project Project = (Project)_Context.Projects.Select(p => p.Id == ProjectId);

            if (Project == null)
            {
                throw new Exception("Project not found.");
            }
            else
                return await _ListSPs.GetListByProjectIdAsync<ListByProjectIdDTO>(ProjectId, MemberOrClient);
        }
    }
}
