import FakeIt3
import Prelude ()

inner :: Action ()
inner = doBoth echoName echoAge

echoName :: Action ()
echoName = andThen
  (promptString "What's your name?")
  print

echoAge :: Action ()
echoAge = andThen
  (promptInt "What's your age?")
  printInt

-- inner = doBoth
--   (andThen
--     (promptString "What's your name?")
--     print)
--   (andThen
--    (promptInt "What's your age?")
--    printInt)


printInt :: Int -> Action ()
printInt n = print (showInt n)
--printInt = print . showInt  -- would work in full haskell

andThen :: Action a -> (a -> Action b) -> Action b
andThen getVal useVal io1 =
  let (io2, val1) = getVal io1
      (io3, val2) = useVal val1 io2
  in (io3, val2)

doBoth :: Action a -> Action b -> Action b
doBoth action1 action2 io1 =
  let (io2, _a) = action1 io1
      (io3, b) = action2 io2
   in (io3, b)

main = run inner
