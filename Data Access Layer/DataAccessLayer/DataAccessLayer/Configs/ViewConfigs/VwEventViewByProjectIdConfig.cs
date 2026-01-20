using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwEventViewByProjectIdConfig : IEntityTypeConfiguration<VwEventViewByProjectId>
{
    public void Configure(EntityTypeBuilder<VwEventViewByProjectId> entity)
    {
        entity.HasNoKey().ToView("VW_EventViewByProjectID");
        entity.Property(e => e.FromDate).HasColumnType("datetime");
        entity.Property(e => e.ItemId).HasColumnName("ItemID");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishedAt).HasColumnType("datetime");
        entity.Property(e => e.Title).HasMaxLength(500);
        entity.Property(e => e.ToDate).HasColumnType("datetime");
    }
}
