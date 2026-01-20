using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwAnswerViewByQuestionIdConfig : IEntityTypeConfiguration<VwAnswerViewByQuestionId>
{
    public void Configure(EntityTypeBuilder<VwAnswerViewByQuestionId> entity)
    {
        entity.HasNoKey().ToView("VW_AnswerViewByQuestionID");
        entity.Property(e => e.Name).HasMaxLength(100);
        entity.Property(e => e.PublishedAt).HasColumnType("datetime");
        entity.Property(e => e.QuestionId).HasColumnName("QuestionID");
        entity.Property(e => e.Text).HasMaxLength(2000);
        entity.Property(e => e.Urllink).HasMaxLength(4000).HasColumnName("URLLink");
    }
}
