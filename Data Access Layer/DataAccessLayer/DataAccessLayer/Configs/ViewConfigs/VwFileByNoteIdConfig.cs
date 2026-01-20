using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwFileByNoteIdConfig : IEntityTypeConfiguration<VwFileByNoteId>
{
    public void Configure(EntityTypeBuilder<VwFileByNoteId> entity)
    {
        entity.HasNoKey().ToView("VW_FileByNoteID");
        entity.Property(e => e.Caption).HasMaxLength(200);
        entity.Property(e => e.FilePath).HasMaxLength(4000);
        entity.Property(e => e.NoteId).HasColumnName("NoteID");
    }
}
