;hiljusti
(ns kata)

(def ^:private base 10)

(defn- sum-of-digits
  [integer]
  (loop [i   (Math/abs integer)
         sum 0]
    (if (zero? i)
      sum
      (recur (quot i base)
             (+ sum (rem i base))))))

(defn- new-value
  [integer]
  (->> integer
       sum-of-digits
       (- integer)))

(def ^:private fruits
  ["kiwi", "pear", "kiwi", "banana", "melon", "banana", "melon", "pineapple", "apple", "pineapple", "cucumber", "pineapple", "cucumber", "orange", "grape", "orange", "grape", "apple", "grape", "cherry", "pear", "cherry", "pear", "kiwi", "banana", "kiwi", "apple", "melon", "banana", "melon", "pineapple", "melon", "pineapple", "cucumber", "orange", "apple", "orange", "grape", "orange", "grape", "cherry", "pear", "cherry", "pear", "apple", "pear", "kiwi", "banana", "kiwi", "banana", "melon", "pineapple", "melon", "apple", "cucumber", "pineapple", "cucumber", "orange", "cucumber", "orange", "grape", "cherry", "apple", "cherry", "pear", "cherry", "pear", "kiwi", "pear", "kiwi", "banana", "apple", "banana", "melon", "pineapple", "melon", "pineapple", "cucumber", "pineapple", "cucumber", "apple", "grape", "orange", "grape", "cherry", "grape", "cherry", "pear", "cherry", "apple", "kiwi", "banana", "kiwi", "banana", "melon", "banana", "melon", "pineapple", "apple", "pineapple"])

(defn- integer->fruit
  [integer]
  (nth fruits (dec integer) nil))

(defn subtract-sum
  [integer]
  (let [new-integer (new-value integer)
        fruit       (integer->fruit new-integer)]
    (or fruit (recur new-integer))))
