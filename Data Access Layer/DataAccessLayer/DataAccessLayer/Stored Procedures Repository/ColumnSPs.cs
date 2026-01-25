using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class ColumnSPs
{
    private readonly AppDbContext _context;
    public ColumnSPs(AppDbContext context) { _context = context; }

    public async Task AddColumnAsync(int memberId, string title, string description, int projectId, bool isPrivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddColumn @MemberID = {0}, @Title = {1}, @Description = {2}, @ProjectID = {3}, @IsPrivate = {4}",
            memberId, title, description, projectId, isPrivate);
    }

    public async Task UpdateColumnAsync(int columnId, string? title, string? description, bool isPrivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateColumn @ColumnID = {0}, @Title = {1}, @Description = {2}, @IsPrivate = {3}",
            columnId, title, description, isPrivate);
    }

    public async Task DeleteColumnAsync(int columnId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteColumn @ColumnID = {0}", columnId);
    }

    public async Task GetColumnByProjectIDAsync(int projectid, bool memberorclient)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_GetColumnByProjectID @ProjectID = {0}, @MemberOrClient = {1}", projectid, memberorclient);
    }

    public async Task GetColumnByColumnIDAsync(int columnId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_GetColumnByColumnID @ColumnID = {0}", columnId);
    }
}
