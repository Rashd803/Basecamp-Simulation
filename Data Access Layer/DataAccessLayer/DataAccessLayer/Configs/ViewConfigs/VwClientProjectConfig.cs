using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwClientProjectConfig : IEntityTypeConfiguration<VwClientProject>
{
    public void Configure(EntityTypeBuilder<VwClientProject> entity)
    {
        entity.HasNoKey().ToView("VW_ClientProject");
        entity.Property(e => e.ClientId).HasColumnName("ClientID");
        entity.Property(e => e.ClientName).HasMaxLength(100);
        entity.Property(e => e.CompanyName).HasMaxLength(150);
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
    }
}
