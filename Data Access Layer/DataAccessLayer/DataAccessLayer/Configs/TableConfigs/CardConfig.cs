using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class CardConfig : IEntityTypeConfiguration<Card>
{
    public void Configure(EntityTypeBuilder<Card> entity)
    {
        entity.HasKey(e => e.Id)
            .HasName("PK__Cards__3214EC2672C6834D")
            .IsClustered(false);

        entity.ToTable(tb => tb.HasTrigger("trg_After_Insert_Card"));

        entity.HasIndex(e => e.ColumnId, "CLI_Card_ColumnID").IsClustered();

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.ColumnId).HasColumnName("ColumnID");
        entity.Property(e => e.IsPrivate).HasDefaultValue(true);
        entity.Property(e => e.NoteId).HasColumnName("NoteID");
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");
        entity.Property(e => e.ScheduleId).HasColumnName("ScheduleID");
        entity.Property(e => e.Title).HasMaxLength(50);
    }
}
