module Stamps where

import Color
import Graphics.Collage (..)
import Graphics.Element (..)
import List ((::))
import List
import Mouse
import Signal
import Text (..)

import Debug

main : Signal Element
main =
  Signal.map scene clickLocations


-- for a good time, remove "sampleOn Mouse.clicks" ;)
clickLocations : Signal (List (Int,Int))
clickLocations =
  Signal.foldp (::) [] (Signal.sampleOn Mouse.clicks Mouse.position)

width = 1500
height = 1000

drawPentagon : (Int, Int) -> Form
drawPentagon (x,y) =
          ngon 5 40
            |> filled (Color.blue)
            |> move (toFloat x - toFloat width / 2, toFloat height / 2 - toFloat y)

scene : List (Int,Int) -> Element
scene locs = collage width height (List.map drawPentagon (Debug.watch "locs" locs))
