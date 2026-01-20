using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwClientProject
{
    public int ClientId { get; set; }

    public string ClientName { get; set; } = null!;

    public string? CompanyName { get; set; }

    public int ProjectId { get; set; }
}
