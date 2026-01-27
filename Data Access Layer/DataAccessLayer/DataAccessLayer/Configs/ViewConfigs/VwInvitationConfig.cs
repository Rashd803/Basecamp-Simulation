using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwInvitationConfig : IEntityTypeConfiguration<InvitationDTO>
{
    public void Configure(EntityTypeBuilder<InvitationDTO> entity)
    {
        entity.HasNoKey().ToView("VW_Invitation");
        entity.Property(e => e.CompanyName).HasMaxLength(100);
        entity.Property(e => e.Email).HasMaxLength(255);
        entity.Property(e => e.InvitationId).HasColumnName("InvitationID");
        entity.Property(e => e.InviterName).HasMaxLength(100);
        entity.Property(e => e.JobTitle).HasMaxLength(100);
        entity.Property(e => e.Name).HasMaxLength(50);
        entity.Property(e => e.PublishedAt).HasColumnType("datetime");
        entity.Property(e => e.Text).HasMaxLength(500);
        entity.Property(e => e.TheInvitedName).HasMaxLength(100);
    }
}
