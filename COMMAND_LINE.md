# Chuck CLI

Execute file
```bash
chuck file.ck
```
Create a shred 
```bash
chuck file1.ck file2.ck file3.ck
```
Setup a virtual machine 
```bash
chuck --loop
```
Add new shreds to the listener VM
```bash
chuck + foo.ck bar.ck
```
Remove a shred by ID
```bash
chuck - 2 3 8
```
--replace / =
```bash
chuck = 2 foo.ck
```
Query the status for the VM
```bash
chuck ^
```
Print the value of `now` on the listener VM
```bash
chuck --time
```
Kill the listener VM
```bash
chuck --kill
```
--remote/@ to specify where to send the on-the-fly command
```bash
chuck @192.168.1.1 + foo.ck bar.ck
#or
chuck @foo.bar.com -p8888 + foo.ck bar.ck
```
Sync to period of time (1 second in this example)
```cpp
1::second => dur T;
T - (now % T) => now;
```

## MIDI Out

```cpp
MidiOut mout;

144 => int noteOnChan1;
128 => int noteOffChan1;

145 => int noteOnChan2;
129 => int noteOffChan2;

146 => int noteOnChan3;
130 => int noteOffChan3;

if( !mout.open( 0 ) ) me.exit();

fun void sendNoteOn( int note, dur d)
{
    noteOnChan1 => msg.data1; // message type (144 = note on, 128 = note off)
    note => msg.data2; // MIDI note number (0 - 127)
    127 => msg.data3; // velocity (0 - 127)
    mout.send( msg );
    d - 10::ms => now;
    noteOffChan1 => msg.data1;
    mout.send( msg );
    10::ms => now;
}


while( true )
{
    sendNoteOn( 60, 100::ms);
    sendNoteOn( 64, 100::ms);
    sendNoteOn( 67, 150::ms);
    sendNoteOn( 72, 100::ms);
    sendNoteOn( 76, 10::ms);
    sendNoteOn( 79, 100::ms);
    sendNoteOn( 84, 100::ms);
}
```

