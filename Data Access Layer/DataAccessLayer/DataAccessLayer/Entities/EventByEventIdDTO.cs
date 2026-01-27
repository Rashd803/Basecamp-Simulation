using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class EventByEventIdDTO
{
    public int EventId { get; set; }

    public string EventName { get; set; } = null!;

    public DateTime FromDate { get; set; }

    public DateTime ToDate { get; set; }
    public DateTime PublishedAt { get; set; }


    public string? EventUrllink { get; set; }

    public bool IsPrivate { get; set; }
    public bool? NoteID { get; set; }

    public string? Text { get; set; }

    public string? NoteUrllink { get; set; }
    public string Username { get; set; }

}
