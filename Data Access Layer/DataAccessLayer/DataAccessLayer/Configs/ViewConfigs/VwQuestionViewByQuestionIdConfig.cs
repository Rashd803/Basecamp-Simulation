using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwQuestionViewByQuestionIdConfig : IEntityTypeConfiguration<QuestionByQuestionIdDTO>
{
    public void Configure(EntityTypeBuilder<QuestionByQuestionIdDTO> entity)
    {
        entity.HasNoKey().ToView("VW_QuestionViewByQuestionID");
        entity.Property(e => e.FromDate).HasColumnType("datetime");
        entity.Property(e => e.QuestionId).HasColumnName("QuestionID");
        entity.Property(e => e.Text).HasMaxLength(100);
        entity.Property(e => e.ToDate).HasColumnType("datetime");
    }
}
