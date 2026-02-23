using DataAccessLayer.Data;
using DataAccessLayer.Stored_Procedures_Repository;
using DataAccessLayer.Entities;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for activities.
    /// </summary>
    public class ActivityBs
    {
        private readonly AppDbContext _context;
        private readonly ActivitySPs _activitySPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="ActivityBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public ActivityBs(AppDbContext context)
        {
            _context = context;
            _activitySPs = new ActivitySPs(context);
        }

        /// <summary>
        /// Retrieves activities for a given project ID.
        /// This method serves as a wrapper around the data access layer's stored procedure call.
        /// It enhances separation of concerns by isolating business logic from data access details.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="projectId">The ID of the project.</param>
        /// <returns>A list of activities for the specified project.</returns>
        public async Task<List<ActivityByProjectIdDTO>> GetActivityProjectIdAsync<T>(int projectId) where T : class
        {
            Project? Project = await _context.Projects.FindAsync(projectId);
            return await _activitySPs.GetActivityProjectIdAsync<ActivityByProjectIdDTO>(projectId);
        }
    }
}
