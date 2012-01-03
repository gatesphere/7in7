module Main where
  reverselist [] = []
  reverselist (h:t) = reverselist t ++ [h]
  
  colors = ["black", "white", "blue", "yellow", "red"]
  combinations = [(x, y) | x <- colors, y <- colors, x /= y, x < y]

  multTable = [(x,y,x*y) | x <- [1..12], y <- [1..12]]

  mapcolors = ["red", "green", "blue"]
  coloring = [(alabama, mississippi, georgia, tennessee, florida) | 
              alabama <- mapcolors, mississippi <- mapcolors,
              georgia <- mapcolors, tennessee <- mapcolors,
              florida <- mapcolors, mississippi /= tennessee,
              mississippi /= alabama, alabama /= tennessee,
              alabama /= georgia, alabama /= florida, 
              georgia /= florida, georgia /= tennessee]
  
