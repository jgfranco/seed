/*

SEED:
Sound Engine Embellishment Designer


*/


(
"**************************".postln;
/* hardcoded input */
~input = "HelloWorld";

/* define the rythm */
// how many notes (events) are going to be played
    // notes to rests ratio
    // count the char vs spaces, chars are notes, spaces are rests

~chars = 0;
~spaces = 0;
~upper = 0;
~lower = 0;
~asciiSum = 0;

~input.do({ |char|
	if(
		char.asString == " ",
		{~spaces = ~spaces +1},
		{~chars = ~chars + 1}

	);
	~asciiSum = ~asciiSum + char.ascii;
});

("number of chars: " ++ ~chars).postln;
("number of spaces: " ++ ~spaces).postln;
("ascii sum of characters: " ++~asciiSum).postln;

/*  define the root */

~root = ~input.size.linlin(0, 100, 60, 71).asInteger;
~rootMessage = "selected root is: " ++ ~root.midinote.asString;
~rootMessage.postln;

/* define the scale */

//(this could be a dictionary)

// use mod to pick a scale from the lenght of the string
// something like: length of string mod 7 (if using 7 scales)

~scales = Dictionary();
~scales.put(0, ["Ionian", 0, 2, 4, 5, 7, 9, 11]);
~scales.put(1, ["Dorian", 0, 2, 3, 5, 7, 9, 10]); // dorian: flat three and flat seven
~scales.put(2, ["Phrygian", 0, 1, 3, 5, 7, 8, 10, ]); // phrygian: flat two, flat three, flat six and flat seven
~scales.put(3, ["Lydian", 0, 2, 4, 6, 7, 9, 11]); // lydian: sharp 4
~scales.put(4, ["Myxolidian", 0, 2, 4, 5, 7, 9, 10]); // mixolydian: flat seven
~scales.put(5, ["Aeolian", 0, 2, 3, 5, 7, 8, 10]); // aeolian: flat three, flat six and flat seven
~scales.put(6, ["Locrian", 0, 1, 3, 5, 6, 8, 10]); // locrian: flat two, flat three, flat five, flat six and flat seven


~scale = ~scales[~asciiSum %~scales.size];
~scaleMessage = "selected scale is: " ++ ~scale[0];
~scaleMessage.postln;

/* define the tempo */
~tempo = ~input.size.linlin(0, 100, 100, 120).asInteger;
t = TempoClock(~tempo/60);
~tempoMessage = "selected tempo is: " ++ ~tempo ++" bpm";
~tempoMessage.postln;

/* design the sound */
// (couple of synthesizers)

// soft letters: abcdefghijklmnopqrstu
// hard letters: vwxyz


SynthDef(\test,{
	arg freq, amp;
	var sig;
	sig = SinOsc.ar(freq) * Line.kr(0.1, 0, 1,2, doneAction: 2);

	sig = sig !2;
	Out.ar(0, sig * amp);
}).add;


"**************************".postln;\
)




/* fx? */
      /* detune ? */
      // delay adding a slash to the text?
      // reverb  adding an asterisk to the text?

/* octaves: how wide does that composition need to be? */


s.boot;
(
p = Pbind(
	\instrument, \test,
	\type, Pwrand([\note, \rest], [~chars, ~spaces].normalizeSum, inf).trace,
	\dur, Pwrand([1/4, 1/2, 1/6, 1/8],[4,3,2,1].normalizeSum, inf ),
	\amp, Pwhite(0.2, 0.8, inf),
	\sustain,  0.1,
	\note,
		Pxrand(~scale[1..7], inf),

);
q = Pfin(~input.size, p);
~seq = q.play;
)


1.notemidi.midicps;
