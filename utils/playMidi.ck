
BPM bpm;
Sync sync;
MIDIOut midiController(0);

130 => int bpmValue;
bpm.set(bpmValue);


1 => int loopMode;
0 => int midiChannel;
64 => int midiRoot;

me.arg(0) => string streamFileName;

<<< "streamFileName: ", streamFileName >>>;
<<< "midiChannel: ", midiChannel >>>;
<<< "midiRoot: ", midiRoot >>>;

spork ~ midiController.runClock();
midiController.start();
spork ~ midiController.stream(midiChannel, streamFileName, midiRoot, loopMode);
3::second => now;
midiController.stop();
// midiController.close(0);

// chuck + utils/sync.ck utils/bpm.ck utils/midi.ck utils/playMidi.ck:./utils/testStream.txt