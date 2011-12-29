;; day 1 exercises

(defn big 
  "Returns true if st is greater than n characters, else returns false."
  [st, n]
  (> (count st) n)
)

(defn collection-type
  "Returns the collection type as a keyword."
  [col]
  (if (map? col) :map
    (if (list? col) :list
      (if (vector? col) :vector :unknown)
    )
  )
)
