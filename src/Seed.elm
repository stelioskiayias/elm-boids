module Seed exposing (generateBoids)

import Debug exposing (log)
import Boid exposing (Boid)
import Random exposing (Generator, generate, list, int, float, map4)


randomBoid : Float -> Float -> Float -> Int -> Boid
randomBoid x y angle speed = 
  Boid (x, y) angle speed

boidGenerator : (Int, Int) -> Generator Boid
boidGenerator (width, height) = 
      let
          x = (toFloat width) / 2
          y= (toFloat height) / 2
      in
          
      log (toString (x, y))
      (map4 randomBoid (float -x x) (float -y y) (float 0 360) (int 1 10)) 

generateBoids : (List Boid -> msg) -> Int -> (Int, Int) -> Cmd msg
generateBoids tagger numberOfBoids boundaries =
    generate tagger (list numberOfBoids (boidGenerator boundaries) )