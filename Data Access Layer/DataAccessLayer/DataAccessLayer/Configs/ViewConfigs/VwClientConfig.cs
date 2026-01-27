using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwClientConfig : IEntityTypeConfiguration<ClientDTO>
{
    public void Configure(EntityTypeBuilder<ClientDTO> entity)
    {
        entity.HasNoKey().ToView("VW_Client");
        entity.Property(e => e.ClientId).HasColumnName("ClientID");
        entity.Property(e => e.ClientName).HasMaxLength(100);
        entity.Property(e => e.CompanyName).HasMaxLength(150);
        entity.Property(e => e.Email).HasMaxLength(300);
        entity.Property(e => e.JobTitle).HasMaxLength(50);
    }
}
