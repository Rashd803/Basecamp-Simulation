using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwToDoViewByToDoIdConfig : IEntityTypeConfiguration<VwToDoViewByToDoId>
{
    public void Configure(EntityTypeBuilder<VwToDoViewByToDoId> entity)
    {
        entity.HasNoKey().ToView("VW_ToDoViewByToDoID");
        entity.Property(e => e.Name).HasMaxLength(100);
        entity.Property(e => e.NoteText).HasMaxLength(2000);
        entity.Property(e => e.PublishedAt).HasColumnType("datetime");
        entity.Property(e => e.Text).HasMaxLength(500);
        entity.Property(e => e.ToDoId).HasColumnName("To_DoID");
        entity.Property(e => e.Urllink).HasMaxLength(4000).HasColumnName("URLLink");
    }
}
