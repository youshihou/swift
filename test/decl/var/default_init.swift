// RUN: %swift -parse %s -verify 

// Default initialization of variables.

struct CanDefaultInit {
  var opt1: Int?
  var (opt2, (opt3, opt4)): (Int?, (Float?, Double?))
}

func testCanDefaultInit() {
  CanDefaultInit()
}


// Cases where we cannot perform default initialization.
class NotInitializable1 { // expected-error{{class 'NotInitializable1' has no initializers}}
  var (opt1, int1) : (Int?, Int) // expected-note{{stored properties 'opt1' and 'int1' without initial values prevent synthesized initializers}}
  let opt2: Int? // expected-note{{stored property 'opt2' without initial value prevents synthesized initializers}}
}

func localDefaultInit() -> Int? {
  var i: Int?
  return i
}
