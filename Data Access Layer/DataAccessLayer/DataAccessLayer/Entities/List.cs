using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class List
{
    public int Id { get; set; }

    public int PublishingInfoId { get; set; }

    public int ProjectId { get; set; }

    public string Title { get; set; } = null!;

    public int? NoteId { get; set; }

    public bool IsPrivate { get; set; }

    public virtual Note? Note { get; set; }

    public virtual Project Project { get; set; } = null!;

    public virtual PublishingInformation PublishingInfo { get; set; } = null!;

    public virtual ICollection<ToDo> ToDos { get; set; } = new List<ToDo>();
}
