using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwMessageBoardByProjectIdConfig : IEntityTypeConfiguration<MessageBoardByProjectIdDTO>
{
    public void Configure(EntityTypeBuilder<MessageBoardByProjectIdDTO> entity)
    {
        entity.HasNoKey().ToView("VW_MessageBoardByProjectID");
        entity.Property(e => e.Name).HasMaxLength(100);
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishedAt).HasColumnType("datetime");
        entity.Property(e => e.Text).HasMaxLength(2000);
        entity.Property(e => e.Title).HasMaxLength(50);
        entity.Property(e => e.Urllink).HasMaxLength(4000).HasColumnName("URLLink");
    }
}
