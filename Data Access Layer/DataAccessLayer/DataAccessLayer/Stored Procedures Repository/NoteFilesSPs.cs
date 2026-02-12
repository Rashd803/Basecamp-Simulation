using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Stored_Procedures_Repository
{
    public class NoteFilesSPs
    {
        private readonly AppDbContext _context;
        public NoteFilesSPs(AppDbContext context) { _context = context; }

        /// <summary>
        /// Retrieves all files associated with a specific note ID.
        /// </summary>
        public async Task<List<T>> GetFilesByNoteIdAsync<T>(int NoteID) where T : class
        {
            return await _context.Set<T>()
                .FromSqlRaw("SP_GetFilesByNoteID @NoteID = {0}", NoteID)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task AddFileAsync( int NoteID, string FilePath, string FileCaption)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC SP_AddFileToNote @NoteID{0},@FilePath{1}, @FileCaption{2}",
                 NoteID, FilePath, FileCaption);
        }

        public async Task UpdateFileAsync(int FileID, string FilePath, string FileCaption)
        {
            await _context.Database.ExecuteSqlRawAsync("EXEC SP_UpdateFileInNote @FileID{0}, @FilePath{1}, @FileCaption{2}",
                 FileID, FilePath, FileCaption);
        }

        public async Task DeleteFileAsync(int FileID)
        {
            await _context.Database.ExecuteSqlRawAsync("EXEC SP_DeleteFileFromNote @FileID{0}",
                 FileID);
        }

        public async Task DeleteNoteAsync(int NoteID)
        {
            await _context.Database.ExecuteSqlRawAsync("EXEC SP_DeleteNote @NoteID{0}",
                 NoteID);
        }

    }
}
