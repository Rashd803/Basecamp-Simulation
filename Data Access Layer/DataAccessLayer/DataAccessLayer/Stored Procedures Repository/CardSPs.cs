using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class CardSPs
{
    private readonly AppDbContext _context;
    public CardSPs(AppDbContext context) { _context = context; }

    public async Task AddCardToColumnAsync(int memberId, int projectId, string title, DateTime? fromDate, DateTime? toDate, int columnId, string? noteText, string? noteUrlLink, string? filePath, string? fileCaption)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddCardToColumn @MemberID = {0}, @ProjectID = {1}, @Title = {2}, @FromDate = {3}, @ToDate = {4}, @ColumnID = {5}, @NoteText = {6}, @NoteURLLink = {7}, @FilePath = {8}, @FileCaption = {9}",
            memberId, projectId, title, fromDate, toDate, columnId, noteText, noteUrlLink, filePath, fileCaption);
    }

    public async Task UpdateCardAsync(int cardId, string title, DateTime? fromDate, DateTime? toDate, string? noteText, string? noteUrlLink, string? filePath, string? fileCaption)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateCard @CardID = {0}, @Title = {1}, @FromDate = {2}, @ToDate = {3}, @NoteText = {4}, @NoteURLLink = {5}, @FilePath = {6}, @FileCaption = {7}",
            cardId, title, fromDate, toDate, noteText, noteUrlLink, filePath, fileCaption);
    }

    public async Task DeleteCardAsync(int cardId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteCard @CardID = {0}", cardId);
    }

    public async Task<List<T>> GetCardByCardIdAsync<T>(int cardId) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_GetCardByCardID @CardID = {0}", cardId).ToListAsync();
    }

    public async Task<List<T>> GetCardsByColumnIdAsync<T>(int columnId, bool memberOrClient) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_GetCardsByColumnID @ColumnID = {0}, @MemberOrClient = {1}", columnId, memberOrClient).ToListAsync();
    }
}
