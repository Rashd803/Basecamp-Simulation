using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class DocumentConfig : IEntityTypeConfiguration<Document>
{
    public void Configure(EntityTypeBuilder<Document> entity)
    {
        entity.HasKey(e => e.Id)
            .HasName("PK__Document__3214EC26541E7FFA")
            .IsClustered(false);

        entity.ToTable(tb => tb.HasTrigger("trg_After_Insert_Document"));

        entity.HasIndex(e => e.ProjectId, "CLI_Doc_ProjectID").IsClustered();
        entity.HasIndex(e => e.PublishingInfoId, "NCI_Doc_PubInfoID");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.FilePath).HasMaxLength(4000);
        entity.Property(e => e.Name).HasMaxLength(100);
        entity.Property(e => e.NoteId).HasColumnName("NoteID");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");

        entity.HasOne(d => d.Note).WithMany(p => p.Documents)
            .HasForeignKey(d => d.NoteId)
            .HasConstraintName("FK_Docs_Comment");

        entity.HasOne(d => d.Project).WithMany(p => p.Documents)
            .HasForeignKey(d => d.ProjectId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Documents__Proje__40F9A68C");

        entity.HasOne(d => d.PublishingInfo).WithMany(p => p.Documents)
            .HasForeignKey(d => d.PublishingInfoId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_Docs_PubInfoID");
    }
}
