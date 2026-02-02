using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class DocumentSPs
{
    private readonly AppDbContext _context;
    public DocumentSPs(AppDbContext context) { _context = context; }

    /// <summary>
    /// Adds a new document to a project.
    /// </summary>
    public async Task AddDocumentAsync(string? name, string filePath, int projectId, int memberId, string? noteText, string? noteUrlLink, bool isPrivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddDocument @Name = {0}, @FilePath = {1}, @ProjectID = {2}, @MemberID = {3}, @NoteText = {4}, @NoteURLLink = {5}, @IsPrivate = {6}",
            name, filePath, projectId, memberId, noteText, noteUrlLink, isPrivate);
    }

    /// <summary>
    /// Updates an existing document.
    /// </summary>
    public async Task UpdateDocumentAsync(int documentId, string? name, string? filePath, string? noteText, string? noteUrlLink, bool? isPrivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateDocument @DocumentID = {0}, @Name = {1}, @FilePath = {2}, @NoteText = {3}, @NoteURLLink = {4}, @IsPrivate = {5}",
            documentId, name, filePath, noteText, noteUrlLink, isPrivate);
    }

    /// <summary>
    /// Deletes a document.
    /// </summary>
    public async Task DeleteDocumentAsync(int documentId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteDocument @DocumentID = {0}", documentId);
    }

    /// <summary>
    /// Retrieves a document by its ID.
    /// </summary>
    public async Task<T?> GetDocumentByDocumentIdAsync<T>(int documentId) where T : class
    {
        var results = await _context.Set<T>()
            .FromSqlRaw(
            "EXEC SP_GetDocumentByDocumentID @DocumentID = {0}", documentId)
            .AsNoTracking()
            .ToListAsync();

        return results.FirstOrDefault();
    }

    /// <summary>
    /// Retrieves all documents for a given project ID.
    /// </summary>
    public async Task<List<T>> GetDocumentByProjectIdAsync<T>(int projectId, bool memberOrClient) where T : class
    {
        return await _context.Set<T>()
            .FromSqlRaw("EXEC SP_GetDocumentByProjectID @ProjectID = {0}, @MemberOrClient = {1}", projectId, memberOrClient)
            .AsNoTracking()
            .ToListAsync();
    }
}
