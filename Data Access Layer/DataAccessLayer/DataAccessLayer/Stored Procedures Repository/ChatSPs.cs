using DataAccessLayer.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Stored_Procedures_Repository
{
    public class ChatSPs
    {
        private readonly AppDbContext _context;
        public ChatSPs(AppDbContext context) { _context = context; }

        public async Task AddMessageToChatAsync(string text, int projectId, int memberId, bool isPrivate)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC SP_AddMessageToChat @Text = {0}, @ProjectID = {1}, @MemberID = {2}, @IsPrivate = {3}",
                text, projectId, memberId, isPrivate);
        }

        public async Task<List<T>> GetChatByProjectIdAsync<T>(int projectId, bool memberOrClient) where T : class
        {
            return await _context.Set<T>()
                .FromSqlRaw(
                "EXEC SP_GetChatByProjectID @ProjectID = {0}, @MemberOrClient = {1}",
                projectId, memberOrClient)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task UpdateChatAsync(int chatId, string text, bool isPrivate)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC SP_UpdateChat @ChatID = {0}, @Text = {1}, @IsPrivate = {2}",
                chatId, text, isPrivate);
        }

        public async Task DeleteMessageFromChatAsync(int chatId)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC SP_DeleteMessageFromChat @ChatID = {0}",
                chatId);
        }
    }
}
