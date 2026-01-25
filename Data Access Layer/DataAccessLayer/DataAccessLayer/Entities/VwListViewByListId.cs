using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwListViewByListId
{
    public int ListId { get; set; }

    public string Title { get; set; } = null!;

    public bool IsPrivate { get; set; }
    
    public int NoteID { get; set; }
    public string? Text { get; set; }

    public string? Urllink { get; set; }
}
