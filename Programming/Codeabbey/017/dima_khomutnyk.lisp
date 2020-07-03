;Author dima_khomutnyk
(defun read-inputs ()
    (let (input)
       (dotimes (i (read) (reverse input))
          (push (read) input))))

(defun print-solution (solution)
    (format t "~d" solution))

(defun solve (input)
    (checksum input))

(defun checksum (lst)
    (let ((result 0))
      (dolist (x lst result)
          (setf result (mod (* 113 (+ x result)) 10000007)))))
    
(print-solution (solve (read-inputs)))