using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwCardViewByColumnIdConfig : IEntityTypeConfiguration<VwCardViewByColumnId>
{
    public void Configure(EntityTypeBuilder<VwCardViewByColumnId> entity)
    {
        entity.HasNoKey().ToView("VW_CardViewByColumnID");
        entity.Property(e => e.CardId).HasColumnName("CardID");
        entity.Property(e => e.ColumnId).HasColumnName("ColumnID");
        entity.Property(e => e.FromDate).HasColumnType("datetime");
        entity.Property(e => e.Username).HasMaxLength(100);
        entity.Property(e => e.PublishedAt).HasColumnType("datetime");
        entity.Property(e => e.Title).HasMaxLength(50);
        entity.Property(e => e.ToDate).HasColumnType("datetime");
    }
}
