using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class MemberDTO
{
    public int MemberId { get; set; }

    public string MemberName { get; set; } = null!;

    public string? CompanyName { get; set; }
    public string? JobTitle { get; set; }

}
