public static class NucleotideCount
{
    public static IDictionary<char, int> Count(string sequence)
    {
        var ans = new Dictionary<char, int>
        {
            ['A'] = 0,
            ['C'] = 0,
            ['G'] = 0,
            ['T'] = 0
        };
        foreach (char c in sequence)
        {
            switch (c)
            {
                case 'A' or 'C' or 'G' or 'T':
                    ans[c] += 1;
                    break;
                default:
                    throw (new ArgumentException());
            }
        }
        return ans;
    }
}