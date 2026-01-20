using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwInvitation
{
    public int InvitationId { get; set; }

    public string TheInvitedName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string? Text { get; set; }

    public string? JobTitle { get; set; }

    public string? CompanyName { get; set; }

    public DateTime PublishedAt { get; set; }

    public string InviterName { get; set; } = null!;

    public string? Name { get; set; }
}
