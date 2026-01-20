using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwQuestionViewByProjectId
{
    public int ProjectId { get; set; }

    public string Text { get; set; } = null!;

    public DateTime FromDate { get; set; }

    public DateTime ToDate { get; set; }

    public bool IsPrivate { get; set; }
}
