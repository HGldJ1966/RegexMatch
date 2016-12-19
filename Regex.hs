module Main where

import System.IO
import System.Environment

match :: (String,String) -> Bool
match ('^':regex,t:test) = matchHere(regex,t:test)
match (r:regex,t:test) = matchHere(r:regex,t:test)
    
matchHere :: (String,String) -> Bool
matchHere ([],_) = True
matchHere (r:'*':regex,t:test) = matchStar(r,regex,t:test)
matchHere (['$'],test) = test == []
matchHere (_,[]) = False
matchHere (r:regex,t:test) | r == '.' || r == t = matchHere(regex,test)
                      | otherwise = matchHere(r:regex,test)
                      
matchStar :: (Char,String,String) -> Bool
matchStar (_,r,t) | matchHere(r,t) = True
matchStar (c,r:regex,t:t1:test) | c == t1 || c == '.' = matchStar(c,regex,t1:test)

main :: IO ()
main = do
  [regex,test] <- getArgs
  print $ match(regex,test)
