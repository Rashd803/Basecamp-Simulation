using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class ProjectConfig : IEntityTypeConfiguration<Project>
{
    public void Configure(EntityTypeBuilder<Project> entity)
    {
        entity.HasKey(e => e.Id).HasName("PK__Projects__3214EC27201DD682");

        entity.ToTable(tb => tb.HasTrigger("trg_After_Insert_Project"));

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.Name).HasMaxLength(50);
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");

        entity.HasOne(d => d.PublishingInfo).WithMany(p => p.Projects)
            .HasForeignKey(d => d.PublishingInfoId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_Proj_PubInfoID");
    }
}
