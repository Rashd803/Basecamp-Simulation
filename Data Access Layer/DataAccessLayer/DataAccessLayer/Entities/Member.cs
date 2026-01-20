using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class Member
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public int? AdminId { get; set; }

    public virtual Member? Admin { get; set; }

    public virtual ICollection<Assignment> Assignments { get; set; } = new List<Assignment>();

    public virtual ICollection<CommentSubscription> CommentSubscriptions { get; set; } = new List<CommentSubscription>();

    public virtual ICollection<Member> InverseAdmin { get; set; } = new List<Member>();

    public virtual ICollection<PublishingInformation> PublishingInformations { get; set; } = new List<PublishingInformation>();

    public virtual User User { get; set; } = null!;
}
