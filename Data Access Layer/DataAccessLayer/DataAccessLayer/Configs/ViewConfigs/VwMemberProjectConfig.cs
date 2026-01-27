using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwMemberProjectConfig : IEntityTypeConfiguration<MemberProjectDTO>
{
    public void Configure(EntityTypeBuilder<MemberProjectDTO> entity)
    {
        entity.HasNoKey().ToView("VW_MemberProject");
        entity.Property(e => e.CompanyName).HasMaxLength(150);
        entity.Property(e => e.MemberId).HasColumnName("MemberID");
        entity.Property(e => e.MemberName).HasMaxLength(100);
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
    }
}
