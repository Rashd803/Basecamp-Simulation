using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class NoteFile
{
    public int Id { get; set; }

    public string FilePath { get; set; } = null!;

    public string? Caption { get; set; }

    public int NoteId { get; set; }

    public virtual Note Note { get; set; } = null!;
}
