using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwAssignmentByElementIdConfig : IEntityTypeConfiguration<AssignmentByElementIdDTO>
{
    public void Configure(EntityTypeBuilder<AssignmentByElementIdDTO> entity)
    {
        entity.HasNoKey().ToView("VW_AssignmentByElementID");
        entity.Property(e => e.CardId).HasColumnName("CardID");
        entity.Property(e => e.EventId).HasColumnName("EventID");
        entity.Property(e => e.MemberName).HasMaxLength(100);
        entity.Property(e => e.QuestionId).HasColumnName("QuestionID");
        entity.Property(e => e.StepId).HasColumnName("StepID");
        entity.Property(e => e.ToDoId).HasColumnName("To_DoID");
    }
}
