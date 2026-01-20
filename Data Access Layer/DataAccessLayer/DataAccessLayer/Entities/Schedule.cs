using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class Schedule
{
    public int Id { get; set; }

    public DateTime FromDate { get; set; }

    public DateTime ToDate { get; set; }

    public int? ScheduleTypeId { get; set; }

    public int ProjectId { get; set; }

    public virtual ICollection<Event> Events { get; set; } = new List<Event>();

    public virtual Project Project { get; set; } = null!;

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();

    public virtual ScheduleType? ScheduleType { get; set; }

    public virtual ICollection<ToDo> ToDos { get; set; } = new List<ToDo>();
}
