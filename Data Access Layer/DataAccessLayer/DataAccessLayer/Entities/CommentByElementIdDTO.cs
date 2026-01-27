using System;
using System.Collections.Generic;
using DataAccessLayer.Entities;

namespace DataAccessLayer.Entities;

public partial class CommentByElementIdDTO
{
    public int CommentId { get; set; }
    public int? MessageId { get; set; }

    public int? DocumentId { get; set; }

    public int? EventId { get; set; }

    public int? ToDoId { get; set; }

    public int? CardId { get; set; }
    public int? StepId { get; set; }
    public int NoteID { get; set; }
    
    public string? Text { get; set; }

    public string? Urllink { get; set; }

    public DateTime PublishedAt { get; set; }

    public string Name { get; set; } = null!;
}
