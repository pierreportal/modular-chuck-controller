
public class MIDIOut 
{
    Sync sync;
    FileIO io;
    MidiOut mout;
    MidiMsg msg;

    MidiMsg midiStart;
    250 => midiStart.data1;
    0 => midiStart.data2;
    0 => midiStart.data3;

    MidiMsg midiStop;
    252 => midiStop.data1;
    0 => midiStop.data2;
    0 => midiStop.data3;

    MidiMsg midiClockPulse;
    248 => midiClockPulse.data1;
    0 => midiClockPulse.data2;
    0 => midiClockPulse.data3;

    BPM bpm;
    StringTokenizer st;

    144 => int noteOnType;
    128 => int noteOffType;

    [0,1,2] @=> int voiceMIDIchan[];
    9 => int drumMIDIchan;

    -1 => int port;

    public MIDIOut(int port){openPort( port );}

    fun void openPort(int port)
    {
      if(!mout.open( port ))
        {
            <<< "Error: Could not open MIDI output device" >>>;
            me.exit();
        }
        port => this.port;
    }

    private void noteOn( int channel, int note, int velocity )
    {
        noteOnType + channel => msg.data1;
        note => msg.data2;
        velocity => msg.data3;
        mout.send( msg );
    }
    private void noteOff( int channel)
    {
        noteOffType + channel => msg.data1;
        mout.send( msg );
    }

    private checkOpenPort()
    {
        if(port < 0) {
            <<< "Error: No MIDI output port open" >>>;
            me.exit();
        }
    }

    fun void sendMIDI( int channel, int note, int velocity, dur duration )
    {
        <<< "Sending MIDI message" >>>;
        checkOpenPort();
        noteOn( channel, note, velocity );
        duration - 10::ms => now;
        noteOff( channel );
        10::ms => now;
    }
    
    fun void start(){midiStart => mout.send;}
    
    fun void stop(){midiStop => mout.send;}

    fun void runClock()
    {
        checkOpenPort();
        while( true )
        {
            <<< "Sending MIDI clock pulse" >>>;
            midiClockPulse => mout.send;
            bpm.clockSignal => now;
        }
    }
    fun void stream( int channel, string filename, int midiRoot, int loop )
    {
        checkOpenPort();
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