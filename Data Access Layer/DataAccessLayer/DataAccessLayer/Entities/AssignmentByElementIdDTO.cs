using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class AssignmentByElementIdDTO
{
    public int? QuestionId { get; set; }

    public int? EventId { get; set; }

    public int? ToDoId { get; set; }

    public int? CardId { get; set; }

    public int? StepId { get; set; }
    public int? CommentId { get; set; }

    public string MemberName { get; set; }
}
