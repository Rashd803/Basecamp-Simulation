using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;
using Microsoft.Extensions.Logging;
using System.Reflection.Metadata;
using Document = DataAccessLayer.Entities.Document;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for documents.
    /// </summary>
    public class DocumentBs
    {
        private readonly AppDbContext _Context;
        private readonly DocumentSPs _DocumentSPs;
        private readonly NoteFilesSPs _FileSPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="DocumentBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public DocumentBs(AppDbContext context)
        {
            _Context = context;
            _DocumentSPs = new DocumentSPs(context);
            _FileSPs = new NoteFilesSPs(context);
        }

        /// <summary>
        /// Adds a new document to a project.
        /// This method centralizes the logic for creating a document, ensuring all business rules are applied.
        /// </summary>
        /// <param name="name">The name of the document.</param>
        /// <param name="filePath">The path to the document file.</param>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="memberId">The ID of the member creating the document.</param>
        /// <param name="noteText">The text of an associated note.</param>
        /// <param name="urlLink">A URL link for the note.</param>
        /// <param name="isPrivate">Indicates whether the document is private.</param>
        public async Task AddDocumentAsync(string Name, string FilePath, int ProjectId, int MemberId, string? NoteText, string? UrlLink, bool IsPrivate, Dictionary<string,string>? Files = null)
        {
            // Validate the inputs before proceeding
            bool HasFiles = Files != null && Files.Any();
            if (string.IsNullOrEmpty(NoteText) && string.IsNullOrEmpty(UrlLink) && !HasFiles)
                return;
            else
            {
                try
                {
                    int NewNoteID = await _DocumentSPs.AddDocumentAsync(
                         Name,
                         FilePath,
                         ProjectId,
                         MemberId, 
                         NoteText,
                         UrlLink,
                         isPrivate: IsPrivate);

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
                catch (Exception Ex)
                {

                    throw;
                }
            }
        }

        /// <summary>
        /// Updates an existing document.
        /// This business logic method ensures that all updates to documents are consistent and valid.
        /// </summary>
        /// <param name="documentId">The ID of the document to update.</param>
        /// <param name="name">The updated name of the document.</param>
        /// <param name="filePath">The updated path to the document file.</param>
        /// <param name="noteText">The updated text of the associated note.</param>
        /// <param name="urlLink">The updated URL link for the note.</param>
        /// <param name="isPrivate">The updated privacy status of the document.</param>
        /// <param name="fileIdstodelete">The IDs of the files associated with the note (optional).</param>
        /// <param name="files">Files associated with the comment (optional).</param>

        public async Task UpdateDocumentAsync(int DocumentId, string? Name, string? FilePath, string? NoteText, string? UrlLink, bool? IsPrivate, Dictionary<string, string>? Files = null, List<int>? FileIdsToDelete = null)
        {

            {
                bool HasFiles = Files != null && Files.Any();
                Document? Doc = await _Context.Documents.FindAsync(DocumentId);

                if (Doc == null)
                {
                    throw new Exception("Document not found.");
                }

                if (NoteText != null || UrlLink != null)
                {
                    await _DocumentSPs.UpdateDocumentAsync(DocumentId, Name, FilePath, NoteText, UrlLink, IsPrivate);
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

                            await _FileSPs.AddFileAsync((int)Doc.NoteId, File.Value, File.Key);
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
        /// Deletes a document.
        /// This method provides a clear, business-focused interface for deleting a document.
        /// </summary>
        /// <param name="documentId">The ID of the document to delete.</param>
        public async Task DeleteDocumentAsync(int DocumentId)
        {
            Document? Doc = await _Context.Documents.FindAsync(DocumentId);

            if (Doc == null)
            {
                throw new Exception("Document not found.");
            }
            else
                await _DocumentSPs.DeleteDocumentAsync(DocumentId);
        }

        /// <summary>
        /// Retrieves a document by its ID.
        /// This method fetches a single document and can be used to apply additional business rules.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="documentId">The ID of the document to retrieve.</param>
        /// <returns>The document with the specified ID.</returns>
        public async Task<DocumentByDocumentIdDTO?> GetDocumentByDocumentIdAsync<T>(int DocumentId) where T : class
        {
            Document? Doc = await _Context.Documents.FindAsync(DocumentId);

            if (Doc == null)
            {
                throw new Exception("Document not found.");
            }
            else
                return await _DocumentSPs.GetDocumentByDocumentIdAsync<DocumentByDocumentIdDTO>(DocumentId);
        }

        /// <summary>
        /// Retrieves all documents for a given project ID.
        /// This method fetches document data from the data access layer and enables further business processing.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="memberOrClient">Indicates whether the user is a member or a client.</param>
        /// <returns>A list of documents for the specified project.</returns>
        public async Task<List<DocumentByProjectIdDTO>> GetDocumentByProjectIdAsync<T>(int ProjectId, bool MemberOrClient) where T : class
        {
            Project? Project = await _Context.Projects.FindAsync(ProjectId);

            if (Project == null)
            {
                throw new Exception("Project not found.");
            }
            else
                return await _DocumentSPs.GetDocumentByProjectIdAsync<DocumentByProjectIdDTO>(ProjectId, MemberOrClient);
        }
    }
}
