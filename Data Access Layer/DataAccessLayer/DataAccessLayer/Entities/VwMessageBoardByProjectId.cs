using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwMessageBoardByProjectId
{
    public string? Title { get; set; }

    public string Name { get; set; } = null!;

    public DateTime PublishedAt { get; set; }

    public string? Text { get; set; }

    public string? Urllink { get; set; }

    public int ProjectId { get; set; }

    public bool IsPrivate { get; set; }
}
