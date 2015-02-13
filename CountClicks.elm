module CountClicks where

import Graphics.Element (..)
import Text (..)
import Signal
import Mouse

main : Signal Element
main = Signal.map asText state

state : Signal Int
state = Signal.foldp (\_ s -> s + 1) 0 Mouse.clicks
