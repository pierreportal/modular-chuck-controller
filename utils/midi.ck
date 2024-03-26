

public class MIDIOut 
{
    FileIO io;
    MidiOut mout;
    MIDIParams midi;
    Sync sync;
    BPM bpm;
    StringTokenizer st;
    mout.open(0);

    private void noteOn( int channel, int note, int velocity )
    {
        channel +=> midi.msgType.noteOn.data1;
        note => midi.msgType.noteOn.data2;
        velocity => midi.msgType.noteOn.data3;
        mout.send( midi.msgType.noteOn );
    }
    private void noteOff( int channel)
    {
        channel +=> midi.msgType.noteOff.data1;
        mout.send( midi.msgType.noteOff );
    }

    fun void sendMIDI( int channel, int note, int velocity, dur duration )
    {
        noteOn( channel, note, velocity );
        duration - 10::ms => now;
        noteOff( channel );
        10::ms => now;
    }
    
    fun void start(){midi.msgType.start => mout.send;}
    
    fun void stop(){midi.msgType.stop => mout.send;}

    fun void runClock()
    {
        while( true )
        {
            <<< "Sending MIDI clock pulse" >>>;
            midi.msgType.clockPulse => mout.send;
            bpm.clockSignal => now;
        }
    }
    fun void stream( int channel, string filename, int midiRoot, int loop )
    {
        if(!io.open( filename, FileIO.READ )) 
        {
            <<< "Error: Could not open file. Make sure the VM is runing in the same directory or provide absolute path" >>>;
            return;
        }
        while(loop)
        {
            while(io.more())
            {
                io.readLine() => string line;
                st.set(line);
                while (st.more())
                {
                    st.next() => Std.atoi => int note;
                    <<< "note", note >>>;
                    sendMIDI( channel, note + midiRoot, 127, bpm.sixteenth );
                }
            }
            0 => io.seek;
        }
    }
}