using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class MessageBoardConfig : IEntityTypeConfiguration<MessageBoard>
{
    public void Configure(EntityTypeBuilder<MessageBoard> entity)
    {
        entity.HasKey(e => e.Id)
            .HasName("PK__MessageB__3214EC2619ACF91F")
            .IsClustered(false);

        entity.ToTable(tb => tb.HasTrigger("trg_After_Insert_MessageBoard"));

        entity.HasIndex(e => e.ProjectId, "CLI_MsgBoard_ProjectID").IsClustered();

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.NoteId).HasColumnName("NoteID");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");
        entity.Property(e => e.Title).HasMaxLength(50);

        entity.HasOne(d => d.Note).WithMany(p => p.MessageBoards)
            .HasForeignKey(d => d.NoteId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_MessageBoards_Note");

        entity.HasOne(d => d.Project).WithMany(p => p.MessageBoards)
            .HasForeignKey(d => d.ProjectId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_MessageBoards_Project");

        entity.HasOne(d => d.PublishingInfo).WithMany(p => p.MessageBoards)
            .HasForeignKey(d => d.PublishingInfoId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_MessageBoards_PublishingInfo");
    }
}
