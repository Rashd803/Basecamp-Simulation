using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class AnswerConfig : IEntityTypeConfiguration<Answer>
{
    public void Configure(EntityTypeBuilder<Answer> entity)
    {
        entity.ToTable(tb => tb.HasTrigger("trg_After_Insert_Answer"));

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.AnswerId).HasColumnName("AnswerID");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");
        entity.Property(e => e.QuestionId).HasColumnName("QuestionID");

        entity.HasOne(d => d.AnswerNavigation).WithMany(p => p.Answers)
            .HasForeignKey(d => d.AnswerId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_Answer_Note");

        entity.HasOne(d => d.Project).WithMany(p => p.Answers)
            .HasForeignKey(d => d.ProjectId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Answers__Project__3CBF0154");

        entity.HasOne(d => d.PublishingInfo).WithMany(p => p.Answers)
            .HasForeignKey(d => d.PublishingInfoId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Answers__Publish__3F9B6DFF");

        entity.HasOne(d => d.Question).WithMany(p => p.Answers)
            .HasForeignKey(d => d.QuestionId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Answers__Project__3AD6B8E2");
    }
}
