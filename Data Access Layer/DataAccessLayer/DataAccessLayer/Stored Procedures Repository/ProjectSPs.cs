using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class ProjectSPs
{
    private readonly AppDbContext _context;
    public ProjectSPs(AppDbContext context) { _context = context; }

    public async Task AddProjectAsync(string title, string? description, int memberId)
    {
        // Calls the stored procedure to create a new project and handle its PublishingInfo
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddProject @Title = {0}, @Description = {1}, @MemberID = {2}",
            title, description, memberId);
    }

    public async Task DeleteProjectAsync(int projectId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteProject @ProjectID = {0}", projectId);
    }

    public async Task UpdateProjectPublishingInfoAsync(int projectId, string newname, int memberId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "SP_UpdateProject projectId = {0}, newname = {1}, memberId = {2}",
            projectId, newname, memberId);
    }
}