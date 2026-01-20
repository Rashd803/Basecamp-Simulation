using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class Question
{
    public int Id { get; set; }

    public string Text { get; set; } = null!;

    public int ScheduleId { get; set; }

    public int ProjectId { get; set; }

    public bool IsPrivate { get; set; }

    public int PublishingInfoId { get; set; }

    public virtual ICollection<Activity> Activities { get; set; } = new List<Activity>();

    public virtual ICollection<Answer> Answers { get; set; } = new List<Answer>();

    public virtual ICollection<Assignment> Assignments { get; set; } = new List<Assignment>();

    public virtual Project Project { get; set; } = null!;

    public virtual PublishingInformation PublishingInfo { get; set; } = null!;

    public virtual Schedule Schedule { get; set; } = null!;
}
