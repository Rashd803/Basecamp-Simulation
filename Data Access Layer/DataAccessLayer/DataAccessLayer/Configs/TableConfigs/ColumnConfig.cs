using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class ColumnConfig : IEntityTypeConfiguration<Column>
{
    public void Configure(EntityTypeBuilder<Column> entity)
    {
        entity.HasKey(e => e.Id)
            .HasName("PK__Columns__3214EC260C54A636")
            .IsClustered(false);

        entity.HasIndex(e => e.ProjectId, "CLI_Column_ProjectID").IsClustered();
        entity.HasIndex(e => e.PublishingInfoId, "NCI_Column_PubInfoID");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.Description).HasMaxLength(1000);
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");
        entity.Property(e => e.Title).HasMaxLength(50);

        entity.HasOne(d => d.Project).WithMany(p => p.Columns)
            .HasForeignKey(d => d.ProjectId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Columns__Project__17F790F9");

        entity.HasOne(d => d.PublishingInfo).WithMany(p => p.Columns)
            .HasForeignKey(d => d.PublishingInfoId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_Column_PubInfoID");
    }
}
