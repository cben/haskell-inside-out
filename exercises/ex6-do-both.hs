import FakeIt4
import Prelude ()

-- inner :: Action ()
inner = echoName `doBoth` echoAge `doBoth` echoName
--inner = doBoth echoName (doBoth echoAge echoName)
--inner = doBoth (doBoth echoName echoAge) echoName
--inner = fold doBoth [echoName, echoAge, echoName]

doBoth :: Action () -> Action () -> Action ()
doBoth action1 action2 io1 =
  let (io2, ()) = action1 io1
      (io3, ()) = action2 io2
   in (io3, ())

main = run inner
