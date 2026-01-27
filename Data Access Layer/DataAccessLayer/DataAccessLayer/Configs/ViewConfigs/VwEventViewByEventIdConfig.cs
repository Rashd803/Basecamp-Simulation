using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwEventViewByEventIdConfig : IEntityTypeConfiguration<EventByEventIdDTO>
{
    public void Configure(EntityTypeBuilder<EventByEventIdDTO> entity)
    {
        entity.HasNoKey().ToView("VW_EventViewByEventID");
        entity.Property(e => e.EventId).HasColumnName("EventID");
        entity.Property(e => e.EventUrllink).HasMaxLength(500).HasColumnName("EventURLLink");
        entity.Property(e => e.FromDate).HasColumnType("datetime");
        entity.Property(e => e.Username).HasMaxLength(50);
        entity.Property(e => e.NoteUrllink).HasMaxLength(4000).HasColumnName("NoteURLLink");
        entity.Property(e => e.Text).HasMaxLength(2000);
        entity.Property(e => e.ToDate).HasColumnType("datetime");
    }
}
