public static class TelemetryBuffer
{
    public static byte[] ToBuffer(long reading)
    {
        int size;
        bool signed;

        if (reading >= 0 && reading <= ushort.MaxValue)
        {
            size = 2;
            signed = false;
        }
        else if (reading >= int.MinValue && reading <= int.MaxValue)
        {
            size = reading >= short.MinValue && reading < 0 ? 2 : 4;
            signed = true;
        }
        else if (reading >= 0 && reading <= uint.MaxValue)
        {
            size = 4;
            signed = false;
        }
        else
        {
            size = 8;
            signed = true;
        }

        byte[] buffer = new byte[9];

        buffer[0] = signed
            ? (byte)(256 - size)
            : (byte)size;

        long x = reading;

        for (int i = 0; i < size; i++)
        {
            buffer[i + 1] = (byte)(x & 0xFF);
            x >>= 8;
        }

        return buffer;
    }

    public static long FromBuffer(byte[] buffer)
    {
        byte prefix = buffer[0];

        bool signed;
        int size;

        switch (prefix)
        {
            case 0x02:
                size = 2;
                signed = false;
                break;

            case 0x04:
                size = 4;
                signed = false;
                break;

            case 0xFE:
                size = 2;
                signed = true;
                break;

            case 0xFC:
                size = 4;
                signed = true;
                break;

            case 0xF8:
                size = 8;
                signed = true;
                break;

            default:
                return 0;
        }

        long ans = 0;

        for (int i = 0; i < size; i++)
        {
            ans |= (long)buffer[i + 1] << (i * 8);
        }

        // Only sign-extend if the highest payload bit is actually 1.
        if (signed &&
            size < 8 &&
            (buffer[size] & 0x80) != 0)
        {
            ans |= -1L << (size * 8);
        }

        return ans;
    }
}