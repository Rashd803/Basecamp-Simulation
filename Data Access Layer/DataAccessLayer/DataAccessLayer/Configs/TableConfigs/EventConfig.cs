using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class EventConfig : IEntityTypeConfiguration<Event>
{
    public void Configure(EntityTypeBuilder<Event> entity)
    {
        entity.HasKey(e => e.Id)
            .HasName("PK__Events__3214EC269775F942")
            .IsClustered(false);

        entity.ToTable(tb => tb.HasTrigger("trg_After_Insert_Event"));

        entity.HasIndex(e => e.ProjectId, "CLI_Event_ProjectID").IsClustered();
        entity.HasIndex(e => e.PublishingInfoId, "NCI_Event_PubInfoID");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.Name).HasMaxLength(50);
        entity.Property(e => e.NoteId).HasColumnName("NoteID");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");
        entity.Property(e => e.ScheduleId).HasColumnName("ScheduleID");
        entity.Property(e => e.Urllink)
            .HasMaxLength(500)
            .HasColumnName("URLLink");

        entity.HasOne(d => d.Note).WithMany(p => p.Events)
            .HasForeignKey(d => d.NoteId)
            .HasConstraintName("FK_Events_Comment");

        entity.HasOne(d => d.Project).WithMany(p => p.Events)
            .HasForeignKey(d => d.ProjectId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Events__ProjectI__2A164134");

        entity.HasOne(d => d.PublishingInfo).WithMany(p => p.Events)
            .HasForeignKey(d => d.PublishingInfoId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_Event_PubInfoID");

        entity.HasOne(d => d.Schedule).WithMany(p => p.Events)
            .HasForeignKey(d => d.ScheduleId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_Event_Schedules");
    }
}
