using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class ChatConfig : IEntityTypeConfiguration<Chat>
{
    public void Configure(EntityTypeBuilder<Chat> entity)
    {
        entity.HasKey(e => e.Id)
            .HasName("PK__Chats__3214EC26AE6092AA")
            .IsClustered(false);

        entity.ToTable(tb => tb.HasTrigger("trg_AfterInsert_Message_To_Chat"));

        entity.HasIndex(e => e.ProjectId, "CLI_Chat_ProjectID").IsClustered();
        entity.HasIndex(e => e.PublishingInfoId, "NCI_Chat_PubInfoID");

        entity.Property(e => e.Id).HasColumnName("ID");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishingInfoId).HasColumnName("PublishingInfoID");

        entity.HasOne(d => d.Project).WithMany(p => p.Chats)
            .HasForeignKey(d => d.ProjectId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK__Chats__ProjectID__14270015");

        entity.HasOne(d => d.PublishingInfo).WithMany(p => p.Chats)
            .HasForeignKey(d => d.PublishingInfoId)
            .OnDelete(DeleteBehavior.ClientSetNull)
            .HasConstraintName("FK_chats_PubInfoID");
    }
}
