using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class FileConfig : IEntityTypeConfiguration<File>
{
    public void Configure(EntityTypeBuilder<File> entity)
    {
        entity.HasKey(e => e.Id).HasName("PK__Files__3214EC27106EF2CE");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.Caption).HasMaxLength(200);
        entity.Property(e => e.FilePath).HasMaxLength(4000);
        entity.Property(e => e.NoteId).HasColumnName("NoteID");

        entity.HasOne(d => d.Note).WithMany(p => p.Files)
            .HasForeignKey(d => d.NoteId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Files__NoteID__08B54D69");
    }
}
