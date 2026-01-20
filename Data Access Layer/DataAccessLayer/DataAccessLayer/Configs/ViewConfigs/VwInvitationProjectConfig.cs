using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwInvitationProjectConfig : IEntityTypeConfiguration<VwInvitationProject>
{
    public void Configure(EntityTypeBuilder<VwInvitationProject> entity)
    {
        entity.HasNoKey().ToView("VW_InvitationProject");
        entity.Property(e => e.InvitationId).HasColumnName("InvitationID");
        entity.Property(e => e.Name).HasMaxLength(50);
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishedAt).HasColumnType("datetime");
        entity.Property(e => e.TheInvitedName).HasMaxLength(100);
    }
}
