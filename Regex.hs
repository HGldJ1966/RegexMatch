module Main where

import System.IO
import System.Environment

match :: (String,String) -> Bool
match ('^':xs,y:ys) = matchHere(xs,y:ys)
match (x:xs,y:ys) = matchHere(x:xs,y:ys)
    
matchHere :: (String,String) -> Bool
matchHere ([],_) = True
matchHere (x:'*':xs,y:ys) = matchStar(x,xs,y:ys)
matchHere (['$'],y) = y == []
matchHere (_,[]) = False
matchHere (x:xs,y:ys) | x == '.' || x == y = matchHere(xs,ys)
                      | otherwise = matchHere(x:xs,ys)
                      
matchStar :: (Char,String,String) -> Bool
matchStar (_,x,y) | matchHere(x,y) = True
matchStar (c,x:xs,y:y1:ys) | c == y1 || c == '.' = matchStar(c,xs,y1:ys)

main :: IO ()
main = do
  [regex,test] <- getArgs
  print $ match(regex,test)
