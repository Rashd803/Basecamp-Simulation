using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class ClientConfig : IEntityTypeConfiguration<Client>
{
    public void Configure(EntityTypeBuilder<Client> entity)
    {
        entity.HasKey(e => e.Id).HasName("PK__Clients__3214EC27D4741CC3");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.UserId).HasColumnName("UserID");

        entity.HasOne(d => d.User).WithMany(p => p.Clients)
            .HasForeignKey(d => d.UserId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Clients__UserID__75A278F5");
    }
}
