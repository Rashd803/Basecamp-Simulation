using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwCommentViewByElementIdConfig : IEntityTypeConfiguration<VwCommentViewByElementId>
{
    public void Configure(EntityTypeBuilder<VwCommentViewByElementId> entity)
    {
        entity.HasNoKey().ToView("VW_CommentViewByElementID");
        entity.Property(e => e.CardId).HasColumnName("CardID");
        entity.Property(e => e.DocumentId).HasColumnName("DocumentID");
        entity.Property(e => e.EventId).HasColumnName("EventID");
        entity.Property(e => e.MessageId).HasColumnName("MessageID");
        entity.Property(e => e.Name).HasMaxLength(100);
        entity.Property(e => e.PublishedAt).HasColumnType("datetime");
        entity.Property(e => e.StepId).HasColumnName("StepID");
        entity.Property(e => e.Text).HasMaxLength(2000);
        entity.Property(e => e.ToDoId).HasColumnName("To_DoID");
        entity.Property(e => e.Urllink).HasMaxLength(4000).HasColumnName("URLLink");
    }
}
