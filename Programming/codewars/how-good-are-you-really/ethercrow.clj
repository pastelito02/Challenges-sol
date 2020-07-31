(ns kata.how-good-are-you)

(defn avg [xs]
  (/ (reduce + xs) (count xs)))

(defn better_than_average [class_points your_points]
  (> your_points (avg class_points)))
