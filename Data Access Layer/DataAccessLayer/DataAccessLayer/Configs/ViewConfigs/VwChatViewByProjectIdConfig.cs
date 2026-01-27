using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwChatViewByProjectIdConfig : IEntityTypeConfiguration<ChatByProjectIdDTO>
{
    public void Configure(EntityTypeBuilder<ChatByProjectIdDTO> entity)
    {
        entity.HasNoKey().ToView("VW_ChatViewByProjectID");
        entity.Property(e => e.Username). HasMaxLength(100);
        entity.Property(e => e.ProjectId).HasColumnName("ProjectID");
        entity.Property(e => e.PublishedAt).HasColumnType("datetime");
    }
}
