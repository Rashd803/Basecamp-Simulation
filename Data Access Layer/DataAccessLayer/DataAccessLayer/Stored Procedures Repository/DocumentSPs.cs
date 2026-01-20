using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using DataAccessLayer.Data;

namespace DataAccessLayer.Stored_Procedures_Repository;

public class DocumentSPs
{
    private readonly AppDbContext _context;
    public DocumentSPs(AppDbContext context) { _context = context; }

    public async Task AddDocumentAsync(string? name, string filePath, int projectId, int memberId, string? noteText, string? noteUrlLink, string? attachmentFilePath, string? attachmentFileCaption, bool isPrivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_AddDocument @Name = {0}, @FilePath = {1}, @ProjectID = {2}, @MemberID = {3}, @NoteText = {4}, @NoteURLLink = {5}, @AttachmentFilePath = {6}, @AttachmentFileCaption = {7}, @IsPrivate = {8}",
            name, filePath, projectId, memberId, noteText, noteUrlLink, attachmentFilePath, attachmentFileCaption, isPrivate);
    }

    public async Task UpdateDocumentAsync(int documentId, string? name, string? filePath, string? noteText, string? noteUrlLink, string? attachmentFilePath, string? attachmentFileCaption, bool? isPrivate)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_UpdateDocument @DocumentID = {0}, @Name = {1}, @FilePath = {2}, @NoteText = {3}, @NoteURLLink = {4}, @AttachmentFilePath = {5}, @AttachmentFileCaption = {6}, @IsPrivate = {7}",
            documentId, name, filePath, noteText, noteUrlLink, attachmentFilePath, attachmentFileCaption, isPrivate);
    }

    public async Task DeleteDocumentAsync(int documentId)
    {
        await _context.Database.ExecuteSqlRawAsync(
            "EXEC SP_DeleteDocument @DocumentID = {0}", documentId);
    }

    public async Task<List<T>> GetDocumentByDocumentIdAsync<T>(int documentId) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_GetDocumentByDocumentID @DocumentID = {0}", documentId).ToListAsync();
    }

    public async Task<List<T>> GetDocumentByProjectIdAsync<T>(int projectId, bool memberOrClient) where T : class
    {
        return await _context.Set<T>().FromSqlRaw(
            "EXEC SP_GetDocumentByProjectID @ProjectID = {0}, @MemberOrClient = {1}", projectId, memberOrClient).ToListAsync();
    }
}
