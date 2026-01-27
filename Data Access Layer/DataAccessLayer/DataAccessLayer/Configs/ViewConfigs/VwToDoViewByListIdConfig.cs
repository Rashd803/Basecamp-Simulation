using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwToDoViewByListIdConfig : IEntityTypeConfiguration<ToDoByListIdDTO>
{
    public void Configure(EntityTypeBuilder<ToDoByListIdDTO> entity)
    {
        entity.HasNoKey().ToView("VW_ToDoViewByListID");
        entity.Property(e => e.FromDate).HasColumnType("datetime");
        entity.Property(e => e.ListId).HasColumnName("ListID");
        entity.Property(e => e.Name).HasMaxLength(100);
        entity.Property(e => e.Text).HasMaxLength(500);
        entity.Property(e => e.ToDate).HasColumnType("datetime");
    }
}
