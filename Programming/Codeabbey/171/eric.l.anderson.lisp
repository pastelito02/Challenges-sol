;Author eric.l.anderson
;|Tree Height Measurements

input: number of tests
values D and B

output: hieght of trees in integer

variables
D     Distance to tree
B     angle between line of sight to ground.
A     angle between line of sight to tree top

equations

H = D * tan(a)
A = B - 90


|;

(defun trees (inlst / outlst indx dist height ang bang reps)
  (setq    reps (nth 0 inlst)
    indx 1
  )
  (repeat reps
    (setq dist (nth indx inlst)
      bang (nth (1+ indx) inlst)
      ang  (* pi (/ (- bang 90) 180))
    )
    (setq height (* dist (/ (sin ang) (cos ang)))
      outlst (append outlst (list (rtos height 2 0)))
          indx (+ indx 2))
  )
  (princ outlst)
  (princ)
)
