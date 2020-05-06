;Author Seneca Drennan
;; Share Price Volatility

(defun SPV ( #FilePath / i file filepath _$Data _$Name _$NextLine _$TempList return )

  (if (setq filepath (findfile #FilePath))(progn
    (setq file (open filepath "r"))

    (while (setq _$NextLine (read-line File))
      (setq i 1 _$TempList nil _$Name nil)
      (repeat (strlen _$Nextline)
        (if    (wcmatch (substr _$NextLine i 1) " ")(progn
          (if (null _$Name)
            (setq _$Name (substr _$NextLine 1 (1- i)))
            (setq _$TempList (cons (atoi (substr _$NextLine 1 (1- i))) _$TempList))
          )
          (setq
            _$NextLine (substr _$NextLine (1+ i))
            i 1
          )
        )
          (setq i (1+ i))
        )
      )
      (setq _$Data (append _$Data (list (cons _$Name (reverse _$TempList)))))
    )
    (close file)

    (foreach datapoint _$Data
      (if (> (StandardDeviation (cdr datapoint)) (* 0.04 (AverageList (cdr datapoint))))
        (setq return (cons (car datapoint) return))
      )

    )
    (foreach n (reverse return) (princ n)(princ " "))
  ))
  (princ)
)

;; Standard Deviation

(defun StandardDeviation ( #Array / _$Mean _$TempList return )
  (setq _$Mean (AverageList #Array))
  (foreach n #Array
    (setq _$TempList (cons (expt (- _$Mean n) 2.0) _$TempList))
  )
  (setq return (sqrt (AverageList _$TempList)))
)

;; Average the numbers in a list
;; Sum of elements divided by count of elements.

(defun AverageList ( #TheList / return )
  (setq return (/ (SumList #TheList) (float (length #TheList))))
)

;; Sum elements of a List - Copied solution from problem #2

(defun SumList ( #Values / i return )
  (setq i 0 return 0)
  (repeat (length #Values)
    (setq return (+ return (nth i #Values)))
    (setq i (1+ i))
  )
  return
)

(princ)
