using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwElementCommentView
{
    public int? MessageId { get; set; }

    public int? DocumentId { get; set; }

    public int? EventId { get; set; }

    public int? ToDoId { get; set; }

    public int? CardId { get; set; }

    public int? StepId { get; set; }

    public string? Text { get; set; }

    public string? Urllink { get; set; }

    public DateTime PublishedAt { get; set; }

    public string Name { get; set; } = null!;
}
