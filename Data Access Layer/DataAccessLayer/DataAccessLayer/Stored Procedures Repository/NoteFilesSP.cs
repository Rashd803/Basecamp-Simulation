using DataAccessLayer.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Stored_Procedures_Repository
{
    public class NoteFilesSP
    {
        private readonly AppDbContext _context;
        public NoteFilesSP(AppDbContext context) { _context = context; }

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
    }
}
