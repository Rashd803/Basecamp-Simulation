using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class ClientDTO
{
    public int ClientId { get; set; }

    public string ClientName { get; set; } = null!;

    public string? CompanyName { get; set; }

    public string? JobTitle { get; set; }

    public string Email { get; set; } = null!;
}
