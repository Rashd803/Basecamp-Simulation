using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwEventViewByProjectId
{
    public int ProjectId { get; set; }

    public int ItemId { get; set; }

    public string Title { get; set; } = null!;

    public DateTime FromDate { get; set; }

    public DateTime ToDate { get; set; }

    public DateTime PublishedAt { get; set; }

    public bool IsPrivate { get; set; }
}
