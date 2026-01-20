using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwToDoViewByListId
{
    public int ListId { get; set; }

    public bool Checked { get; set; }

    public string Text { get; set; } = null!;

    public string Name { get; set; } = null!;

    public DateTime? FromDate { get; set; }

    public DateTime? ToDate { get; set; }

    public bool IsPrivate { get; set; }
}
