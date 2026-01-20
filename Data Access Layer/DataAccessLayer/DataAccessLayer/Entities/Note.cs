using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class Note
{
    public int Id { get; set; }

    public string? Text { get; set; }

    public string? Urllink { get; set; }

    public int PublishingInfoId { get; set; }

    public int ProjectId { get; set; }

    public virtual ICollection<Answer> Answers { get; set; } = new List<Answer>();

    public virtual ICollection<Document> Documents { get; set; } = new List<Document>();

    public virtual ICollection<Event> Events { get; set; } = new List<Event>();

    public virtual ICollection<NoteFile> Files { get; set; } = new List<NoteFile>();

    public virtual ICollection<List> Lists { get; set; } = new List<List>();

    public virtual ICollection<MessageBoard> MessageBoards { get; set; } = new List<MessageBoard>();

    public virtual Project Project { get; set; } = null!;

    public virtual ICollection<ProjectComment> ProjectComments { get; set; } = new List<ProjectComment>();

    public virtual PublishingInformation PublishingInfo { get; set; } = null!;

    public virtual ICollection<ToDo> ToDos { get; set; } = new List<ToDo>();
}
