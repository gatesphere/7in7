;; unless-else
(defmacro unless-else [condition body else-body]
  (list 'if (list 'not condition) body else-body)
)

;; protocol/record example -- meow
;; pathetic, I know
(defprotocol Meow
  (meow [c])
)

(defrecord Cat []
  Meow
  (meow [_] (println "meow!"))
)
