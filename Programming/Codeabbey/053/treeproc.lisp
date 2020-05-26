;Author treeproc
(defvar *rows* (make-hash-table :test 'equal))
(defmacro srows(letter num)
    `(setf (gethash ,letter ,*rows*) ,num))

;I'm tired this code's bad soz
(srows #\a 1)
(srows #\b 2)
(srows #\c 3)
(srows #\d 4)
(srows #\e 5)
(srows #\f 6)
(srows #\g 7)
(srows #\h 8)


(dotimes (i (read))
    (let* 
    ((line (read-line))
    (k1 (gethash (char line 0) *rows*))
    (k2 (digit-char-p (char line 1)))
    (q1 (gethash (char line 3) *rows*))
    (q2 (digit-char-p (char line 4))))
        (format t "~a " (if (or (= k1 q1) (= k2 q2) (= (abs (- k1 q1)) (abs (- k2 q2)))) "Y" "N"))))
