/*

SEED:
Sound Engine Embellishment Designer


*/


(

// hardcoded input
~input = "Test";

/*  define the root */
//C C# D D# E F F# G G# A A# B
~defineRoot = {
	var root;
	root = ~input.size.linlin(0, 100, 60, 71).asInteger;
};


~root = ~defineRoot.();
~rootMessage = "The root is: " ++ ~root.midinote.asString;
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


~scale = ~scales[~input.size%~scales.size];
~scaleMessage = "Selected scale is: " ++ ~scale[0];
~scaleMessage.postln;
/* define the tempo */
//

(~scale[1] + ~root).midinote;

)

// how many notes (events) are going to be played

/* define the rythm */
    // notes to rests ratio
    // count the chars vs the spaces and determine


/* create the sound */
// (couple of synthesizers)

/* detune ? */

/* fx? */
      //delay
      //reverb


/* octaves: how wide does that composition need to be? */

t = TempoClock(112/60);

s.boot;
(
Pbind(
	\dur, 1/4,
	\sustain,  0.1,
	\degree, Pseq([
		\,4,\,5,\,7,\,4,
		5,\,7,\,8,\,\,\
	]),
).play(t);
)


