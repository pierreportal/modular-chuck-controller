
BPM bpm(120);
MIDIOut mout(0);
Sync sync(bpm.quarter);

me.arg(0) => string streamFileName;

0 => int midiChannel;
64 => int midiRoot;
1 => int loopMode;

mout.stream(midiChannel, streamFileName, midiRoot, loopMode);

// chuck %> chuck playMidi.ck:filename

// chuck + sync.ck bpm.ck midi.ck playMidi.ck:./testStream.txt