using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for invitations.
    /// </summary>
    public class InvitationBs
    {
        private readonly AppDbContext _context;
        private readonly InvitationSPs _invitationSPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="InvitationBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public InvitationBs(AppDbContext context)
        {
            _context = context;
            _invitationSPs = new InvitationSPs(context);
        }

        /// <summary>
        /// Sends an invitation to a new user to join a project.
        /// This method encapsulates the business logic for creating and sending invitations.
        /// </summary>
        /// <param name="senderMemberId">The ID of the member sending the invitation.</param>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="theInvitedPersonName">The name of the person being invited.</param>
        /// <param name="memberOrClient">Indicates whether the invited person is a member or a client.</param>
        /// <param name="emailAddress">The email address of the invited person.</param>
        /// <param name="password">The password for the new user.</param>
        /// <param name="jobTitle">The job title of the invited person (optional).</param>
        /// <param name="companyName">The company name of the invited person (optional).</param>
        /// <param name="note">A note to include with the invitation (optional).</param>
        public async Task AddInvitationAsync(int senderMemberId, int projectId, string theInvitedPersonName, bool memberOrClient, string emailAddress, string password, string? jobTitle = null, string? companyName = null, string? note = null)
        { 
            // Check before proceed
            if (senderMemberId <= 0 || projectId <= 0 || string.IsNullOrEmpty(theInvitedPersonName) || string.IsNullOrEmpty(emailAddress) || string.IsNullOrEmpty(password))
                return;

            await _invitationSPs.AddInvitationAsync(senderMemberId, projectId, theInvitedPersonName, memberOrClient, emailAddress, password, jobTitle, companyName, note);
        }

        /// <summary>
        /// Retrieves all invitations for a given project ID.
        /// This method fetches data from the data access layer and can be used for further business processing.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="projectId">The ID of the project.</param>
        /// <returns>A list of invitations for the specified project.</returns>
        public async Task<List<InvitationDTO>> GetInvitationsByProjectIdAsync<T>(int projectId) where T : class
        {
            Project? Project = await _context.Projects.FindAsync(projectId);

            if (Project == null)
            {
                throw new Exception("Project not found.");
            }
            else
                return await _invitationSPs.GetInvitationsByProjectIdAsync<InvitationDTO>(projectId);
        }

        /// <summary>
        /// Retrieves an invitation by its ID.
        /// This method fetches a single invitation and can be extended with additional business rules.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="invitationId">The ID of the invitation to retrieve.</param>
        /// <returns>The invitation with the specified ID.</returns>
        public async Task<InvitationProjectDTO?> GetInvitationByInvitationIdAsync<T>(int invitationId) where T : class
        {
            return await _invitationSPs.GetInvitationByInvitationIdAsync<InvitationProjectDTO>(invitationId);
        }

        /// <summary>
        /// Updates an invitation.
        /// This business logic method ensures that invitation updates are handled correctly.
        /// </summary>
        /// <param name="invitationId">The ID of the invitation to update.</param>
        /// <param name="jobTitle">The updated job title (optional).</param>
        /// <param name="companyName">The updated company name (optional).</param>
        public async Task UpdateInvitationAsync(int invitationId, string? jobTitle = null, string? companyName = null)
        {
            InvitationDTO invitation = await _invitationSPs.GetInvitationByInvitationIdAsync<InvitationDTO>(invitationId);
            if (invitation != null)
                throw new Exception("Invitaiotn Not Found");
            else
                await _invitationSPs.UpdateInvitationAsync(invitationId, jobTitle, companyName);
        }

        /// <summary>
        /// Deletes an invitation.
        /// This method provides a clear, business-focused interface for deleting an invitation.
        /// </summary>
        /// <param name="invitationId">The ID of the invitation to delete.</param>
        /// <param name="projectId">The ID of the project.</param>
        public async Task DeleteInvitationAsync(int invitationId, int projectId)
        {
            InvitationDTO invitation = await _invitationSPs.GetInvitationByInvitationIdAsync<InvitationDTO>(invitationId);
            if (invitation != null)
                throw new Exception("Invitaiotn Is Not Found");

            else
                await _invitationSPs.DeleteInvitationAsync(invitationId, projectId);
        }

        /// <summary>
        /// Updates the status of an invitation.
        /// This method centralizes the logic for responding to an invitation.
        /// </summary>
        /// <param name="invitationId">The ID of the invitation.</param>
        /// <param name="newStatusId">The ID of the new status.</param>
        public async Task AnswerInvitationAsync(int invitationId, int newStatusId)
        {
            if (invitationId < 0 || newStatusId < 0)
                throw new Exception("Invitation Not Found");

            else
                await _invitationSPs.AnswerInvitationAsync(invitationId, newStatusId);
        }
    }
}
