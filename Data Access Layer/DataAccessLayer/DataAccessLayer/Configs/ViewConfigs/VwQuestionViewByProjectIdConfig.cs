using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwQuestionViewByProjectIdConfig : IEntityTypeConfiguration<QuestionByProjectIdDTO>
{
    public void Configure(EntityTypeBuilder<QuestionByProjectIdDTO> entity)
    {
        entity.HasNoKey().ToView("VW_QuestionViewByProjectID");
        entity.Property(e => e.FromDate).HasColumnType("datetime");
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.Text).HasMaxLength(100);
        entity.Property(e => e.ToDate).HasColumnType("datetime");
    }
}
