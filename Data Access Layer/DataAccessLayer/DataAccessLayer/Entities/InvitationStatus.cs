using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class InvitationStatus
{
    public int Id { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Invitation> Invitations { get; set; } = new List<Invitation>();
}
