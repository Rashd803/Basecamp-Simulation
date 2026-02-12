using System;
using System.Collections.Generic;
using DataAccessLayer.Entities;

namespace DataAccessLayer.Entities;

public partial class CommentDTO

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

    public Document Document { get; set; }
    public MessageBoard Message { get; set; }
    public Event Event { get; set; }
    public Card Card { get; set; }
    public ToDo To_Do { get; set; }
    public Step Step { get; set; }

}
