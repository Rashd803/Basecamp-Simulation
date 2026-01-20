using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwColumnViewByProjectId
{
    public int ProjectId { get; set; }

    public int ColumnId { get; set; }

    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    public bool IsPrivate { get; set; }
}
