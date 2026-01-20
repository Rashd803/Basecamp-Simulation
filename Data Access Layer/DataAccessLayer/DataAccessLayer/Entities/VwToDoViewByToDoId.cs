using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwToDoViewByToDoId
{
    public int ToDoId { get; set; }

    public string Text { get; set; } = null!;

    public bool Checked { get; set; }

    public bool IsPrivate { get; set; }

    public string? NoteText { get; set; }

    public string? Urllink { get; set; }

    public DateTime PublishedAt { get; set; }

    public string Name { get; set; } = null!;
}
