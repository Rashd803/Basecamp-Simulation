using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for members.
    /// </summary>
    public class MemberBs
    {
        private readonly AppDbContext _Context;
        private readonly MemberSPs _MemberSPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="MemberBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public MemberBs(AppDbContext context)
        {
            _Context = context;
            _MemberSPs = new MemberSPs(context);
        }

        /// <summary>
        /// Adds a new member and associated user record.
        /// This method centralizes the logic for adding a new member to the system.
        /// </summary>
        /// <param name="name">The name of the member.</param>
        /// <param name="email">The email address of the member.</param>
        /// <param name="password">The password for the member's user account.</param>
        /// <param name="AdminID">The ID of the admin creating the member.</param>
        /// <param name="ProjectID">The ID of the project the member is being added to.</param>
        /// <param name="companyname">The name of the member's company (optional).</param>
        /// <param name="jobtitle">The job title of the member (optional).</param>
        public async Task AddMemberAsync(string Name, string Email, string Password, int AdminID, int ProjectID, string? CompanyName = null, string? JobTitle = null)
        {
            if (string.IsNullOrEmpty(Name) || string.IsNullOrEmpty(Email) || string.IsNullOrEmpty(Password) || AdminID <= 0 || ProjectID <= 0)
                return;

            else
                await _MemberSPs.AddMemberAsync(Name, Email, Password, AdminID, ProjectID, CompanyName, JobTitle);
        }

        /// <summary>
        /// Updates the job title and company name for an existing member.
        /// This business logic method ensures that member updates are handled correctly.
        /// </summary>
        /// <param name="memberId">The ID of the member to update.</param>
        /// <param name="jobTitle">The updated job title (optional).</param>
        /// <param name="companyName">The updated company name (optional).</param>
        public async Task UpdateMemberAsync(int MemberId, string? JobTitle = null, string? CompanyName = null)
        {
            Member? Member = await _Context.Members.FindAsync(MemberId);

            if (Member == null)
                throw new Exception("Member Not Found");
            else
                await _MemberSPs.UpdateMemberAsync(MemberId, JobTitle, CompanyName);
        }

        /// <summary>
        /// Deletes a member and cleans up all associated publishing info, content, and the base user record.
        /// This method provides a clear, business-focused interface for deleting a member.
        /// </summary>
        /// <param name="memberId">The ID of the member to delete.</param>
        /// <param name="projectId">The ID of the project to disassociate the member from.</param>
        public async Task DeleteMemberAsync(int MemberId, int ProjectId)
        {
            Member? Member = await _Context.Members.FindAsync(MemberId);

            if (Member == null)
                throw new Exception("Member Not Found");
            else
                await _MemberSPs.DeleteMemberAsync(MemberId, ProjectId);
        }

        /// <summary>
        /// Retrieves a member's details by their ID.
        /// This method fetches a single member and can be extended with additional business rules.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="memberId">The ID of the member to retrieve.</param>
        /// <returns>The member with the specified ID.</returns>
        public async Task<MemberDTO?> GetMemberByMemberIdAsync<T>(int MemberId) where T : class
        {
            Member? Member = await _Context.Members.FindAsync(MemberId);

            if (Member == null)
                throw new Exception("Member Not Found");
            else
                return await _MemberSPs.GetMemberByMemberIdAsync<MemberDTO>(MemberId);
        }

        /// <summary>
        /// Retrieves all members in the team by ProjectID.
        /// This method fetches team member data and enables further business processing.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="projectId">The ID of the project.</param>
        /// <returns>A list of team members for the specified project.</returns>
        public async Task<List<MemberDTO>> GetTeamMembersByProjectIdAsync<T>(int ProjectId) where T : class
        {
            Project? Project = await _Context.Projects.FindAsync(ProjectId);

            if (Project == null)
            {
                throw new Exception("Project not found.");
            }
            else
                return await _MemberSPs.GetTeamMembersByProjectIdAsync<MemberDTO>(ProjectId);
        }
    }
}
