me.dir() + "utils/" => string utilsDir;

utilsDir + "playMidi.ck" => string playMidiFile;

"./utils/testStream.txt" => string streamFile;
<<<"okokoko">>>;
Machine.add(playMidiFile + ":" + streamFile) => int playMidi;