using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwColumnViewByColumnId
{
    public int ColumnId { get; set; }

    public string Title { get; set; } = null!;

    public string? Description { get; set; }
}
