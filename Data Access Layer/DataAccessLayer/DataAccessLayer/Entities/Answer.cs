using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class Answer
{
    public int Id { get; set; }

    public int QuestionId { get; set; }

    public int NoteId { get; set; }

    public int ProjectId { get; set; }

    public int PublishingInfoId { get; set; }

    public virtual ICollection<Activity> Activities { get; set; } = new List<Activity>();

    public virtual Note AnswerNavigation { get; set; } = null!;

    public virtual Project Project { get; set; } = null!;

    public virtual PublishingInformation PublishingInfo { get; set; } = null!;

    public virtual Question Question { get; set; } = null!;
}
