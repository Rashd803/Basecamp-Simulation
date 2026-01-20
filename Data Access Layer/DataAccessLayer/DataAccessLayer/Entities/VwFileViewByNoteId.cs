using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwFileViewByNoteId
{
    public int NoteId { get; set; }

    public string FilePath { get; set; } = null!;

    public string? Caption { get; set; }
}
