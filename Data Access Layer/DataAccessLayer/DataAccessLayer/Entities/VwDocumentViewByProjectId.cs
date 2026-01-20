using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwDocumentViewByProjectId
{
    public int ProjectId { get; set; }

    public string FilePath { get; set; } = null!;

    public string DocName { get; set; } = null!;

    public string? Text { get; set; }

    public string? Urllink { get; set; }

    public DateTime PublishedAt { get; set; }

    public bool IsPrivate { get; set; }
}
