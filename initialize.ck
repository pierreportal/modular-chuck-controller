me.dir() + "utils/" => string utilsDir;

utilsDir + "sync.ck" => string syncFile;
utilsDir + "bpm.ck" => string bpmFile;
utilsDir + "midiParams.ck" => string midiParamsFile;
utilsDir + "midi.ck" => string midiFile;

Machine.add(bpmFile) => int bpm;
Machine.add(syncFile) => int sync;

Machine.add(midiParamsFile) => int midiParams;
Machine.add(midiFile) => int midi;

// Machine.add(playMidiFile + ":" + streamFile) => int playMidi;
// while (true){}