using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwCardViewByCardIdConfig : IEntityTypeConfiguration<CardByCardIdDTO>
{
    public void Configure(EntityTypeBuilder<CardByCardIdDTO> entity)
    {
        entity.HasNoKey().ToView("VW_CardViewByCardID");
        entity.Property(e => e.CardId).HasColumnName("CardID");
        entity.Property(e => e.CardTitle).HasMaxLength(50);
        entity.Property(e => e.ColumnTitle).HasMaxLength(50);
        entity.Property(e => e.FromDate).HasColumnType("datetime");
        entity.Property(e => e.Username).HasMaxLength(100);
        entity.Property(e => e.PublishedAt).HasColumnType("datetime");
        entity.Property(e => e.ToDate).HasColumnType("datetime");
    }
}
