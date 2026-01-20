using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwDocumentViewByDocumentId
{
    public int DocumentId { get; set; }

    public string FilePath { get; set; } = null!;

    public string DocName { get; set; } = null!;

    public bool IsPrivate { get; set; }

    public string? Text { get; set; }

    public string? Urllink { get; set; }

    public DateTime PublishedAt { get; set; }

    public string Name { get; set; } = null!;
}
