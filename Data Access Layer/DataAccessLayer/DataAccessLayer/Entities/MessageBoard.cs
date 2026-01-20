using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class MessageBoard
{
    public int Id { get; set; }

    public int ProjectId { get; set; }

    public string? Title { get; set; }

    public bool IsPrivate { get; set; }

    public int PublishingInfoId { get; set; }

    public int NoteId { get; set; }

    public virtual ICollection<Activity> Activities { get; set; } = new List<Activity>();

    public virtual Note Note { get; set; } = null!;

    public virtual Project Project { get; set; } = null!;

    public virtual ICollection<ProjectComment> ProjectComments { get; set; } = new List<ProjectComment>();

    public virtual PublishingInformation PublishingInfo { get; set; } = null!;
}
