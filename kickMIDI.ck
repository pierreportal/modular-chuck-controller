MidiOut drumMidiOut;

// Open the first MIDI device
0 => int device;
if(!drumMidiOut.open(device)) {
    <<<"Failed to open MIDI device", device>>>;
    me.exit();
}

36 => int kick;
37 => int snare;
38 => int clap;
// etc...

9 => int drumMIDIChan;

MidiMsg midiStart;
250 => midiStart.data1;
0 => midiStart.data2;
0 => midiStart.data3;

MidiMsg midiStop;
252 => midiStop.data1;
0 => midiStop.data2;
0 => midiStop.data3;

// ----------------

MidiMsg midiKick;
144 + drumMIDIChan => midiKick.data1;
kick => midiKick.data2;
127 => midiKick.data3;

MidiMsg midiKickSTOP;
128 + drumMIDIChan => midiKickSTOP.data1;
kick => midiKick.data2;
127 => midiKick.data3;



fun void loop()
{
    while(true)
    {
        midiKick => drumMidiOut.send;
        100::ms => now;
        midiKickSTOP => drumMidiOut.send;
        100::ms => now;
    }
}

midiStart => drumMidiOut.send;
spork ~ loop();
4::second => now;
midiStop => drumMidiOut.send;


