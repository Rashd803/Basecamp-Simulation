using DataAccessLayer.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Stored_Procedures_Repository
{
    public class InvitationSPs
    {
        private readonly AppDbContext _context;
        public InvitationSPs(AppDbContext context) { _context = context; }

        public async Task AddInvitationAsync(int senderMemberId, string theInvitedPersonName, bool memberOrClient, string emailAddress, string? jobTitle, string? companyName, string password, string? note, int projectId)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC SP_AddInvitation @SenderMemberID = {0}, @TheInvitedPersonName = {1}, @MemberOrClient = {2}, @EmailAddress = {3}, @JobTitle = {4}, @CompanyName = {5}, @Password = {6}, @Note = {7}, @ProjectID = {8}",
                senderMemberId, theInvitedPersonName, memberOrClient, emailAddress, jobTitle, companyName, password, note, projectId);
        }

        public async Task<List<T>> GetInvitationsByProjectIdAsync<T>(int projectId) where T : class
        {
            return await _context.Set<T>()
                .FromSqlRaw(
                "EXEC SP_GetInvitationsByProjectID @ProjectID = {0}",
                projectId)
                .AsNoTracking()
                .ToListAsync();
        }

        public async Task<T?> GetInvitationByInvitationIdAsync<T>(int invitationId) where T : class
        {
            var results = await _context.Set<T>().FromSqlRaw(
                "EXEC SP_GetInvitationsByInvitationID @InvitationID = {0}",
                invitationId)
                .AsNoTracking()
                .ToListAsync();

            return results.FirstOrDefault();
        }

        public async Task UpdateInvitationAsync(int invitationId, string? jobTitle, string? companyName)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC SP_UpdateInvitation @InvitationID = {0}, @JobTitle = {1}, @CompanyName = {2}",
                invitationId, jobTitle, companyName);
        }

        public async Task DeleteInvitationAsync(int invitationId, int projectId)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC SP_DeleteInvitation @InvitationID = {0}, @ProjectID = {1}",
                invitationId, projectId);
        }

        public async Task AnswerInvitationAsync(int invitationId, int newStatusId)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC SP_AnsweringInvitation @InvitationID = {0}, @NewStatusID = {1}",
                invitationId, newStatusId);
        }
    }
}
