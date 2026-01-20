using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class Invitation
{
    public int Id { get; set; }

    public string TheInvitedName { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string? Text { get; set; }

    public string? JobTitle { get; set; }

    public string? CompanyName { get; set; }

    public int PublishingInfoId { get; set; }

    public int ProjectId { get; set; }

    public int StatusId { get; set; }

    public string Password { get; set; } = null!;

    public bool MemberOrClient { get; set; }

    public virtual Project Project { get; set; } = null!;

    public virtual PublishingInformation PublishingInfo { get; set; } = null!;

    public virtual InvitationStatus Status { get; set; } = null!;
}
