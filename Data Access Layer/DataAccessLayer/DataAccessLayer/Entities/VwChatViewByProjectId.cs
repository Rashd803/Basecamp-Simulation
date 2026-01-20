using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwChatViewByProjectId
{
    public int ProjectId { get; set; }

    public string Text { get; set; } = null!;

    public DateTime PublishedAt { get; set; }

    public string Name { get; set; } = null!;

    public bool IsPrivate { get; set; }
}
