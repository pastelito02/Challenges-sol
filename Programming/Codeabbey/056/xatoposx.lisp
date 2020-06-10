;Author xatoposx
(require racket/list)
(require racket/base)
(require 2htdp/universe)
(require 2htdp/image)
(require 2htdp/batch-io)

;; -------------------------------------------
;; CONSTANTS
;; change them when game dimensions change.
;; Remark: test cases here assume ROWS = 5 and COLS = 5
;;         test cases in code_abbey assume ROWS = 
(define ROWS 30)
(define COLS 30)

;; -------------------------------------------
;; DATA DEFINITIONS:

(define-struct cell (row col) #:transparent)
;; Cell is (make-cell Natural[0, ROWS) Natural[0, COLS))
;; interp. a cell in a game of life determined by its position in the
;;         game
(define ALL-CELLS ;empty cells
  (for*/list ([r ROWS]
              [c COLS])
    (make-cell r c)))

;; GameLife is a (listof Cell)
;; interp. cells containing current live organisms
(define L0 empty) ; no live cell
(define L2 (list (make-cell 0 4) (make-cell 1 4)))
(define L3 (list (make-cell 2 1) (make-cell 2 2) (make-cell 2 3)))
(define L5 
  (list (make-cell 1 2) 
        (make-cell 2 1) (make-cell 2 2) (make-cell 2 3)
        (make-cell 3 2)))

;; -------------------------------------------
;; HELPERS:

;; (listof X) (listof Y) -> (listof (list X Y))
;; produce the cartesian product of lox and loy
(define (cartesian-product lox loy)
  (append-map (lambda (x) (map (lambda (y) (list x y)) loy)) lox))

;; (listof X) (listof X) -> (listof X)
;; produce the union of two given lists
(define (union lox1 lox2)
  (remove-duplicates (append lox1 lox2)))

;; (listof (X -> Boolean)) -> (X -> Boolean)
;; combine predicates taking same arg in lop into a single predicate
(define (multi-predicate lop)
  (lambda (x) (andmap (lambda (p) (p x)) lop)))

;; -------------------------------------------
;; FUNCTIONS:

;; -------------------------------------------
;; * Predicates

;; Cell LifeGame -> Boolean
;; determine whether life is to be born in c
(check-expect (to-born? (make-cell 2 2) empty) #f)
(check-expect (to-born? (make-cell 2 0) L3) #f)
(check-expect (to-born? (make-cell 1 1) L3) #f)
(check-expect (to-born? (make-cell 1 2) L3) #t)
(check-expect (to-born? (make-cell 3 2) L3) #t)
(check-expect (to-born? (make-cell 3 3) L3) #f)
(check-expect (to-born? (make-cell 3 4) L3) #f)

(define (to-born? c lg)
  (and (not (life? c lg))
       (= (length (neighbors c lg)) 3)))

;; Cell LifeGame -> Boolean
;; determine whether c is to be killed
(check-expect (to-die? (make-cell 2 2) L5) #t)
(check-expect (to-die? (make-cell 2 1) L3) #t)
(check-expect (to-die? (make-cell 2 3) L5) #f)

(define (to-die? c lg)
  (local [(define num-nbs (length (neighbors c lg)))]
    (and (life? c lg)
         (or (< num-nbs 2) (> num-nbs 3)))))

;; Cell -> Boolean
;; determine whether c lives in lg
(check-expect (life? (make-cell 3 1) L3) #f)
(check-expect (life? (make-cell 2 2) L3) #t)

(define (life? c lg)
  (member? c lg))

;; Cell LifeGame -> (listof Cell)
;; produce list of neighbors of c in given life game
(check-expect (neighbors (make-cell 2 2) L0) empty)
(check-expect (neighbors (make-cell 2 2) L3) 
              (list (make-cell 2 1) (make-cell 2 3)))
(check-expect (neighbors (make-cell 2 4) L2)
              (list (make-cell 1 4)))

(define (neighbors c lg)
  (local [(define candidates
            (remove
             (list (cell-row c) (cell-col c))
             (cartesian-product
              (list (cell-row c) (add1 (cell-row c)) (sub1 (cell-row c)))
              (list (cell-col c) (add1 (cell-col c)) (sub1 (cell-col c))))))
          
          (define (in-neighborhood? c)
            (member (list (cell-row c) (cell-col c)) candidates))
          
          (define (inside? c)
            (and (<= 0 (cell-row c) (sub1 ROWS)) 
                 (<= 0 (cell-col c) (sub1 COLS))))
          
          (define (living? c)
            (life? c lg))]
    
    (filter (multi-predicate (list in-neighborhood? inside? living?)) lg)))

;; -------------------------------------------
;; * Main functions

;; Natural LifeGame -> (listof Natural)
;; count number of organisms after n steps of evolution
(define (count-organisms n0 lg0)
  (local [(define (count-organisms n lg csf)
            (cond [(zero? n) (reverse csf)]
                  [else
                   (local [(define nxt (evolve lg))]
                     (count-organisms (sub1 n)
                                      nxt
                                      (cons (length nxt) csf)))]))]
    (count-organisms n0 lg0 empty)))

;; LifeGame -> LifeGame
;; produce next state of life (sorted)
(check-expect (evolve L3)
              (list (make-cell 1 2) (make-cell 2 2) (make-cell 3 2)))

(define (evolve lg)
  (sort-lg (union (spawn lg) (kill lg))))

;; LifeGame -> LifeGame
;; produce cells with new born organisms from lg
(check-expect (spawn L3) 
              (list (make-cell 1 2) (make-cell 3 2)))
(check-expect (spawn L5)
              (list (make-cell 1 1) (make-cell 1 3) 
                    (make-cell 3 1) (make-cell 3 3)))

(define (spawn lg)
  (filter (lambda (c) (to-born? c lg)) ALL-CELLS))

;; LifeGame -> LifeGame
;; remove from given life game all dying organisms
(check-expect (kill L3) (list (make-cell 2 2)))
(check-expect (kill L5) 
              (list (make-cell 1 2) (make-cell 2 1) 
                    (make-cell 2 3) (make-cell 3 2)))

(define (kill lg)
  (foldr (lambda (c rc) (if (to-die? c lg) rc (cons c rc))) empty lg))

;; LifeGame -> LifeGame
;; sort given game by row and col of cells, in this order
(define (sort-lg lg)
  (sort (sort lg (lambda (c1 c2) (< (cell-row c1) (cell-row c2))))
        (lambda (c1 c2) (< (cell-col c1) (cell-col c2)))))

;; -------------------------------------------
;; ADDON (animation)
;; click space key to render next evolution step

;; one example for animation
(define R-PENTOMINO
  (list (make-cell 1 2) (make-cell 1 3)
        (make-cell 2 1) (make-cell 2 2)
        (make-cell 3 2)))

(define WIDTH 400)
(define HEIGHT 400)
(define CELL-WIDTH (/ WIDTH ROWS))
(define CELL-HEIGHT (/ HEIGHT ROWS))
(define SHIFT-X (/ CELL-WIDTH 2))
(define SHIFT-Y (/ CELL-HEIGHT 2))

(define BLNK (rectangle CELL-WIDTH CELL-HEIGHT "outline" "black"))
(define ONE-ROW (apply beside (build-list COLS (lambda (x) BLNK))))
(define MTS (apply above (build-list ROWS (lambda (x) ONE-ROW))))
(define ORG (rectangle CELL-WIDTH CELL-HEIGHT "solid" "red"))

;; LifeGame -> LifeGame
;; call main with any life game, as (main R-PENTOMINO)
(define (main lg)
  (big-bang lg
            (on-tick evolve 0.5)
            ;(on-key key-handler)
            (to-draw render)))

;; LifeGame Key -> LifeGame
;; produce next evolution lg when pressing 'space' key
(define (key-handler lg k)
  (cond [(key=? k " ") (evolve lg)]
        [else lg]))

;; LifeGame -> Image
;; render the given life game
(define (render lg)
  (cond [(empty? lg) MTS]
        [else
         (place-image ORG
                      (+ (* (cell-col (first lg)) CELL-WIDTH) SHIFT-X)
                      (+ (* (cell-row (first lg)) CELL-HEIGHT) SHIFT-Y)
                      (render (rest lg)))]))


