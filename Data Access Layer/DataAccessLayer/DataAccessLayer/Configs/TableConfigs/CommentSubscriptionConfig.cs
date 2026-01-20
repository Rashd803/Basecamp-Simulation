using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class CommentSubscriptionConfig : IEntityTypeConfiguration<CommentSubscription>
{
    public void Configure(EntityTypeBuilder<CommentSubscription> entity)
    {
        entity.HasKey(e => e.Id).HasName("PK__CommentS__3214EC270B276243");

        entity.HasIndex(e => e.CommentId, "NCI_CommSub_CommentID");
        entity.HasIndex(e => e.MemberId, "NCI_CommSub_MemberID");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.CommentId).HasColumnName("CommentID");
        entity.Property(e => e.MemberId).HasColumnName("MemberID");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");

        entity.HasOne(d => d.Comment).WithMany(p => p.CommentSubscriptions)
            .HasForeignKey(d => d.CommentId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_ComSubs_Comment");

        entity.HasOne(d => d.Member).WithMany(p => p.CommentSubscriptions)
            .HasForeignKey(d => d.MemberId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__CommentSu__Membe__55009F39");

        entity.HasOne(d => d.Project).WithMany(p => p.CommentSubscriptions)
            .HasForeignKey(d => d.ProjectId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__CommentSu__Proje__51BA1E3A");
    }
}
