using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class StepByCardIdDTO
{
    public int StepId { get; set; }
    public int CardId { get; set; }

    public string Text { get; set; } = null!;

    public bool IsChecked { get; set; }
}
