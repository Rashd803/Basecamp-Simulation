using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class Client
{
    public int Id { get; set; }

    public int UserId { get; set; }

    public virtual ICollection<Assignment> Assignments { get; set; } = new List<Assignment>();

    public virtual User User { get; set; } = null!;
}
