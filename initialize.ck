me.dir() + "utils/" => string utilsDir;

utilsDir + "sync.ck" => string syncFile;
utilsDir + "bpm.ck" => string bpmFile;
utilsDir + "midi.ck" => string midiFile;
utilsDir + "playMidi.ck" => string playMidiFile;

"./utils/testStream.txt" => string streamFile;

Machine.add(bpmFile) => int bpm;
Machine.add(syncFile) => int sync;
Machine.add(midiFile) => int midi;
Machine.add(playMidiFile + ":" + streamFile) => int playMidi;

<<<"BPM: ", bpm, " SYNC: ", sync, " MIDI: ", midi, " PLAY MIDI: ", playMidi>>>;


// while(true) {
//     // controll OSC in ...
// }