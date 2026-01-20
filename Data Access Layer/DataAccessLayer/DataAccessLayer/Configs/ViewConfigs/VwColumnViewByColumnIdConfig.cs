using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwColumnViewByColumnIdConfig : IEntityTypeConfiguration<VwColumnViewByColumnId>
{
    public void Configure(EntityTypeBuilder<VwColumnViewByColumnId> entity)
    {
        entity.HasNoKey().ToView("VW_ColumnViewByColumnID");
        entity.Property(e => e.ColumnId).ValueGeneratedOnAdd().HasColumnName("ColumnID");
        entity.Property(e => e.Description).HasMaxLength(1000);
        entity.Property(e => e.Title).HasMaxLength(50);
    }
}
