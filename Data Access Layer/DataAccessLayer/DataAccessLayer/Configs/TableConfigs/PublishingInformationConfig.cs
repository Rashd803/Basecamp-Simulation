using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class PublishingInformationConfig : IEntityTypeConfiguration<PublishingInformation>
{
    public void Configure(EntityTypeBuilder<PublishingInformation> entity)
    {
        entity.HasKey(e => e.Id).HasName("PK__Publishi__3214EC27BD43DE5A");

        entity.ToTable("PublishingInformation");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishedAt)
            .HasDefaultValueSql("(getdate())")
            .HasColumnType("datetime");
        entity.Property(e => e.PublisherId).HasColumnName("PublisherID");

        entity.HasOne(d => d.Project).WithMany(p => p.PublishingInformations)
            .HasForeignKey(d => d.ProjectId)
            .HasConstraintName("FK__Publishin__Proje__1F2E9E6D");

        entity.HasOne(d => d.Publisher).WithMany(p => p.PublishingInformations)
            .HasForeignKey(d => d.PublisherId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Publishin__Publi__787EE5A0");
    }
}
