using DataAccessLayer.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Stored_Procedures_Repository
{
    public class ActivitySPs
    {
        private readonly AppDbContext _context;
        public ActivitySPs(AppDbContext context) { _context = context; }

        public async Task<List<T>> GetActivityProjectIdAsync<T>(int projectId) where T : class
        {
            return await _context.Set<T>()
                .FromSqlRaw("EXEC SP_GetActivityByProjectID @ProjectID = {0}", projectId)
                .AsNoTracking()
                .ToListAsync();
        }
    }
}
