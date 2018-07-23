import FakeIt1
import Prelude ()

main = run inner

inner :: IOState -> IOState
inner io1 =
  let io2 = print "What's your name?" io1
      (io3, name) = getString io2
      io4 = print name io3
   in io4
