;Author chris_bandit

(defun get-value (n)
    (setf n (* n n))
    (setf n (/ n 100))
    (setf n (floor (mod n 10000)))
    (values n))

(defun c-iters (i)
    (setf vals nil)
    (setf found 0)
    (setf iters 0)
    (loop while (= found 0) do
        (if (numberp (position i vals)) (setf found 1)
            (progn (push i vals)
                   (incf iters)
                   (setf i (get-value i)))))
        (values iters))

(princ "input: ")
(defvar len (read))

(format t "~{~a ~}"
    (loop for i from 1 to len do
        (setf start (read))
        collect (c-iters start)))