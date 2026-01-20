using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwActivityViewByProjectIdConfig : IEntityTypeConfiguration<VwActivityViewByProjectId>
{
    public void Configure(EntityTypeBuilder<VwActivityViewByProjectId> entity)
    {
        entity.HasNoKey().ToView("VW_ActivityViewByProjectID");
        entity.Property(e => e.AnswerId).HasColumnName("AnswerID");
        entity.Property(e => e.CardId).HasColumnName("CardID");
        entity.Property(e => e.ChatId).HasColumnName("ChatID");
        entity.Property(e => e.CommentId).HasColumnName("CommentID");
        entity.Property(e => e.DocumentId).HasColumnName("DocumentID");
        entity.Property(e => e.EventId).HasColumnName("EventID");
        entity.Property(e => e.MessageId).HasColumnName("MessageID");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishedAt).HasColumnType("datetime");
        entity.Property(e => e.Text).HasMaxLength(500);
    }
}
