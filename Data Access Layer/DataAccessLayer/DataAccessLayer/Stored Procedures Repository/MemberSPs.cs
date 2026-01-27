using DataAccessLayer.Data;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;


namespace DataAccessLayer.Stored_Procedures_Repository
{   
    public class MemberSPs
    {
        private readonly AppDbContext _context;
        public MemberSPs(AppDbContext context) { _context = context; }

        /// <summary>
        /// Adds a new member and associated user record.
        /// </summary>
        public async Task AddMemberAsync(string name, string email, string password, int AdminID, int ProjectID, string? companyname = null, string? jobtitle = null)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC SP_AddMember @Name = {0}, @Email = {1}, @Password = {2}, @CompanyName = {3}, @JobTitle = {4}, @ProjectID = {5}, @AdminID = {6}",
                name, email, password, companyname, jobtitle, ProjectID, AdminID);
        }

        /// <summary>
        /// Updates the job title and company name for an existing member.
        /// </summary>
        public async Task UpdateMemberAsync(int memberId, string? jobTitle = null, string? companyName = null)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC SP_UpdateMember @MemberID = {0}, @JobTitle = {1}, @CompanyName = {2}",
                memberId, jobTitle, companyName);
        }

        /// <summary>
        /// Deletes a member and cleans up all associated publishing info, content, and the base user record.
        /// Requires ProjectID to handle the foreign key nullification in the Projects table.
        /// </summary>
        public async Task DeleteMemberAsync(int memberId, int projectId)
        {
            await _context.Database.ExecuteSqlRawAsync(
                "EXEC SP_DeleteMember @MemberID = {0}, @ProjectID = {1}",
                memberId, projectId);
        }

        /// <summary>
        /// Retrieves a member's details by the ID.
        /// </summary>
        public async Task<T?> GetMemberByMemberIdAsync<T>(int memberId) where T : class
        {
            var results = await _context.Set<T>()
                .FromSqlRaw(
                "EXEC SP_GetTeamMemberByMemberID @MemberID = {0}", memberId)
                .AsNoTracking()
                .ToListAsync();

            return results.FirstOrDefault();
        }

        /// <summary>
        /// Retrieves all members in the team by ProjectID.
        /// </summary>
        public async Task<List<T>> GetTeamMembersByProjectIdAsync<T>(int projectId) where T : class
        {
            return await _context.Set<T>()
                .FromSqlRaw(
                "EXEC SP_GetTeamMembersByProjectID @ProjectID = {0}", projectId)
                .AsNoTracking()
                .ToListAsync();
        }
    }
}
