using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class InvitationProjectDTO
{
    public int InvitationId { get; set; }

    public string TheInvitedName { get; set; } = null!;

    public DateTime PublishedAt { get; set; }

    public string? Name { get; set; }

    public int ProjectId { get; set; }
}
