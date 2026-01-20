using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class ProjectComment
{
    public int Id { get; set; }

    public int NoteId { get; set; }

    public int PublishingInfoId { get; set; }

    public int? EventId { get; set; }

    public int? ToDoId { get; set; }

    public int? CardId { get; set; }

    public int? StepId { get; set; }

    public int? MessageId { get; set; }

    public int? DocumentId { get; set; }

    public int ProjectId { get; set; }

    public virtual Card? Card { get; set; }

    public virtual ICollection<CommentSubscription> CommentSubscriptions { get; set; } = new List<CommentSubscription>();

    public virtual Document? Document { get; set; }

    public virtual Event? Event { get; set; }

    public virtual MessageBoard? Message { get; set; }

    public virtual Note Note { get; set; } = null!;

    public virtual Project Project { get; set; } = null!;

    public virtual PublishingInformation PublishingInfo { get; set; } = null!;

    public virtual Step? Step { get; set; }

    public virtual ToDo? ToDo { get; set; }
}
