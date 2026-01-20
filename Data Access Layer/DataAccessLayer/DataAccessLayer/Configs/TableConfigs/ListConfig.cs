using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class ListConfig : IEntityTypeConfiguration<List>
{
    public void Configure(EntityTypeBuilder<List> entity)
    {
        entity.HasKey(e => e.Id)
            .HasName("PK__Lists__3214EC26C1FBE503")
            .IsClustered(false);

        entity.HasIndex(e => e.ProjectId, "CLI_List_ProjectID").IsClustered();
        entity.HasIndex(e => e.PublishingInfoId, "NCI_List_PubInfoID");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.NoteId).HasColumnName("NoteID");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");
        entity.Property(e => e.Title).HasMaxLength(50);

        entity.HasOne(d => d.Note).WithMany(p => p.Lists)
            .HasForeignKey(d => d.NoteId)
            .HasConstraintName("FK_List_Note");

        entity.HasOne(d => d.Project).WithMany(p => p.Lists)
            .HasForeignKey(d => d.ProjectId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_Proj_PubInfo");

        entity.HasOne(d => d.PublishingInfo).WithMany(p => p.Lists)
            .HasForeignKey(d => d.PublishingInfoId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_List_PubInfoID");
    }
}
