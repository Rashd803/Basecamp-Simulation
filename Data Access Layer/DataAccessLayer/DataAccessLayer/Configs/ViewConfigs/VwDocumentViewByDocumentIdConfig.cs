using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwDocumentViewByDocumentIdConfig : IEntityTypeConfiguration<DocumentByDocumentIdDTO>
{
    public void Configure(EntityTypeBuilder<DocumentByDocumentIdDTO> entity)
    {
        entity.HasNoKey().ToView("VW_DocumentViewByDocumentID");
        entity.Property(e => e.DocName).HasMaxLength(100);
        entity.Property(e => e.DocId).HasColumnName("DocumentID");
        entity.Property(e => e.FilePath).HasMaxLength(4000);
        entity.Property(e => e.Name).HasMaxLength(100);
        entity.Property(e => e.PublishedAt).HasColumnType("datetime");
        entity.Property(e => e.Text).HasMaxLength(2000);
        entity.Property(e => e.Urllink).HasMaxLength(4000).HasColumnName("URLLink");
    }
}
