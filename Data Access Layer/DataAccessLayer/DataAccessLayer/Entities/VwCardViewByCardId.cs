using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwCardViewByCardId
{
    public int CardId { get; set; }

    public string ColumnTitle { get; set; } = null!;

    public string CardTitle { get; set; } = null!;

    public DateTime? FromDate { get; set; }

    public DateTime? ToDate { get; set; }

    public DateTime PublishedAt { get; set; }

    public string Name { get; set; } = null!;
}
