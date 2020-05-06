;Author litso_roman
(defun main ()
  (dotimes (_ (read))
    (let ((n (read)))
      (format t "~a " (if (< n 0) (- 32 (logcount n)) (logcount n))))))

(main)
