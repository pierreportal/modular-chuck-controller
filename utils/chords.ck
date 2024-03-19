public class Chords
{
    [0, 4, 7] @=> int _major[];
    [0, 3, 7] @=> int _minor[];
    [0, 3, 7, 10] @=> int _seventh[];
    [0, 4, 7, 11] @=> int _major7[];
    [0, 3, 7, 10] @=> int _minor7[];
    [0, 4, 8, 11] @=> int _aug[];
    [0, 3, 6, 9] @=> int _dim[];
    // TODO: the following chord intervals need to be verified.
    [0, 4, 7, 9] @=> int _sus4[];
    [0, 5, 7, 10] @=> int _sus2[];
    [0, 2, 7, 11] @=> int _add9[];
    [0, 4, 7, 14] @=> int _sixth[];
    [0, 4, 7, 14, 17] @=> int _sixth9[];
    [0, 4, 7, 10, 14] @=> int _seventh9[];
    [0, 4, 7, 10, 14, 17] @=> int _seventh9_13[];
    [0, 4, 7, 10, 14, 17, 21] @=> int _seventh9_13_11[];
    [0, 4, 7, 10, 14, 17, 21, 24] @=> int _seventh9_13_11_5[];
    [0, 4, 7, 10, 14, 17, 21, 24, 28] @=> int _seventh9_13_11_5_9[];
    [0, 4, 7, 10, 14, 17, 21, 24, 28, 31] @=> int _seventh9_13_11_5_9_3[];
    [0, 4, 7, 10, 14, 17, 21, 24, 28, 31, 34] @=> int _seventh9_13_11_5_9_3_7[];

    fun int[] major(int midiRoot, int invert)
    {
        int map[3];

        for (0 => int i; i < 3; i++)
        {
            (_major[i] + midiRoot) => map[i];
        }

        if (invert > 0) 
        {
            for (0 => int r; r < invert; r++)
            {
                map[r] + 12 => map[r];
            }
        }
        return map;
    }

    fun int[] minor(int midiRoot, int invert)
    {
        int map[3];

        for (0 => int i; i < 3; i++)
        {
            (_minor[i] + midiRoot) => map[i];
        }

        if (invert > 0) 
        {
            for (0 => int r; r < invert; r++)
            {
                map[r] + 12 => map[r];
            }
        }
        return map;
    }

    fun int[] seventh(int midiRoot, int invert)
    {
        int map[4];

        for (0 => int i; i < 4; i++)
        {
            (_seventh[i] + midiRoot) => map[i];
        }

        if (invert > 0) 
        {
            for (0 => int r; r < invert; r++)
            {
                map[r] + 12 => map[r];
            }
        }
        return map;
    }

    fun int[] major7(int midiRoot, int invert)
    {
        int map[4];

        for (0 => int i; i < 4; i++)
        {
            (_major7[i] + midiRoot) => map[i];
        }

        if (invert > 0) 
        {
            for (0 => int r; r < invert; r++)
            {
                map[r] + 12 => map[r];
            }
        }
        return map;
    }

    fun int[] minor7(int midiRoot, int invert)
    {
        int map[4];

        for (0 => int i; i < 4; i++)
        {
            (_minor7[i] + midiRoot) => map[i];
        }

        if (invert > 0) 
        {
            for (0 => int r; r < invert; r++)
            {
                map[r] + 12 => map[r];
            }
        }
        return map;
    }

    fun int[] aug(int midiRoot, int invert)
    {
        int map[4];

        for (0 => int i; i < 4; i++)
        {
            (_aug[i] + midiRoot) => map[i];
        }

        if (invert > 0) 
        {
            for (0 => int r; r < invert; r++)
            {
                map[r] + 12 => map[r];
            }
        }
        return map;
    }

    fun int[] dim(int midiRoot, int invert)
    {
        int map[4];

        for (0 => int i; i < 4; i++)
        {
            (_dim[i] + midiRoot) => map[i];
        }

        if (invert > 0) 
        {
            for (0 => int r; r < invert; r++)
            {
                map[r] + 12 => map[r];
            }
        }
        return map;
    }
}