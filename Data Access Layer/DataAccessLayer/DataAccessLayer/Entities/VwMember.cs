using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwMember
{
    public int MemberId { get; set; }

    public string MemberName { get; set; } = null!;

    public string? CompanyName { get; set; }
}
