#lang racket/gui

(define number_of_clicks 0)

;---Menu Screen---
(define mygame (new frame%
                    [label "Menu"]
                    [width 1000] [height 800]
                    
                    )
  )

;---Buttons pannel---
(define panel (new vertical-panel%
                   [parent mygame]
                   [spacing 10]
                   [alignment '[center center]]
                   [border 20]
                   
                   )
  )

;---Start Game button---
(define startgamebutt (new button%
                           [parent panel]
                           [label "Start Game"]
                           [min-width 500] [min-height 60]
                           [font (make-object font% 15 'default 'normal 'bold)]
                           [callback (lambda (o e) (send myframe show #t) (send mygame show #f)(set! begin (- (current-seconds) diff))
                 (send timer start 10))]
                           
                           )
  )

;---Exit Game button---
(define exitgamebutt (new button%
                          [parent panel]
                          [label "Exit Game"]
                          [min-width 500] [min-height 60]
                          [font (make-object font% 15 'default 'normal 'bold)]
                          [callback [lambda (o e) (print " Game Closed") (send mygame show #f)]]
                          
                          )
  )



;---New frame for the memory game starts here---

;---Images used for the buttons---

;---Back of card image---
(define blank-card (read-bitmap "Images/Back_of_Card.png"))

;---Pair One---
(define pair-one (read-bitmap "Images/Pair1.png"))
(define pair-one-one (read-bitmap "Images/Pair1.1.png"))

;---Pair Two---
(define pair-two (read-bitmap "Images/Pair2.jpg"))
(define pair-two-two (read-bitmap "Images/Pair2.2.jpg"))

;---Pair Three---
(define pair-three (read-bitmap "Images/Pair3.png"))
(define pair-three-three (read-bitmap "Images/Pair3.3.png"))

;---Pair Four---
(define pair-four (read-bitmap "Images/Pair4.jpg"))
(define pair-four-four (read-bitmap "Images/Pair4.4.jpg"))

;---Pair Five---
(define pair-five (read-bitmap "Images/Pair5.png"))
(define pair-five-five (read-bitmap "Images/Pair5.5.png"))

;---Pair Six---
(define pair-six (read-bitmap "Images/Pair6.png"))
(define pair-six-six (read-bitmap "Images/Pair6.6.png"))

;---Pair Seven---
(define pair-seven (read-bitmap "Images/Pair7.jpg"))
(define pair-seven-seven (read-bitmap "Images/Pair7.7.jpg"))

;---Pair Eight---
(define pair-eight (read-bitmap "Images/Pair8.png"))
(define pair-eight-eight (read-bitmap "Images/Pair8.8.png"))


;---Game frame---
(define myframe (new frame%
                     [label "Memory Game"]
                     [parent mygame]
                     [width 1000] [height 800]
                     )
  )
;--Buttons panel---
(define buttons (new horizontal-panel%    
                     [parent myframe]
                     [alignment '[center center]]
                     [enabled #t]    
                     [border 5]    
                     [spacing 5]         
                     )
  )

;---Game button grids---
(define grid1 (new horizontal-panel%    
                   [parent myframe]
                   [alignment '[center center]]
                   [enabled #t]    
                   [border 5]    
                   [spacing 5]         
                   )
  )

(define grid2 (new horizontal-panel%    
                   [parent myframe]
                   [alignment '[center center]]
                   [enabled #t] 
                   [border 5]    
                   [spacing 5]         
                   )
  )

(define grid3 (new horizontal-panel%    
                   [parent myframe]
                   [alignment '[center center]]
                   [enabled #t]    
                   [border 5]    
                   [spacing 5]         
                   )
  )

(define grid4 (new horizontal-panel%    
                   [parent myframe]
                   [alignment '[center center]]
                   [enabled #t]    
                   [border 5]    
                   [spacing 5]            
                   )
  )    

;---Function for unmatching pairs---
; if two buttons dont match then they will return to their original blank state until
; they are matching and will stay on the images assigned to them

(define last_button_pressed 0)

(define  check_if_equal (λ (x)
                          (cond
                            [(> number_of_clicks 1)
                             (cond
                               [ (or (and (equal? x button1) (equal? last_button_pressed button2))
                                     (and (equal? x button2) (equal? last_button_pressed button1))
                                     (and (equal? x button3) (equal? last_button_pressed button4))
                                     (and (equal? x button4) (equal? last_button_pressed button3))
                                     (and (equal? x button5) (equal? last_button_pressed button6))
                                     (and (equal? x button6) (equal? last_button_pressed button5))
                                     (and (equal? x button7) (equal? last_button_pressed button8))
                                     (and (equal? x button8) (equal? last_button_pressed button7))
                                     (and (equal? x button9) (equal? last_button_pressed button10))
                                     (and (equal? x button10) (equal? last_button_pressed button9))
                                     (and (equal? x button11) (equal? last_button_pressed button12))
                                     (and (equal? x button12) (equal? last_button_pressed button11))
                                     (and (equal? x button13) (equal? last_button_pressed button14))
                                     (and (equal? x button14) (equal? last_button_pressed button13))
                                     (and (equal? x button15) (equal? last_button_pressed button16))
                                     (and (equal? x button16) (equal? last_button_pressed button15))
                                     
                                     )
                                 (displayln "RIGHT!")
                                 ]
                               [else
                                (displayln "WRONG!")
                                (sleep 2)
                                (send x set-label blank-card)
                                (send x enable #t)
                                (send last_button_pressed set-label blank-card)
                                (send last_button_pressed enable #t)
                                ]
                               )
                             (set! number_of_clicks 0)
                             ]
                            [else (set! last_button_pressed x)]
                            )
                          )
  )

;(define potential_parents (list grid1 grid2 grid3 grid4))

;(define random_number (shuffle '(1 2 3 4)))

;(define mapped (map list potential_parents random_number))


;---Row-one buttons---
(define button1 (new button%
                     [parent grid1]
                     [label blank-card]
                     [min-height 15]
                     [min-width 10]
                     [callback (λ (x y)
                                 (send button1 set-label pair-one)
                                 (send button1 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button1)
                                 (displayln "button1 pressed")
                                 )
                               ]
                     )
  )

(define button2 (new button%
                     [parent grid3]
                     [label blank-card]
                     [min-height 15]
                     [min-width 15]
                     [callback (λ (x y)
                                 (send button2 set-label pair-one-one)
                                 (send button2 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button2)
                                 (displayln "button2 pressed"))]
                     )
  )

(define button3 (new button%
                     [parent grid2]
                     [label blank-card]
                     [min-height 15]
                     [min-width 15]
                     [callback (λ (x y)
                                 (send button3 set-label pair-two)
                                 (send button3 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button3)
                                 (displayln "button3 pressed")
                                 )
                               ]
                     )
  )

(define button4 (new button%
                     [parent grid4]
                     [label blank-card]
                     [min-height 15]
                     [min-width 15]
                     [callback (λ (x y)
                                 (send button4 set-label pair-two-two)
                                 (send button4 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button4)
                                 (displayln "button4 pressed")
                                 )]
                     )
  )

;---Row-two buttons---
(define button5 (new button%
                     [parent grid3]
                     [label blank-card]
                     [min-height 25]
                     [min-width 25]
                     [callback (λ (x y)
                                 (send button5 set-label pair-three)
                                 (send button5 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button5)
                                 (displayln "button5 pressed")
                                 )]
                     )
  )

(define button6 (new button%
                     [parent grid1]
                     [label blank-card]
                     [min-height 15]
                     [min-width 15]
                     [callback (λ (x y)
                                 (send button6 set-label pair-three-three)
                                 (send button6 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button6)
                                 (displayln "button6 pressed")
                                 )]
                     )
  )

(define button7 (new button%
                     [parent grid1]
                     [label blank-card]
                     [min-height 15]
                     [min-width 15]
                     [callback (λ (x y)
                                 (send button7 set-label pair-four)
                                 (send button7 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button7)
                                 (displayln "button7 pressed")
                                 )]
                     )
  )

(define button8 (new button%
                     [parent grid4]
                     [label blank-card]
                     [min-height 15]
                     [min-width 15]
                     [callback (λ (x y)
                                 (send button8 set-label pair-four-four)
                                 (send button8 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button8)
                                 (displayln "button8 pressed")
                                 )]
                     )
  )

;---Row-three buttons---
(define button9 (new button%
                     [parent grid3]
                     [label blank-card]
                     [min-height 15]
                     [min-width 15]
                     [callback (λ (x y)
                                 (send button9 set-label pair-five)
                                 (send button9 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button9)
                                 (displayln "button9 pressed")
                                 )]
                     )
  )

(define button10 (new button%
                      [parent grid4]
                      [label blank-card]
                      [min-height 15]
                      [min-width 15]
                      [callback (λ (x y)
                                 (send button10 set-label pair-five-five)
                                 (send button10 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button10)
                                 (displayln "button10 pressed")
                                 )]
                      )
  )

(define button11 (new button%
                      [parent grid2]
                      [label blank-card]
                      [min-height 15]
                      [min-width 15]
                      [callback (λ (x y)
                                 (send button11 set-label pair-six)
                                 (send button11 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button11)
                                 (displayln "button11 pressed")
                                 )]
                      )
  )

(define button12 (new button%
                      [parent grid4]
                      [label blank-card]
                      [min-height 15]
                      [min-width 15]
                      [callback (λ (x y)
                                 (send button12 set-label pair-six-six)
                                 (send button12 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button12)
                                 (displayln "button12 pressed")
                                 )]
                      )
  )

;---Row-four buttons---
(define button13 (new button%
                      [parent grid1]
                      [label blank-card]
                      [min-height 15]
                      [min-width 15]
                      [callback (λ (x y)
                                 (send button13 set-label pair-seven)
                                 (send button13 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button13)
                                 (displayln "button13 pressed")
                                 )]
                      )
  )

(define button14 (new button%
                      [parent grid2]
                      [label blank-card]
                      [min-height 15]
                      [min-width 15]
                      [callback (λ (x y)
                                 (send button14 set-label pair-seven-seven)
                                 (send button14 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button14)
                                 (displayln "button14 pressed")
                                 )]
                      )
  )

(define button15 (new button%
                      [parent grid2]
                      [label blank-card]
                      [min-height 15]
                      [min-width 15]
                      [callback (λ (x y)
                                 (send button15 set-label pair-eight)
                                 (send button15 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button15)
                                 (displayln "button15 pressed")
                                 )]
                      )
  )

(define button16 (new button%
                      [parent grid3]
                      [label blank-card]
                      [min-height 15]
                      [min-width 15]
                      [callback (λ (x y)
                                 (send button16 set-label pair-eight-eight)
                                 (send button16 enable #f)
                                 (set! number_of_clicks (+ 1 number_of_clicks))
                                 (check_if_equal button16)
                                 (displayln "button16 pressed")
                                 )]
                      )
  )

;---Randomise buttons and reset functions---
;(define list_of_buttons (list button1 button2 button3 button4 button5 button6 button7 button8
;                              button9 button10 button11 button12 button13 button14 button15 button16))

;(define another_list (shuffle '(1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16)))

;(define destination (map list list_of_buttons another_list))

; TO GET A RANDOM NUMBER USE (list-ref destination (random 17))


;(define matching_images (set (set 1 2) (set 3 4) (set 5 6) (set 7 8)
;                             (set 9 10) (set 11 12) (set 13 14) (set 15 16)))


;---Function for timer---

; begin is the time when "Start" button is pressed (in seconds)
; diff is (- (current-inexact-seconds) begin)
(define begin 0.0)
(define diff 0.0)
(define msg (new message% [parent myframe]
                 [label "Press Start button to start the timer."])
  )

;---Timer callback---
(define timer (new timer%
                   [notify-callback (lambda ()
                                               (set! diff (- (current-seconds) begin))
                                               (send msg set-label (number->string diff)))]
                   [interval #f]
                   )
  )

;---Stop button---
(new button% [parent myframe]
     [label "Stop"]
     (callback (lambda (button event)
                 (send timer stop)
                 (send wongame show #t) (send myframe show #f)
                 (send msg2 set-label (number->string diff)))))
                   

;---Scoreboard---
; scoreboard will have the top 5 highest scores highest being the shortest completion time
; and the lowest being the longest completion time

(define scoreboard (new message% [parent myframe]
                 [label "Scoreboard"])
  )

; Win game pop up

(define wongame (new frame%
                    [label "Winner!"]
                    [width 300] [height 400]
                    
                    )
  )
(define msg1 (new message% [parent wongame]
                 [label "Your Time is:"])
  )

(define msg2 (new message% [parent wongame]
                 [label "Your Time is:"])
  )
; the positions of the buttons on the grid will be randomised each time the game restarts

(send mygame show #t)