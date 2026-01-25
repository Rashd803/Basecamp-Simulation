using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwMessageBoardByMessageId
{
    public int MessageId { get; set; }

    public string? Title { get; set; }

    public int NoteID { get; set; }

    public string? Text { get; set; }

    public string? Urllink { get; set; }

    public DateTime? PublishedAt { get; set; }

    public string? Name { get; set; }
}
