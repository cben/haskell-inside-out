import FakeIt2
import Prelude ()

main = run inner

inner :: Action ()
inner io1 =
  let
      (io2, _) = print "What's your name?" io1
      (io3, name) = getString io2
      (io4, _) = print name io3
   in (io4, ())
