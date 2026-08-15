public static class PlayAnalyzer
{
    public static string AnalyzeOnField(int shirtNum)
    {
        switch (shirtNum)
        {
            case 1: return "goalie";
            case 2:
            return "left back";
            case 3 or 4:
            return "center back";
            case 5:
            return "right back";
            case 6 or 7 or 8:
            return "midfielder";
            case 9:
            return "left wing";
            case 10:
            return "striker";
            case 11:
            return "right wing";
            default:
            return "UNKNOWN";
        }
    }

    public static string AnalyzeOffField(object report)
    {
        switch (report)
        {
            case int n:
            return $"There are {n} supporters at the match.";
            case string s:
            return s;
            case Injury j:
            return $"Oh no! {j.GetDescription()} Medics are on the field.";
            case Incident i:
            return i.GetDescription();
            case Manager m:
            if (m.Club != null)
                {
                    return $"{m.Name} ({m.Club})";
                } else
                {
                    return m.Name;
                }
                default:
                return "";
        }
    }
}
