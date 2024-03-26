BPM bpm;
Sync sync;
MIDIOut midiController;

bpm.set(130);
midiController.openPort(0);

1 => int loopMode;
0 => int midiChannel;
64 => int midiRoot;

me.arg(0) => string streamFileName;

spork ~ midiController.runClock();
midiController.start();
spork ~ midiController.stream(midiChannel, streamFileName, midiRoot, loopMode);
3::second => now;
midiController.stop();