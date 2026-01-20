using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class CommentSubscription
{
    public int Id { get; set; }

    public int MemberId { get; set; }

    public int CommentId { get; set; }

    public int ProjectId { get; set; }

    public virtual ProjectComment Comment { get; set; } = null!;

    public virtual Member Member { get; set; } = null!;

    public virtual Project Project { get; set; } = null!;
}
