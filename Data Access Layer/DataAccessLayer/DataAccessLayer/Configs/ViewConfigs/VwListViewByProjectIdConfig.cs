using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwListViewByProjectIdConfig : IEntityTypeConfiguration<ListByProjectIdDTO>
{
    public void Configure(EntityTypeBuilder<ListByProjectIdDTO> entity)
    {
        entity.HasNoKey().ToView("VW_ListViewByProjectID");
        entity.Property(e => e.Caption).HasMaxLength(200);
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.Text).HasMaxLength(2000);
        entity.Property(e => e.Title).HasMaxLength(50);
        entity.Property(e => e.Urllink).HasMaxLength(4000).HasColumnName("URLLink");
    }
}
