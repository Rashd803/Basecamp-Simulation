using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class ToDo
{
    public int Id { get; set; }

    public string Text { get; set; } = null!;

    public int? NoteId { get; set; }

    public int PublishingInfoId { get; set; }

    public int ListId { get; set; }

    public int? ScheduleId { get; set; }

    public bool IsPrivate { get; set; }

    public bool Checked { get; set; }

    public virtual ICollection<Activity> Activities { get; set; } = new List<Activity>();

    public virtual ICollection<Assignment> Assignments { get; set; } = new List<Assignment>();

    public virtual List List { get; set; } = null!;

    public virtual Note? Note { get; set; }

    public virtual ICollection<ProjectComment> ProjectComments { get; set; } = new List<ProjectComment>();

    public virtual PublishingInformation PublishingInfo { get; set; } = null!;

    public virtual Schedule? Schedule { get; set; }
}
