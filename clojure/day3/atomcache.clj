(defn create
  []
  (atom {})
)

(defn get
  [cache key]
  (@cache key)
)

(defn put
  ([cache value-map]
    (swap! cache merge value-map)
  )
  ([cache key value]
    (swap! cache assoc key value)
  )
)

(def ac (create))
(put ac :quote "I'm your father, Luke.")
(println (str "Cached item: " (get ac :quote)))
