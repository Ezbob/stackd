import std.stdio;
import stack;
import std.algorithm.sorting;
import std.typecons;


void main()
in {
	writeln("stack test starting");
}
out {
	writeln("stack test complete");
}
body {
	Stack!int s;

	int[5] test = [ 42, 32, -23, 5 , 2 ];

	foreach ( number; test ) {
		s.push(number);	
	}

	assert( s.length == test.length );

	for ( int i = test.length - 1; i >= 0; --i ) {
		assert( test[i] == s.pop );
	}

	try {
		s.pop();
		assert( false );
	} catch ( NoMoreElementsException e ) { }

	assert ( s.peek.isNull );

	s.push(42);

	assert ( !s.peek.isNull && s.peek.get() == 42 );

}
