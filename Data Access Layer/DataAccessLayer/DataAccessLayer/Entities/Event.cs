using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class Event
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public int? NoteId { get; set; }

    public string? Urllink { get; set; }

    public int PublishingInfoId { get; set; }

    public int ScheduleId { get; set; }

    public int ProjectId { get; set; }

    public bool IsPrivate { get; set; }

    public virtual ICollection<Activity> Activities { get; set; } = new List<Activity>();

    public virtual ICollection<Assignment> Assignments { get; set; } = new List<Assignment>();

    public virtual Note? Note { get; set; }

    public virtual Project Project { get; set; } = null!;

    public virtual ICollection<ProjectComment> ProjectComments { get; set; } = new List<ProjectComment>();

    public virtual PublishingInformation PublishingInfo { get; set; } = null!;

    public virtual Schedule Schedule { get; set; } = null!;
}
