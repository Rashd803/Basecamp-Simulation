using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class ToDoConfig : IEntityTypeConfiguration<ToDo>
{
    public void Configure(EntityTypeBuilder<ToDo> entity)
    {
        entity.HasKey(e => e.Id)
            .HasName("PK__To_Dos__3214EC26C2394C40")
            .IsClustered(false);

        entity.ToTable("To_Dos", tb => tb.HasTrigger("trg_After_Insert_ToDo"));

        entity.HasIndex(e => e.ListId, "CLI_ToDo_ListID").IsClustered();
        entity.HasIndex(e => e.PublishingInfoId, "NCI_ToDo_PubInfoID");
        entity.HasIndex(e => e.ScheduleId, "NCI_ToDo_ScheduleID");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.ListId).HasColumnName("ListID");
        entity.Property(e => e.NoteId).HasColumnName("NoteID");
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");
        entity.Property(e => e.ScheduleId).HasColumnName("ScheduleID");
        entity.Property(e => e.Text).HasMaxLength(500);

        entity.HasOne(d => d.List).WithMany(p => p.ToDos)
            .HasForeignKey(d => d.ListId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__To_Dos__ListID__3864608B");

        entity.HasOne(d => d.Note).WithMany(p => p.ToDos)
            .HasForeignKey(d => d.NoteId)
            .HasConstraintName("FK_To_Dos_Note");

        entity.HasOne(d => d.PublishingInfo).WithMany(p => p.ToDos)
            .HasForeignKey(d => d.PublishingInfoId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_ToDo_PubInfoID");

        entity.HasOne(d => d.Schedule).WithMany(p => p.ToDos)
            .HasForeignKey(d => d.ScheduleId)
            .HasConstraintName("FK__To_Dos__Schedule__3587F3E0");
    }
}
