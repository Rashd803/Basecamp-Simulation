using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class ActivityConfig : IEntityTypeConfiguration<Activity>
{
    public void Configure(EntityTypeBuilder<Activity> entity)
    {
        entity.HasKey(e => e.Id)
            .HasName("PK__Activiti__3214EC262FA175F4")
            .IsClustered(false);

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.AnswerId).HasColumnName("AnswerID");
        entity.Property(e => e.CardId).HasColumnName("CardID");
        entity.Property(e => e.ChatId).HasColumnName("ChatID");
        entity.Property(e => e.CommentId).HasColumnName("CommentID");
        entity.Property(e => e.DocumentId).HasColumnName("DocumentID");
        entity.Property(e => e.EventId).HasColumnName("EventID");
        entity.Property(e => e.MessageId).HasColumnName("MessageID");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");
        entity.Property(e => e.QuestionId).HasColumnName("QuestionID");
        entity.Property(e => e.StepId).HasColumnName("StepID");
        entity.Property(e => e.Text).HasMaxLength(500);
        entity.Property(e => e.ToDoId).HasColumnName("To_DoID");

        entity.HasOne(d => d.Answer).WithMany(p => p.Activities)
            .HasForeignKey(d => d.AnswerId)
            .HasConstraintName("FK_Activit_AnswerID");

        entity.HasOne(d => d.Card).WithMany(p => p.Activities)
            .HasForeignKey(d => d.CardId)
            .HasConstraintName("FK__Activitie__CardI__6CD828CA");

        entity.HasOne(d => d.Chat).WithMany(p => p.Activities)
            .HasForeignKey(d => d.ChatId)
            .HasConstraintName("FK__Activitie__ChatI__7EC1CEDB");

        entity.HasOne(d => d.Document).WithMany(p => p.Activities)
            .HasForeignKey(d => d.DocumentId)
            .HasConstraintName("FK__Activitie__Docum__6EC0713C");

        entity.HasOne(d => d.Event).WithMany(p => p.Activities)
            .HasForeignKey(d => d.EventId)
            .HasConstraintName("FK__Activitie__Event__6AEFE058");

        entity.HasOne(d => d.Message).WithMany(p => p.Activities)
            .HasForeignKey(d => d.MessageId)
            .HasConstraintName("FK__Activitie__Messa__6DCC4D03");

        entity.HasOne(d => d.Project).WithMany(p => p.Activities)
            .HasForeignKey(d => d.ProjectId)
            .HasConstraintName("FK__Activitie__Proje__69FBBC1F");

        entity.HasOne(d => d.PublishingInfo).WithMany(p => p.Activities)
            .HasForeignKey(d => d.PublishingInfoId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Activitie__Publi__6BAEFA67");

        entity.HasOne(d => d.Question).WithMany(p => p.Activities)
            .HasForeignKey(d => d.QuestionId)
            .HasConstraintName("FK_Activ_QuestID");

        entity.HasOne(d => d.Step).WithMany(p => p.Activities)
            .HasForeignKey(d => d.StepId)
            .HasConstraintName("FK__Activitie__StepI__6FB49575");

        entity.HasOne(d => d.ToDo).WithMany(p => p.Activities)
            .HasForeignKey(d => d.ToDoId)
            .HasConstraintName("FK__Activitie__To_Do__6BE40491");
    }
}
