using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class QuestionConfig : IEntityTypeConfiguration<Question>
{
    public void Configure(EntityTypeBuilder<Question> entity)
    {
        entity.HasKey(e => e.Id)
            .HasName("PK__Question__3214EC26F8374085")
            .IsClustered(false);

        entity.ToTable(tb => tb.HasTrigger("trg_After_Insert_Question"));

        entity.HasIndex(e => e.ProjectId, "CLI_Quest_ProjectID").IsClustered();

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");
        entity.Property(e => e.ScheduleId).HasColumnName("ScheduleID");
        entity.Property(e => e.Text).HasMaxLength(100);

        entity.HasOne(d => d.Project).WithMany(p => p.Questions)
            .HasForeignKey(d => d.ProjectId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Questions__Proje__45BE5BA9");

        entity.HasOne(d => d.PublishingInfo).WithMany(p => p.Questions)
            .HasForeignKey(d => d.PublishingInfoId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Questions__Publi__3DB3258D");

        entity.HasOne(d => d.Schedule).WithMany(p => p.Questions)
            .HasForeignKey(d => d.ScheduleId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Questions__Sched__47A6A41B");
    }
}
