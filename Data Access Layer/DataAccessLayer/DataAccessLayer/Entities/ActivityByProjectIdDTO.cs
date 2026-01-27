using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class ActivityByProjectIdDTO
{
    public int ProjectId { get; set; }

    public string Text { get; set; } = null!;

    public int? AnswerId { get; set; }

    public int? CardId { get; set; }

    public int? ChatId { get; set; }

    public int? CommentId { get; set; }

    public int? DocumentId { get; set; }

    public int? ToDoId { get; set; }

    public int? EventId { get; set; }

    public int? MessageId { get; set; }

    public int? StepId { get; set; }

    public int? QuestionId { get; set; }

    public DateTime PublishedAt { get; set; }
}
