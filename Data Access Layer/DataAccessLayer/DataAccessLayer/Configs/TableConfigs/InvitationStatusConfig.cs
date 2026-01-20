using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class InvitationStatusConfig : IEntityTypeConfiguration<InvitationStatus>
{
    public void Configure(EntityTypeBuilder<InvitationStatus> entity)
    {
        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.Name).HasMaxLength(50);
    }
}
