import FakeIt2
import Prelude ()

promptString :: String -> Action String
promptString msg io1 =
  let (io2, ()) = print msg io1
      (io3, str) = getString io2
   in (io3, str)

promptInt :: String -> Action Int
promptInt msg io1 =
  let (io2, str) = promptString msg io1
   in (io2, readInt str)

inner :: Action ()
inner io1 =
  let (io2, age) = promptInt "What's your age?" io1
      (io3, ()) = print (showInt age) io2
   in (io3, ())

main = run inner
