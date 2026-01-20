using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class ScheduleConfig : IEntityTypeConfiguration<Schedule>
{
    public void Configure(EntityTypeBuilder<Schedule> entity)
    {
        entity.HasKey(e => e.Id).HasName("PK__Schedule__3214EC2762E7FFF6");

        entity.ToTable(tb =>
        {
            tb.HasTrigger("trg_After_Insert_Schedule");
            tb.HasTrigger("trg_After_Update_Schedule");
        });

        entity.HasIndex(e => e.ScheduleTypeId, "NCI_Schedule_TypeID");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.FromDate).HasColumnType("datetime");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.ScheduleTypeId).HasColumnName("ScheduleTypeID");
        entity.Property(e => e.ToDate).HasColumnType("datetime");

        entity.HasOne(d => d.Project).WithMany(p => p.Schedules)
            .HasForeignKey(d => d.ProjectId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Schedules__Proje__27F8EE98");

        entity.HasOne(d => d.ScheduleType).WithMany(p => p.Schedules)
            .HasForeignKey(d => d.ScheduleTypeId)
            .HasConstraintName("FK__Schedules__Sched__114A936A");
    }
}
