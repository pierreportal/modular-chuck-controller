class MidiChannels
{
    static int voice1, voice2, voice3, drum;
    0 => voice1;
    1 => voice2;
    2 => voice3;
    9 => drum;
}

class MidiDrumNotes
{
    static int kick, snare, clap, chh, ohh, ride, crash;
    36 => kick;
    37 => snare;
    38 => clap;
    39 => chh;
    40 => ohh;
    41 => ride;
    42 => crash;
}

class MidiMsgType
{
    MidiMsg start;
    250 => start.data1;
    0 => start.data2;
    0 => start.data3;

    MidiMsg stop;
    252 => stop.data1;
    0 => stop.data2;
    0 => stop.data3;

    MidiMsg clockPulse;
    248 => clockPulse.data1;
    0 => clockPulse.data2;
    0 => clockPulse.data3;

    MidiMsg noteOn;
    144 => noteOn.data1;
    0 => noteOn.data2;
    127 => noteOn.data3;

    MidiMsg noteOff;
    128 => noteOff.data1;
    0 => noteOff.data2;
    0 => noteOff.data3;
}

class MidiPort
{
    static int port;
    public MidiPort(int portNumber)
    {
        portNumber => port;
    }
}
public class MIDIParams
{
    MidiChannels channels();
    MidiDrumNotes drumNotes();
    MidiMsgType msgType();
    MidiPort port(0);
}

// MIDIParams midiParams;
// <<<midiParams.drumNotes.ohh>>>;