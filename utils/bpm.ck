public class BPM
{
    static dur quarter, eighth, sixteenth, thirtysecond, sixtyfourth;

    public BPM(float tempo){set(tempo);}

    public void set(float beat)
    {
        60.0 / beat => float spb;
        spb::second => quarter;
        (spb / 2)::second => eighth;
        (spb / 4)::second => sixteenth;
        (spb / 8)::second => thirtysecond;
        (spb / 16)::second => sixtyfourth;
    }
}

BPM bpm(120);

if(me.args() == 1) {
     bpm.set(Std.atoi(me.arg(0)));
    <<< "BPM set to:", me.arg(0) >>>;
}