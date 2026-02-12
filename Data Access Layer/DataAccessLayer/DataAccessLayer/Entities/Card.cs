using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class Card
{
    public int Id { get; set; }

    public string Title { get; set; } = null!;

    public int ColumnId { get; set; }

    public int? ScheduleId { get; set; }

    public int? NoteId { get; set; }

    public int PublishingInfoId { get; set; }

    public bool IsPrivate { get; set; }

    public virtual ICollection<Activity> Activities { get; set; } = new List<Activity>();

    public virtual ICollection<Assignment> Assignments { get; set; } = new List<Assignment>();

    public virtual ICollection<ProjectComment> ProjectComments { get; set; } = new List<ProjectComment>();

    public virtual ICollection<Step> Steps { get; set; } = new List<Step>();
    public virtual Column Column { get; set; } = null!;
}
