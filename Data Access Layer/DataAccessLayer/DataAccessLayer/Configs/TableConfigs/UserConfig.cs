using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class UserConfig : IEntityTypeConfiguration<User>
{
    public void Configure(EntityTypeBuilder<User> entity)
    {
        entity.HasKey(e => e.Id).HasName("PK__Users__3214EC27674662D8");

        entity.HasIndex(e => e.Password, "UQ_Users_Password").IsUnique();

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.CompanyName).HasMaxLength(150);
        entity.Property(e => e.Email).HasMaxLength(300);
        entity.Property(e => e.JobTitle).HasMaxLength(50);
        entity.Property(e => e.Name).HasMaxLength(100);
        entity.Property(e => e.Password).HasMaxLength(50);
    }
}
