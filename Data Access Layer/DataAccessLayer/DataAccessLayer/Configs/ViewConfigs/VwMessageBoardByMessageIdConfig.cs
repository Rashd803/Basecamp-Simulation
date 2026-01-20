using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwMessageBoardByMessageIdConfig : IEntityTypeConfiguration<VwMessageBoardByMessageId>
{
    public void Configure(EntityTypeBuilder<VwMessageBoardByMessageId> entity)
    {
        entity.HasNoKey().ToView("VW_MessageBoardByMessageID");
        entity.Property(e => e.MessageId).HasColumnName("MessageID");
        entity.Property(e => e.Name).HasMaxLength(100);
        entity.Property(e => e.PublishedAt).HasColumnType("datetime");
        entity.Property(e => e.Text).HasMaxLength(2000);
        entity.Property(e => e.Title).HasMaxLength(50);
        entity.Property(e => e.Urllink).HasMaxLength(4000).HasColumnName("URLLink");
    }
}
