using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class ChatByProjectIdDTO
{
    public int ProjectId { get; set; }

    public required string Text { get; set; }

    public DateTime PublishedAt { get; set; }

    public required string Username { get; set; }

    public bool IsPrivate { get; set; }
}
