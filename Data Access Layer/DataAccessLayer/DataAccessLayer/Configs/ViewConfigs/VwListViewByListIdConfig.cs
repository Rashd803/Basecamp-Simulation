using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using DataAccessLayer.Entities;

public class VwListViewByListIdConfig : IEntityTypeConfiguration<VwListViewByListId>
{
    public void Configure(EntityTypeBuilder<VwListViewByListId> entity)
    {
        entity.HasNoKey().ToView("VW_ListViewByListID");
        entity.Property(e => e.ListId).HasColumnName("ListID");
        entity.Property(e => e.Text).HasMaxLength(2000);
        entity.Property(e => e.Title).HasMaxLength(50);
        entity.Property(e => e.Urllink).HasMaxLength(4000).HasColumnName("URLLink");
    }
}
