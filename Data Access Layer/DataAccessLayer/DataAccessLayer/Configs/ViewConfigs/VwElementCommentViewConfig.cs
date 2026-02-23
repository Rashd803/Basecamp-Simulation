using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwElementCommentViewConfig : IEntityTypeConfiguration<CommentByElementIDDTO>
{
    public void Configure(EntityTypeBuilder<CommentByElementIDDTO> entity)
    {
        entity.HasNoKey().ToView("VW_ElementCommentView");
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
