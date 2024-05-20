public class BPM
{
    static dur quarter, eighth, sixteenth, thirtysecond, sixtyfourth, clockSignal;

    public BPM(int tempo)
    {
        set(tempo);
    }

    public void set(int beat)
    {
        60.0 / beat => float spb;
        spb::second => quarter;
        (spb / 2)::second => eighth;
        (spb / 4)::second => sixteenth;
        (spb / 8)::second => thirtysecond;
        (spb / 16)::second => sixtyfourth;
        (spb / 16)::second => clockSignal;
        <<< "BPM set to:", beat >>>;
    }
}