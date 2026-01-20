using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class Chat
{
    public int Id { get; set; }

    public string Text { get; set; } = null!;

    public int ProjectId { get; set; }

    public int PublishingInfoId { get; set; }

    public bool IsPrivate { get; set; }

    public virtual ICollection<Activity> Activities { get; set; } = new List<Activity>();

    public virtual Project Project { get; set; } = null!;

    public virtual PublishingInformation PublishingInfo { get; set; } = null!;
}
