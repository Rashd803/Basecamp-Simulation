using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class Project
{
    public int Id { get; set; }

    public string Name { get; set; } = null!;

    public int PublishingInfoId { get; set; }

    public virtual ICollection<Activity> Activities { get; set; } = new List<Activity>();

    public virtual ICollection<Answer> Answers { get; set; } = new List<Answer>();

    public virtual ICollection<Assignment> Assignments { get; set; } = new List<Assignment>();

    public virtual ICollection<Chat> Chats { get; set; } = new List<Chat>();

    public virtual ICollection<Column> Columns { get; set; } = new List<Column>();

    public virtual ICollection<CommentSubscription> CommentSubscriptions { get; set; } = new List<CommentSubscription>();

    public virtual ICollection<Document> Documents { get; set; } = new List<Document>();

    public virtual ICollection<Event> Events { get; set; } = new List<Event>();

    public virtual ICollection<Invitation> Invitations { get; set; } = new List<Invitation>();

    public virtual ICollection<List> Lists { get; set; } = new List<List>();

    public virtual ICollection<MessageBoard> MessageBoards { get; set; } = new List<MessageBoard>();

    public virtual ICollection<Note> Notes { get; set; } = new List<Note>();

    public virtual ICollection<ProjectComment> ProjectComments { get; set; } = new List<ProjectComment>();

    public virtual PublishingInformation PublishingInfo { get; set; } = null!;

    public virtual ICollection<PublishingInformation> PublishingInformations { get; set; } = new List<PublishingInformation>();

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();

    public virtual ICollection<Schedule> Schedules { get; set; } = new List<Schedule>();
}
