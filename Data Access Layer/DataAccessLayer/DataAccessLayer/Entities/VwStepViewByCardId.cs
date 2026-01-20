using System;
using System.Collections.Generic;

namespace DataAccessLayer.Entities;

public partial class VwStepViewByCardId
{
    public int CardId { get; set; }

    public string Text { get; set; } = null!;

    public bool IsChecked { get; set; }
}
