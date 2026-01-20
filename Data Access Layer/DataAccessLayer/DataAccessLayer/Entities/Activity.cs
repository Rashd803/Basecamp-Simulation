using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class Activity
{
    public int Id { get; set; }

    public string Text { get; set; } = null!;

    public int? ProjectId { get; set; }

    public int? EventId { get; set; }

    public int? ToDoId { get; set; }

    public int? CommentId { get; set; }

    public int? CardId { get; set; }

    public int? StepId { get; set; }

    public int? MessageId { get; set; }

    public int? DocumentId { get; set; }

    public int PublishingInfoId { get; set; }

    public int? ChatId { get; set; }

    public int? QuestionId { get; set; }

    public int? AnswerId { get; set; }

    public virtual Answer? Answer { get; set; }

    public virtual Card? Card { get; set; }

    public virtual Chat? Chat { get; set; }

    public virtual Document? Document { get; set; }

    public virtual Event? Event { get; set; }

    public virtual MessageBoard? Message { get; set; }

    public virtual Project? Project { get; set; }

    public virtual PublishingInformation PublishingInfo { get; set; } = null!;

    public virtual Question? Question { get; set; }

    public virtual Step? Step { get; set; }

    public virtual ToDo? ToDo { get; set; }
}
