using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for note files.
    /// </summary>
    public class NoteFilesBs
    {
        private readonly AppDbContext _Context;
        private readonly NoteFilesSPs _NoteFilesSPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="NoteFilesBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public NoteFilesBs(AppDbContext context)
        {
            _Context = context;
            _NoteFilesSPs = new NoteFilesSPs(context);
        }

        /// <summary>
        /// Retrieves all files associated with a specific note ID.
        /// This method fetches data from the data access layer and can be used for further business processing.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="NoteID">The ID of the note.</param>
        /// <returns>A list of files associated with the specified note.</returns>
        public async Task<List<FileByNoteIdDTO>> GetFilesByNoteIdAsync<T>(int NoteID) where T : class
        {
            Note? Note = await _Context.Notes.FindAsync(NoteID);

            if (Note == null)
            {
                throw new Exception("Note not found.");
            }
            else
                return await _NoteFilesSPs.GetFilesByNoteIdAsync<FileByNoteIdDTO>(NoteID);
        }

        /// <summary>
        /// Adds a file to a note.
        /// This method centralizes the logic for adding a file to a note.
        /// </summary>
        /// <param name="NoteID">The ID of the note.</param>
        /// <param name="FilePath">The path of the file.</param>
        /// <param name="FileCaption">The caption for the file.</param>
        public async Task AddFileAsync(int NoteID, string FilePath, string FileCaption)
        {
            Note? Note = await _Context.Notes.FindAsync(NoteID);

            if (Note == null)
            {
                throw new Exception("Note not found.");
            }
            else
                await _NoteFilesSPs.AddFileAsync(NoteID, FilePath, FileCaption);
        }

        /// <summary>
        /// Updates a file in a note.
        /// This business logic method ensures that file updates are handled correctly.
        /// </summary>
        /// <param name="FileID">The ID of the file to update.</param>
        /// <param name="FilePath">The updated path of the file.</param>
        /// <param name="FileCaption">The updated caption for the file.</param>
        public async Task UpdateFileAsync(int FileID, string FilePath, string FileCaption)
        {
            NoteFile? File = await _Context.Files.FindAsync(FileID);

            if (File == null)
            {
                throw new Exception("Note not found");
            }
            else
                await _NoteFilesSPs.UpdateFileAsync(FileID, FilePath, FileCaption);
        }

        /// <summary>
        /// Deletes a file from a note.
        /// This method provides a clear, business-focused interface for deleting a file.
        /// </summary>
        /// <param name="FileID">The ID of the file to delete.</param>
        public async Task DeleteFileAsync(int FileID)
        {
            NoteFile? File = await _Context.Files.FindAsync(FileID);

            if (File == null)
            {
                throw new Exception("File not found");
            }
            else
                await _NoteFilesSPs.DeleteFileAsync(FileID);
        }

        /// <summary>
        /// Deletes a note.
        /// This method provides a clear, business-focused interface for deleting a note.
        /// </summary>
        /// <param name="NoteID">The ID of the note to delete.</param>
        public async Task DeleteNoteAsync(int NoteID)
        {
            Note? Note = await _Context.Notes.FindAsync(NoteID);

            if (Note == null)
            {
                throw new Exception("Note not found");
            }
            else
                await _NoteFilesSPs.DeleteNoteAsync(NoteID);
        }
    }
}
