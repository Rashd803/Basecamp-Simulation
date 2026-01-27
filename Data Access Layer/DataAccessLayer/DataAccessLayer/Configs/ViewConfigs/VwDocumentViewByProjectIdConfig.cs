using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwDocumentViewByProjectIdConfig : IEntityTypeConfiguration<DocumentByProjectIdDTO>
{
    public void Configure(EntityTypeBuilder<DocumentByProjectIdDTO> entity)
    {
        entity.HasNoKey().ToView("VW_DocumentViewByProjectID");
        entity.Property(e => e.DocName).HasMaxLength(100);
        entity.Property(e => e.FilePath).HasMaxLength(4000);
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishedAt).HasColumnType("datetime");
        entity.Property(e => e.Text).HasMaxLength(2000);
        entity.Property(e => e.Urllink).HasMaxLength(4000).HasColumnName("URLLink");
    }
}
