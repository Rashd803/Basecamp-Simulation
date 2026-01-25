using DataAccessLayer.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Stored_Procedures_Repository
{
    public class CommentSubscriptionSPs
    {
        private readonly AppDbContext _context;
        public CommentSubscriptionSPs(AppDbContext context) { _context = context; }

        public async Task AddCommentSubscriptionAsync(int memberId, int commentid, int projectid)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC SP_AddCommentSubscriber @MemberID = {0}, @CommentID = {1}, @ProjectID = {2}",
                memberId, commentid, projectid);
        }


        public async Task DeletCommentSubscriptionAsync(int commentsubid)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC SP_DeleteCommentSubscriber @CommentSubID = {0}",
                commentsubid);
        }

        public async Task<List<T>> SP_GetCommentSubscribersAsync<T>(int commentid) where T : class
        {
            return await _context.Set<T>().FromSqlRaw(
                "SP_GetCommentSubscribers @CommentID = {0}", commentid).ToListAsync();
        }

    }
}
