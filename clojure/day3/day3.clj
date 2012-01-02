(defn create
  []
  (ref [])
)

(defn add-acct
  [vector acct balance]
  (dosync
    (alter vector conj {:account acct :balance balance})
  )
)

(defn debit
  [vector acct value]
  (map
    (fn [account]
      (if
        (= acct (:account account))
        (assoc account :balance (- (:balance account) value))
        account
      )
    )
    vector
  )
)

(defn credit
  [vector acct value]
  (debit vector acct (- value))
)

(def accts (create))
(add-acct accts "123" 50)
(add-acct accts "456" 50)
(add-acct accts "789" 50)

(dosync
  (alter accts credit "456" 50)
  (alter accts debit "123" 25)
)

(println @accts)
