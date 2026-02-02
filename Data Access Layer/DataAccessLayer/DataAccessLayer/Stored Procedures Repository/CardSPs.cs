using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class CardSPs
{
    private readonly AppDbContext _context;
    public CardSPs(AppDbContext context) { _context = context; }

    /// <summary>
    /// Adds a new card to a column.
    /// </summary>
    public async Task AddCardToColumnAsync(int memberId, int projectId, int columnId, string title, DateTime? fromDate = null, DateTime? toDate = null, string? noteText = null, string? noteUrlLink = null)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddCardToColumn @MemberID = {0}, @ProjectID = {1}, @Title = {2}, @FromDate = {3}, @ToDate = {4}, @ColumnID = {5}, @NoteText = {6}, @NoteURLLink = {7}",
            memberId, projectId, title, fromDate, toDate, columnId, noteText, noteUrlLink);
    }

    /// <summary>
    /// Updates an existing card.
    /// </summary>
    public async Task UpdateCardAsync(int cardId, string title, DateTime? fromDate = null, DateTime? toDate = null, string? noteText = null, string? noteUrlLink = null)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateCard @CardID = {0}, @Title = {1}, @FromDate = {2}, @ToDate = {3}, @NoteText = {4}, @NoteURLLink = {5}",
            cardId, title, fromDate, toDate, noteText, noteUrlLink);
    }

    /// <summary>
    /// Deletes a card.
    /// </summary>
    public async Task DeleteCardAsync(int cardId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteCard @CardID = {0}", cardId);
    }

    /// <summary>
    /// Retrieves a card by its ID.
    /// </summary>
    public async Task<T?> GetCardByCardIdAsync<T>(int cardId) where T : class
    {
        var results = await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetCardByCardID @CardID = {0}", cardId)
            .AsNoTracking()
            .ToListAsync();

        return results.FirstOrDefault();
    }

    /// <summary>
    /// Retrieves all cards in a specific column.
    /// </summary>
    public async Task<List<T>> GetCardsByColumnIdAsync<T>(int columnId, bool memberOrClient) where T : class
    {
        return await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetCardsByColumnID @ColumnID = {0}, @MemberOrClient = {1}", columnId, memberOrClient)
            .AsNoTracking()
            .ToListAsync();
    }
}
