using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwStepViewByCardIdConfig : IEntityTypeConfiguration<VwStepViewByCardId>
{
    public void Configure(EntityTypeBuilder<VwStepViewByCardId> entity)
    {
        entity.HasNoKey().ToView("VW_StepViewByCardID");
        entity.Property(e => e.CardId).HasColumnName("CardID");
        entity.Property(e => e.Text).HasMaxLength(500);
    }
}
