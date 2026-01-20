using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwAnswerViewByQuestionId
{
    public int QuestionId { get; set; }

    public string? Text { get; set; }

    public string? Urllink { get; set; }

    public DateTime PublishedAt { get; set; }

    public string Name { get; set; } = null!;
}
