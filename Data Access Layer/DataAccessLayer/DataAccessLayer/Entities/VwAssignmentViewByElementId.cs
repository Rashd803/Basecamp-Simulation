using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwAssignmentViewByElementId
{
    public int? QuestionId { get; set; }

    public int? EventId { get; set; }

    public int? ToDoId { get; set; }

    public int? CardId { get; set; }

    public int? StepId { get; set; }

    public string Name { get; set; } = null!;
}
