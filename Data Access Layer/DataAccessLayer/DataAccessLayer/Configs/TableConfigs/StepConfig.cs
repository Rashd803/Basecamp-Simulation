using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class StepConfig : IEntityTypeConfiguration<Step>
{
    public void Configure(EntityTypeBuilder<Step> entity)
    {
        entity.HasKey(e => e.Id)
            .HasName("PK__Steps__3214EC267CFDF8B9")
            .IsClustered(false);

        entity.ToTable(tb => tb.HasTrigger("trg_After_Insert_Step"));

        entity.HasIndex(e => e.CardId, "CLI_Step_CardID").IsClustered();
        entity.HasIndex(e => e.PublishingInfoId, "NCI_Step_PubInfoID");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.CardId).HasColumnName("CardID");
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");
        entity.Property(e => e.Text).HasMaxLength(500);

        entity.HasOne(d => d.Card).WithMany(p => p.Steps)
            .HasForeignKey(d => d.CardId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Steps__CardID__236943A5");

        entity.HasOne(d => d.PublishingInfo).WithMany(p => p.Steps)
            .HasForeignKey(d => d.PublishingInfoId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_Step_PubInfoID");
    }
}
