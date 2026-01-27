using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class AnswerByQuestionIdDTO
{
    public int AnswerId { get; set; }
    public int QuestionId { get; set; }

    public string? Text { get; set; }

    public int NoteID { get; set; }

    public string? Urllink { get; set; }

    public DateTime PublishedAt { get; set; }

    public string Name { get; set; } = null!;
}
