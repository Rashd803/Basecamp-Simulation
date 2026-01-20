using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class NoteConfig : IEntityTypeConfiguration<Note>
{
    public void Configure(EntityTypeBuilder<Note> entity)
    {
        entity.HasKey(e => e.Id).HasName("PK__Notes__3214EC27F61D417A");

        entity.HasIndex(e => e.PublishingInfoId, "NCI_Note_PubInfoID");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");
        entity.Property(e => e.Text).HasMaxLength(2000);
        entity.Property(e => e.Urllink)
            .HasMaxLength(4000)
            .HasColumnName("URLLink");

        entity.HasOne(d => d.Project).WithMany(p => p.Notes)
            .HasForeignKey(d => d.ProjectId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_Notes_Project");

        entity.HasOne(d => d.PublishingInfo).WithMany(p => p.Notes)
            .HasForeignKey(d => d.PublishingInfoId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Notes__Publishin__05D8E0BE");
    }
}
