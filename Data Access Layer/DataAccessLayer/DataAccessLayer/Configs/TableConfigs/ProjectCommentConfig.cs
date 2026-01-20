using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class ProjectCommentConfig : IEntityTypeConfiguration<ProjectComment>
{
    public void Configure(EntityTypeBuilder<ProjectComment> entity)
    {
        entity.HasKey(e => e.Id)
            .HasName("PK__Comments__3214EC26D4EBF47A")
            .IsClustered(false);

        entity.ToTable(tb => tb.HasTrigger("trg_After_Insert_Comment"));

        entity.HasIndex(e => e.CardId, "NCI_Comment_CardID");
        entity.HasIndex(e => e.DocumentId, "NCI_Comment_DocumentID");
        entity.HasIndex(e => e.EventId, "NCI_Comment_EventID");
        entity.HasIndex(e => e.MessageId, "NCI_Comment_MessageID");
        entity.HasIndex(e => e.ProjectId, "NCI_Comment_ProjectID");
        entity.HasIndex(e => e.StepId, "NCI_Comment_StepID");
        entity.HasIndex(e => e.ToDoId, "NCI_Comment_ToDoID");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.CardId).HasColumnName("CardID");
        entity.Property(e => e.DocumentId).HasColumnName("DocumentID");
        entity.Property(e => e.EventId).HasColumnName("EventID");
        entity.Property(e => e.MessageId).HasColumnName("MessageID");
        entity.Property(e => e.NoteId).HasColumnName("NoteID");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");
        entity.Property(e => e.StepId).HasColumnName("StepID");
        entity.Property(e => e.ToDoId).HasColumnName("To_DoID");

        entity.HasOne(d => d.Card).WithMany(p => p.ProjectComments)
            .HasForeignKey(d => d.CardId)
            .HasConstraintName("FK__Comments__CardID__3F6663D5");

        entity.HasOne(d => d.Document).WithMany(p => p.ProjectComments)
            .HasForeignKey(d => d.DocumentId)
            .HasConstraintName("FK__Comments__Docume__414EAC47");

        entity.HasOne(d => d.Event).WithMany(p => p.ProjectComments)
            .HasForeignKey(d => d.EventId)
            .HasConstraintName("FK__Comments__EventI__3D7E1B63");

        entity.HasOne(d => d.Message).WithMany(p => p.ProjectComments)
            .HasForeignKey(d => d.MessageId)
            .HasConstraintName("FK__Comments__Messag__405A880E");

        entity.HasOne(d => d.Note).WithMany(p => p.ProjectComments)
            .HasForeignKey(d => d.NoteId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Comments__NoteID__4336F4B9");

        entity.HasOne(d => d.Project).WithMany(p => p.ProjectComments)
            .HasForeignKey(d => d.ProjectId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Comments__Projec__3C89F72A");

        entity.HasOne(d => d.PublishingInfo).WithMany(p => p.ProjectComments)
            .HasForeignKey(d => d.PublishingInfoId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Comments__Publis__442B18F2");

        entity.HasOne(d => d.Step).WithMany(p => p.ProjectComments)
            .HasForeignKey(d => d.StepId)
            .HasConstraintName("FK__Comments__StepID__4242D080");

        entity.HasOne(d => d.ToDo).WithMany(p => p.ProjectComments)
            .HasForeignKey(d => d.ToDoId)
            .HasConstraintName("FK__Comments__To_DoI__3E723F9C");
    }
}
