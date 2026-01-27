using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwCardViewByColumnId
{
    public int CardId { get; set; }

    public int ColumnId { get; set; }

    public string Title { get; set; } = null!;

    public DateTime? FromDate { get; set; }

    public DateTime? ToDate { get; set; }

    public DateTime PublishedAt { get; set; }

    public string Username { get; set; } = null!;

    public bool IsPrivate { get; set; }
}
