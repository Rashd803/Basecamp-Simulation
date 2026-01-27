using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class FileByNoteIdDTO
{
    public int NoteId { get; set; }

    public string FilePath { get; set; } = null!;

    public string? Caption { get; set; }
}
