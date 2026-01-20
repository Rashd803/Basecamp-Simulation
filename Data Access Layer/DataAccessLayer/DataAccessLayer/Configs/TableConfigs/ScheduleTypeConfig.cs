using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class ScheduleTypeConfig : IEntityTypeConfiguration<ScheduleType>
{
    public void Configure(EntityTypeBuilder<ScheduleType> entity)
    {
        entity.HasKey(e => e.Id).HasName("PK__Schedule__3214EC27CFEC3A3B");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.Name).HasMaxLength(50);
    }
}
