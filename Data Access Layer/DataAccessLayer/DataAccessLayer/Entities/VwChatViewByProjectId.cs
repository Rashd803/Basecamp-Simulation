using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwChatViewByProjectId
{
    public int ProjectId { get; set; }

    public string Text { get; set; }

    public DateTime PublishedAt { get; set; }

    public string Username { get; set; }

    public bool IsPrivate { get; set; }
}
