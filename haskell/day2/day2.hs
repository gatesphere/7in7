module Main where
  import Data.List
  
  mysort l = sortBy (\a b -> if (a < b) then LT else GT) l
  
  mysort2 fn l = sortBy fn l
  
  strtodouble :: [Char] -> Double
  strtodouble (h:t) = read t :: Double

  everythird x = x : (everythird (x + 3))

  everyfifth x = x : (everyfifth (x + 5))
  
  everyeighth x y = (zipWith (+) (everythird x) (everyfifth y))
  
  divide y x = (x / y)
  half = divide 2
  
  append y x = x ++ y
  newl = append "\n"
