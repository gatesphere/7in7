module Main where
  data Position t = Position t deriving (Show)
  
  stagger (Position d) = Position (d + 2)
  crawl (Position d) = Position (d + 1)
  
  rtn x = x
  x >>== f = f x
  
  treasureMap pos = pos >>==
                    stagger >>==
                    stagger >>==
                    crawl >>==
                    rtn
