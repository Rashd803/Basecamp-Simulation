using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class ListByProjectIdDTO
{
    public int ProjectId { get; set; }

    public string Title { get; set; } = null!;

    public string? Text { get; set; }

    public string? Urllink { get; set; }

    public string? Caption { get; set; }

    public bool IsPrivate { get; set; }
}
