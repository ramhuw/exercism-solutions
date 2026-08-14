static class Badge
{
    public static string Print(int? id, string name, string? department)
    {
        string ans = "";
        if (id != null)
        {
            ans += $"[{id}] - ";
        }
        ans += name;
        if (department != null)
        {
            ans += $" - {department.ToUpper()}";
        } else
        {
            ans += " - OWNER";
        }
        return ans;
    }
}
