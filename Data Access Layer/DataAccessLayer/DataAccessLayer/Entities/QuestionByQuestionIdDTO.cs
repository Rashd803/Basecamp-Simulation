using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class QuestionByQuestionIdDTO
{
    public int QuestionId { get; set; }

    public string Text { get; set; } = null!;

    public bool IsPrivate { get; set; }

    public DateTime FromDate { get; set; }

    public DateTime ToDate { get; set; }
}
