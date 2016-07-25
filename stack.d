module stack;

import std.stdio;
import std.conv;
import std.typecons;

class NoMoreElementsException : Exception {

	this(string message) {
		super(message);
	}
}

struct Stack( T ) {

private:
	T stack[];

public:
	T pop() @property {

		if ( stack.length > 0 ) {
			T result = stack[ stack.length - 1 ];
			--stack.length;
			return result;
		}

		throw new NoMoreElementsException("No more elements on stack");
	}

	Nullable!(T) peek() @property {

		if ( stack.length > 0 ) {
			return Nullable!(T)(stack[ stack.length - 1 ]); 	
		}

		return Nullable!T.init;
	}

	void push( T element ) {
		stack ~= element;
	}

	pure size_t length() @property {
		return stack.length;
	}
}
