using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class MemberConfig : IEntityTypeConfiguration<Member>
{
    public void Configure(EntityTypeBuilder<Member> entity)
    {
        entity.HasKey(e => e.Id).HasName("PK__Members__3214EC2795F36721");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.AdminId).HasColumnName("AdminID");
        entity.Property(e => e.UserId).HasColumnName("UserID");

        entity.HasOne(d => d.Admin).WithMany(p => p.InverseAdmin)
            .HasForeignKey(d => d.AdminId)
            .HasConstraintName("FK__Members__AdminID__72C60C4A");

        entity.HasOne(d => d.User).WithMany(p => p.Members)
            .HasForeignKey(d => d.UserId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Members__UserID__71D1E811");
    }
}
