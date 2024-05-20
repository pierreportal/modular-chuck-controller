
BPM bpm;
Sync sync;
MIDIOut midiController;

140 => int bpmValue;
bpm.set(bpmValue);

1 => int loopMode;
0 => int midiChannel;
16 => int octave;
2 * octave => int midiRoot;

me.arg(0) => string streamFileName;

<<< "streamFileName: ", streamFileName >>>;
<<< "midiChannel: ", midiChannel >>>;
<<< "midiRoot: ", midiRoot >>>;

spork ~ midiController.runClock();
midiController.start();
spork ~ midiController.stream(midiChannel, streamFileName, midiRoot, loopMode);
30::second => now;
midiController.stop();

// chuck + utils/sync.ck utils/bpm.ck utils/midi.ck utils/playMidi.ck:./utils/testStream.txt

// ❯ chuck initialize.ck:./utils/testStream.txt

MIDIParams midiParams;

<<<midiParams.channels.drum>>>;