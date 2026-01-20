using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class AssignmentConfig : IEntityTypeConfiguration<Assignment>
{
    public void Configure(EntityTypeBuilder<Assignment> entity)
    {
        entity.HasKey(e => e.Id).HasName("PK__Assignme__3214EC27CEA234D5");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.CardId).HasColumnName("CardID");
        entity.Property(e => e.ClientId).HasColumnName("ClientID");
        entity.Property(e => e.EventId).HasColumnName("EventID");
        entity.Property(e => e.MemberId).HasColumnName("MemberID");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.QuestionId).HasColumnName("QuestionID");
        entity.Property(e => e.StepId).HasColumnName("StepID");
        entity.Property(e => e.ToDoId).HasColumnName("To_DoID");

        entity.HasOne(d => d.Card).WithMany(p => p.Assignments)
            .HasForeignKey(d => d.CardId)
            .HasConstraintName("FK_Assign_CardID");

        entity.HasOne(d => d.Client).WithMany(p => p.Assignments)
            .HasForeignKey(d => d.ClientId)
            .HasConstraintName("Assign_ClientID");

        entity.HasOne(d => d.Event).WithMany(p => p.Assignments)
            .HasForeignKey(d => d.EventId)
            .HasConstraintName("FK__Assignmen__Quest__7755B73D");

        entity.HasOne(d => d.Member).WithMany(p => p.Assignments)
            .HasForeignKey(d => d.MemberId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Assignmen__Membe__7E37BEF6");

        entity.HasOne(d => d.Project).WithMany(p => p.Assignments)
            .HasForeignKey(d => d.ProjectId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Assignmen__Proje__7F2BE32F");

        entity.HasOne(d => d.Question).WithMany(p => p.Assignments)
            .HasForeignKey(d => d.QuestionId)
            .HasConstraintName("FK__Assignmen__Quest__7A3223E8");

        entity.HasOne(d => d.Step).WithMany(p => p.Assignments)
            .HasForeignKey(d => d.StepId)
            .HasConstraintName("FK__Assignmen__StepI__793DFFAF");

        entity.HasOne(d => d.ToDo).WithMany(p => p.Assignments)
            .HasForeignKey(d => d.ToDoId)
            .HasConstraintName("FK__Assignmen__To_Do__7849DB76");
    }
}
