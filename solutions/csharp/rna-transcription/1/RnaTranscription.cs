public static class RnaTranscription
{
    public static string ToRna(string strand)
    {
        return new string(strand.Select(SingleToRna).ToArray());
    }

    static char SingleToRna(char c)
    {
        switch (c)
        {
            case 'G':
                return 'C';
            case 'C':
                return 'G';
            case 'T':
                return 'A';
            case 'A':
                return 'U';
            default:
                throw (new InvalidDataException());
        }
    }
}