using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class Column
{
    public int Id { get; set; }

    public int ProjectId { get; set; }

    public int PublishingInfoId { get; set; }

    public string Title { get; set; } = null!;

    public string? Description { get; set; }

    public bool IsPrivate { get; set; }

    public virtual Project Project { get; set; } = null!;

    public virtual PublishingInformation PublishingInfo { get; set; } = null!;
}
