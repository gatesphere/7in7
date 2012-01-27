module Main where
  data Tree a = Children [Tree a] | Leaf a deriving (Show)
  
  depth (Leaf _) = 1
  depth (Children c) = 1 + maximum (map depth c)
