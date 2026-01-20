using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class InvitationConfig : IEntityTypeConfiguration<Invitation>
{
    public void Configure(EntityTypeBuilder<Invitation> entity)
    {
        entity.HasKey(e => e.Id).HasName("PK__Invitati__3214EC27B2EC39F5");

        entity.HasIndex(e => e.ProjectId, "NCI_Invt_ProjectID");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.CompanyName).HasMaxLength(100);
        entity.Property(e => e.Email).HasMaxLength(255);
        entity.Property(e => e.JobTitle).HasMaxLength(100);
        entity.Property(e => e.Password).HasMaxLength(50);
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");
        entity.Property(e => e.StatusId).HasColumnName("StatusID");
        entity.Property(e => e.Text).HasMaxLength(500);
        entity.Property(e => e.TheInvitedName).HasMaxLength(100);

        entity.HasOne(d => d.Project).WithMany(p => p.Invitations)
            .HasForeignKey(d => d.ProjectId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Invitatio__Proje__7E02B4CC");

        entity.HasOne(d => d.PublishingInfo).WithMany(p => p.Invitations)
            .HasForeignKey(d => d.PublishingInfoId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_Invit_PubInfoID");

        entity.HasOne(d => d.Status).WithMany(p => p.Invitations)
            .HasForeignKey(d => d.StatusId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_Invit_IntStatID");
    }
}
