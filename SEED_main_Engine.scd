/*

SEED:
Sound Engine Embellishment Designer


*/




/* define the tempo */
//

/*  define the root */
//C C# D D# E F F# G G# A A# B
// lin lin

(
~f = { |input|
	var root;
	root = input.size;
	root = ~root.linlin(0, 100, 60, 71).asInteger;
}
)

~root = ~f.("Hello World");
/* define the scale */

//(this could be a dictionary)

// use mod to pick a scale from the lenght of the string
// something like: length of string mod 8 (if using 7 scales)
(
~scales = Dictionary();
~scales.put(0, [0, 2, 4, 5, 7, 9, 11, 12]); // ionian
~scales.put(1, [0, 2, 3, 5, 7, 9, 10, 12]); // dorian: flat three and flat seven
~scales.put(2, [0, 1, 3, 5, 7, 8, 10, 12]); // phrygian: flat two, flat three, flat six and flat seven
~scales.put(3, [0, 2, 4, 6, 7, 9, 11, 12]); // lydian: sharp 4
~scales.put(4, [0, 2, 4, 5, 7, 9, 10, 12]); // mixolydian: flat seven
~scales.put(5, [0, 2, 3, 5, 7, 8, 10, 12]); // aeolian: flat three, flat six and flat seven
~scales.put(6, [0, 1, 3, 5, 6, 8, 10, 12]); // locrian: flat two, flat three, flat five, flat six and flat seven
)
// use array, and modify relative to the base scale


~scales.choose.choose + ~root;


~array[1];

// how many notes (events) are going to be played

/* define the rythm */
    //notes to rests ratio


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


