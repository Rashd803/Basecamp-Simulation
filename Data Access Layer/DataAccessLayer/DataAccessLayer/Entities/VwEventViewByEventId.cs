using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwEventViewByEventId
{
    public int EventId { get; set; }

    public string Name { get; set; } = null!;

    public DateTime FromDate { get; set; }

    public DateTime ToDate { get; set; }

    public string? EventUrllink { get; set; }

    public bool IsPrivate { get; set; }

    public string? Text { get; set; }

    public string? NoteUrllink { get; set; }
}
