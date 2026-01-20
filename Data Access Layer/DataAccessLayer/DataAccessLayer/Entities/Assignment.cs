using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class Assignment
{
    public int Id { get; set; }

    public int ProjectId { get; set; }

    public int MemberId { get; set; }

    public int? EventId { get; set; }

    public int? ToDoId { get; set; }

    public int? StepId { get; set; }

    public int? QuestionId { get; set; }

    public int? CardId { get; set; }

    public int? ClientId { get; set; }

    public virtual Card? Card { get; set; }

    public virtual Client? Client { get; set; }

    public virtual Event? Event { get; set; }

    public virtual Member Member { get; set; } = null!;

    public virtual Project Project { get; set; } = null!;

    public virtual Question? Question { get; set; }

    public virtual Step? Step { get; set; }

    public virtual ToDo? ToDo { get; set; }
}
