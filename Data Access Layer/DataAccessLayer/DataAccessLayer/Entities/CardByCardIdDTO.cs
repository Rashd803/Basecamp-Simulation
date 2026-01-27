using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class CardByCardIdDTO
{
    public int CardId { get; set; }

    public string ColumnTitle { get; set; }

    public string CardTitle { get; set; }

    public int? NoteID { get; set; }
    public string? NoteText { get; set; } = null!;
    public string? URLLink  { get; set; } = null!;
    public DateTime? FromDate { get; set; }

    public DateTime? ToDate { get; set; }

    public DateTime PublishedAt { get; set; }

    public string Username { get; set; } = null!;
}
