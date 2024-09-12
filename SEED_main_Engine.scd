/*

SEED:
Sound Engine Embellishment Designer


*/




/* define the tempo */
//

/*  define the root */
//C C# D D# E F F# G G# A A# B
// lin lin


~root = 80;
~root = ~root.linlin(0, 100, 60, 71)


/* define the scale */

//(this could be a dictionary)

// use mod to pick a scale from the lenght of the string
// something like: length of string mod 8 (if using 7 scales)
~scales = Dictionary();
~scales.put(0, [0, 2, 4, 5, 7, 9, 11, 12]); // aeolian
~scales.put(1, [0, 2, 3, 5, 7, 9, 10, 12]); // dorian
~scales.put(2, [0, 2, 3, 5, 7, 9, 10, 12]); // TBD
~scales.put(3, [0, 2, 3, 5, 7, 9, 10, 12]); // TBD
~scales.put(4, [0, 2, 3, 5, 7, 9, 10, 12]); // TBD
~scales.put(5, [0, 2, 3, 5, 7, 9, 10, 12]); // TBD
~scales.put(6, [0, 2, 3, 5, 7, 9, 10, 12]); // TBD
~scales.put(7, [0, 2, 3, 5, 7, 9, 10, 12]); // TBD

// use array, and modify relative to the base scale

~aeolian = [0, 2, 4, 5, 7, 9, 11, 12];
~dorian = ~aeolian.copy;
~dorian.put(2, ~dorian[2]-1);
~aeolian;

})
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




t = TempoClock(112/60);

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

125% 8
