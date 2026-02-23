using DataAccessLayer.Data;
using DataAccessLayer.Entities;
using DataAccessLayer.Stored_Procedures_Repository;
using System.ComponentModel.Design;

namespace BusinessLayer
{
    /// <summary>
    /// Handles business logic for cards.
    /// </summary>
    public class CardBs
    {
        private readonly AppDbContext _Context;
        private readonly CardSPs _CardSPs;
        private readonly NoteFilesSPs _FileSPs;

        /// <summary>
        /// Initializes a new instance of the <see cref="CardBs"/> class.
        /// </summary>
        /// <param name="context">The database context.</param>
        public CardBs(AppDbContext context)
        {
            _Context = context;
            _CardSPs = new CardSPs(context);
            _FileSPs = new NoteFilesSPs(context);
        }

        /// <summary>
        /// Adds a new card to a column.
        /// This method encapsulates the business rule for adding a card and calls the data access layer.
        /// </summary>
        /// <param name="memberId">The ID of the member adding the card.</param>
        /// <param name="projectId">The ID of the project.</param>
        /// <param name="columnId">The ID of the column to add the card to.</param>
        /// <param name="title">The title of the card.</param>
        /// <param name="fromDate">The start date for the card (optional).</param>
        /// <param name="toDate">The end date for the card (optional).</param>
        /// <param name="noteText">The text of the note associated with the card (optional).</param>
        /// <param name="urlLink">A URL link for the note (optional).</param>
        /// <param name="files">Files for the note (optional).</param>
        public async Task AddCardToColumnAsync(int MemberId, int ProjectId, int ColumnId, string Title, DateTime? FromDate = null, DateTime? ToDate = null, string? NoteText = null, string? UrlLink = null, Dictionary<string, string>? Files = null)
        {
            // Validate the inputs before proceeding
            bool HasFiles = Files != null && Files.Any();
            if (string.IsNullOrEmpty(NoteText) && string.IsNullOrEmpty(UrlLink) && !HasFiles)
            {

                return;
            }
            else
            {
                try
                {
                    int NewNoteID = await _CardSPs.AddCardToColumnAsync(
                         MemberId,
                         ProjectId,
                         ColumnId,
                         Title,
                         FromDate,
                         ToDate,
                         NoteText,
                         UrlLink
                         );

                    if (NewNoteID > 0 && HasFiles)
                    {
                        // Add files to the newly created note
                        foreach (var File in Files!)
                        {

                            await _FileSPs.AddFileAsync(NewNoteID, File.Value, File.Key);
                        }
                    }
                    else
                    {
                        return;
                    }
                }
                catch (Exception Ex)
                {

                    throw;
                }
            }
        }

        /// <summary>
        /// Updates an existing card.
        /// This business logic method validates and processes the update before calling the data access layer.
        /// </summary>
        /// <param name="cardId">The ID of the card to update.</param>
        /// <param name="title">The updated title of the card.</param>
        /// <param name="fromDate">The updated start date for the card (optional).</param>
        /// <param name="toDate">The updated end date for the card (optional).</param>
        /// <param name="noteText">The updated text of the note (optional).</param>
        /// <param name="urlLink">The updated URL link for the note (optional).</param>
        /// <param name="files">The new files for the note (optional).</param>
        /// <param name="fileIdstodelete">The associated file ids to delete (optional).</param>
        public async Task UpdateCardAsync(int CardId, string Title, DateTime? FromDate = null, DateTime? ToDate = null, string? NoteText = null,
            string? UrlLink = null, Dictionary<string, string>? Files = null, List<int>? FileIdsToDelete = null)
        {
            bool HasFiles = Files != null && Files.Any();
            Card? Card = await _Context.Cards.FindAsync(CardId);

            if (Card == null)
            {
                throw new Exception("Card not found.");
            }

            if (NoteText != null || UrlLink != null)
            {
                await _CardSPs.UpdateCardAsync(CardId, Title, FromDate, ToDate, NoteText, UrlLink);
            }

            if (FileIdsToDelete != null && FileIdsToDelete.Any())
            {
                foreach (var Id in FileIdsToDelete)
                {
                    await _FileSPs.DeleteFileAsync(Id);
                }
            }

            try
            {

                if (HasFiles)
                {

                    // Add files to the selected created note
                    foreach (var File in Files!)
                    {

                        await _FileSPs.AddFileAsync((int)Card.NoteId, File.Value, File.Key);
                    }
                }
                else
                {
                    return;
                }
            }

            catch (Exception Ex)
            {

                throw;
            }
        }

        /// <summary>
        /// Deletes a card.
        /// This method provides a business-level interface for deleting a card.
        /// </summary>
        /// <param name="cardId">The ID of the card to delete.</param>
        public async Task DeleteCardAsync(int CardId)
        {
            Card? Card = await _Context.Cards.FindAsync(CardId);

            if (Card == null)
            {
                throw new Exception("Card not found");
            }
            else
                await _CardSPs.DeleteCardAsync(CardId);
        }

        /// <summary>
        /// Retrieves a card by its ID.
        /// This method fetches a single card and can be extended to include additional business rules.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="cardId">The ID of the card to retrieve.</param>
        /// <returns>The card with the specified ID.</returns>
        public async Task<CardByCardIdDTO?> GetCardByCardIdAsync<T>(int CardId) where T : class
        {
            Card? Card = await _Context.Cards.FindAsync(CardId);

            if (Card == null)
            {
                throw new Exception("Card not found");
            }
            else
                return await _CardSPs.GetCardByCardIdAsync<CardByCardIdDTO>(CardId);
        }

        /// <summary>
        /// Retrieves all cards in a specific column.
        /// This method fetches data through the data access layer and can be used for further business processing.
        /// </summary>
        /// <typeparam name="T">The type of the result.</typeparam>
        /// <param name="columnId">The ID of the column.</param>
        /// <param name="memberOrClient">Indicates whether the user is a member or a client.</param>
        /// <returns>A list of cards in the specified column.</returns>
        public async Task<List<CardByColumnIdDTO>> GetCardsByColumnIdAsync<T>(int ColumnId, bool MemberOrClient) where T : class
        {
            Column? Column = await _Context.Columns.FindAsync(ColumnId);

            if (Column == null)
            {
                throw new Exception("Column not found");
            }
            else
                return await _CardSPs.GetCardsByColumnIdAsync<CardByColumnIdDTO>(ColumnId, MemberOrClient);
        }
    }
}
