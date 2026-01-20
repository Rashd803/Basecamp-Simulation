using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class Step
{
    public int Id { get; set; }

    public int CardId { get; set; }

    public string Text { get; set; } = null!;

    public int PublishingInfoId { get; set; }

    public bool IsChecked { get; set; }

    public virtual ICollection<Activity> Activities { get; set; } = new List<Activity>();

    public virtual ICollection<Assignment> Assignments { get; set; } = new List<Assignment>();

    public virtual Card Card { get; set; } = null!;

    public virtual ICollection<ProjectComment> ProjectComments { get; set; } = new List<ProjectComment>();

    public virtual PublishingInformation PublishingInfo { get; set; } = null!;
}
