using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class PublishingInformation
{
    public int Id { get; set; }

    public DateTime PublishedAt { get; set; }

    public int PublisherId { get; set; }

    public int? ProjectId { get; set; }

    public virtual ICollection<Activity> Activities { get; set; } = new List<Activity>();

    public virtual ICollection<Answer> Answers { get; set; } = new List<Answer>();

    public virtual ICollection<Chat> Chats { get; set; } = new List<Chat>();

    public virtual ICollection<Column> Columns { get; set; } = new List<Column>();

    public virtual ICollection<Document> Documents { get; set; } = new List<Document>();

    public virtual ICollection<Event> Events { get; set; } = new List<Event>();

    public virtual ICollection<Invitation> Invitations { get; set; } = new List<Invitation>();

    public virtual ICollection<List> Lists { get; set; } = new List<List>();

    public virtual ICollection<MessageBoard> MessageBoards { get; set; } = new List<MessageBoard>();

    public virtual ICollection<Note> Notes { get; set; } = new List<Note>();

    public virtual Project? Project { get; set; }

    public virtual ICollection<ProjectComment> ProjectComments { get; set; } = new List<ProjectComment>();

    public virtual ICollection<Project> Projects { get; set; } = new List<Project>();

    public virtual Member Publisher { get; set; } = null!;

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();

    public virtual ICollection<Step> Steps { get; set; } = new List<Step>();

    public virtual ICollection<ToDo> ToDos { get; set; } = new List<ToDo>();
}
