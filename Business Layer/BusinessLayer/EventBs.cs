using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;
using Microsoft.Extensions.Logging;
using System.ComponentModel.Design;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for events.
    /// </summary>
    public class EventBs
    {
        private readonly AppDbContext _Context;

        private readonly EventSPs _EventSPs;
        private readonly NoteFilesSPs _FileSPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="EventBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public EventBs(AppDbContext context)
        {
            _Context = context;
            _EventSPs = new EventSPs(context);
            _FileSPs = new NoteFilesSPs(context);
        }

        /// <summary>
        /// Adds a new event to a project.
        /// This method centralizes the logic for creating an event, ensuring all business rules are applied.
        /// </summary>
        /// <param name="name">The name of the event.</param>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="fromDate">The start date of the event.</param>
        /// <param name="toDate">The end date of the event.</param>
        /// <param name="isPrivate">Indicates whether the event is private.</param>
        /// <param name="memberId">The ID of the member creating the event.</param>
        /// <param name="urlLink">A URL link associated with the event (optional).</param>
        /// <param name="noteText">The text of an associated note (optional).</param>
        /// <param name="noteUrlLink">A URL link for the note (optional).</param>
        /// <param name="files">Files to be associated with the note (optional).</param>
        public async Task AddEventAsync(string Name, int ProjectId, DateTime FromDate, DateTime ToDate, bool IsPrivate, int MemberId, string? UrlLink = null, string? NoteText = null, string? NoteUrlLink = null, Dictionary<string,string>? Files = null)
        { // Validate the inputs before proceeding
            bool HasFiles = Files != null && Files.Any();
            if (string.IsNullOrEmpty(NoteText) && string.IsNullOrEmpty(UrlLink) && !HasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _EventSPs.AddEventAsync(
                         Name,
                         ProjectId,
                         FromDate,
                         ToDate,
                         IsPrivate,
                         memberId: MemberId,
                         UrlLink,
                         NoteText,
                         NoteUrlLink);

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
        /// Updates an existing event.
        /// This business logic method ensures that all updates to events are consistent and valid.
        /// </summary>
        /// <param name="eventId">The ID of the event to update.</param>
        /// <param name="name">The updated name of the event.</param>
        /// <param name="fromDate">The updated start date of the event.</param>
        /// <param name="toDate">The updated end date of the event.</param>
        /// <param name="isPrivate">The updated privacy status of the event.</param>
        /// <param name="urlLink">The updated URL link associated with the event (optional).</param>
        /// <param name="noteText">The updated text of the associated note (optional).</param>
        /// <param name="noteUrlLink">The updated URL link for the note (optional).</param>
        /// <param name="fileIdstodelete">The IDs of the files associated with the note (optional).</param>
        /// <param name="files">Files associated with the comment (optional).</param>

        public async Task UpdateEventAsync(int EventId, string Name, DateTime FromDate, DateTime ToDate, bool IsPrivate, string? UrlLink = null, string? NoteText = null, string? NoteUrlLink = null, Dictionary<string,string>? Files = null,List<int>? FileIdsToDelete = null)
        {
            bool HasFiles = Files != null && Files.Any();
            Event? Event = await _Context.Events.FindAsync(EventId);

            if (Event == null)
            {
                throw new Exception("Event not found.");
            }

            if (NoteText != null || UrlLink != null)
            {
                await _EventSPs.UpdateEventAsync(EventId, Name, FromDate, ToDate, IsPrivate, UrlLink, NoteText, NoteUrlLink);
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

                        await _FileSPs.AddFileAsync((int)Event.NoteId, File.Value, File.Key);
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
        /// Deletes an event.
        /// This method provides a clear, business-focused interface for deleting an event.
        /// </summary>
        /// <param name="eventId">The ID of the event to delete.</param>
        public async Task DeleteEventAsync(int EventId)
        {
            Event? Event = await _Context.Events.FindAsync(EventId);

            if (Event == null)
            {
                throw new Exception("Event not found.");
            }
            else
                await _EventSPs.DeleteEventAsync(EventId);
        }

        /// <summary>
        /// Retrieves an event by its ID.
        /// This method fetches a single event and can be used to apply additional business rules.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="eventId">The ID of the event to retrieve.</param>
        /// <returns>The event with the specified ID.</returns>
        public async Task<EventByEventIdDTO?> GetEventByEventIdAsync<T>(int EventId) where T : class
        {
            Event? Event = await _Context.Events.FindAsync(EventId);

            if (Event == null)
            {
                throw new Exception("Event not found.");
            }
            else
                return await _EventSPs.GetEventByEventIdAsync<EventByEventIdDTO>(EventId);
        }

        /// <summary>
        /// Retrieves all events for a given project ID.
        /// This method fetches event data from the data access layer and enables further business processing.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="memberOrClient">Indicates whether the user is a member or a client.</param>
        /// <returns>A list of events for the specified project.</returns>
        public async Task<List<EventByProjectIdDTO>> GetEventByProjectIdAsync<T>(int ProjectId, bool MemberOrClient) where T : class
        {
            Project? Project = await _Context.Projects.FindAsync(ProjectId);

            if (Project == null)
            {
                throw new Exception("Project not found.");
            }
            else
                return await _EventSPs.GetEventByProjectIdAsync<EventByProjectIdDTO>(ProjectId, MemberOrClient);
        }
    }
}
