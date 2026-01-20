using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwFileViewByNoteIdConfig : IEntityTypeConfiguration<VwFileViewByNoteId>
{
    public void Configure(EntityTypeBuilder<VwFileViewByNoteId> entity)
    {
        entity.HasNoKey().ToView("VW_FileViewByNoteID");
        entity.Property(e => e.Caption).HasMaxLength(200);
        entity.Property(e => e.FilePath).HasMaxLength(4000);
        entity.Property(e => e.NoteId).HasColumnName("NoteID");
    }
}
