using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwMemberConfig : IEntityTypeConfiguration<VwMember>
{
    public void Configure(EntityTypeBuilder<VwMember> entity)
    {
        entity.HasNoKey().ToView("VW_Member");
        entity.Property(e => e.CompanyName).HasMaxLength(150);
        entity.Property(e => e.MemberId).HasColumnName("MemberID");
        entity.Property(e => e.MemberName).HasMaxLength(100);
    }
}
