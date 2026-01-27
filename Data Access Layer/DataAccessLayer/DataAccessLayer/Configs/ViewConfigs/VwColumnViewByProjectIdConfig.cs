using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwColumnViewByProjectIdConfig : IEntityTypeConfiguration<ColumnByProjectIdDTO>
{
    public void Configure(EntityTypeBuilder<ColumnByProjectIdDTO> entity)
    {
        entity.HasNoKey().ToView("VW_ColumnViewByProjectID");
        entity.Property(e => e.ColumnId).ValueGeneratedOnAdd().HasColumnName("ColumnID");
        entity.Property(e => e.Description).HasMaxLength(1000);
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.Title).HasMaxLength(50);
    }
}
