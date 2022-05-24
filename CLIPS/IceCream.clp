;              ll
;              ll   ii
;     CCCCC    ll   ii
;    CC        ll
;   C          ll
;  CC          ll   ii   ppppppp     ssssss
; CC           ll   ii   pp    pp   ss
; CC           ll   ii   pp     pp  ss
; CC           ll   ii   pp     pp  sss
; CC           ll   ii   pp     pp   ssss
; CC           ll   ii   pp     pp     sss
;  CC          ll   ii   pp     pp       ss
;  CCC         ll   ii   pp    pp        ss
;   CCC        ll   ii   pp    pp   s    ss
;     CCCCCC   ll   ii   ppppppp    ssssss
;                        pp
;                        pp
;                        pp
;                        pp
;                        pp
; Ice Cream Split Program
; People are represented with template
; (reset) upon start, then (run)


(deftemplate person
	(slot name)
	(slot dollars)
	(slot gallons)
)

(deffunction questAllow (?question $?allowed-values)
   (print ?question)
   (bind ?answer (read))
   (if (lexemep ?answer)
       then (bind ?answer (lowcase ?answer)))
   (while (not (member$ ?answer ?allowed-values)) do
      (print ?question)
      (bind ?answer (read))
      (if (lexemep ?answer) 
          then (bind ?answer (lowcase ?answer))))
   ?answer
)

(deffunction quest (?question)
   (print ?question)
   (bind ?answer (read))
   (if (not (numberp ?answer)) 
       then (bind ?answer (lowcase ?answer)))
   ?answer
)

(deffunction questPers (?q1 ?insert ?q2)
	(print ?q1 ?insert ?q2)
	(bind ?answer (read))
	(if (not (numberp ?answer)) 
       then (bind ?answer (lowcase ?answer)))
	?answer
)

(deffunction questYN (?question)
   (bind ?response (questAllow ?question yes no y n))
   (if (or (eq ?response yes) (eq ?response y))
       then yes 
       else no)
)

(deffunction questNum (?question)
	(bind ?response (quest ?question))
	(while (not (numberp ?response)) do
		(print ?question)
		(bind ?response (read)))
	?response
)

(deffunction questNumPerson (?q1 ?insert ?q2)
	(bind ?response (questPers ?q1 ?insert ?q2))
	(while (not (numberp ?response)) do
		(print ?q1 ?insert ?q2)
		(bind ?response (read)))
	?response
)

(deffunction fillPerson (?gallonsT ?dollarsT ?numPerson )
	(bind ?n (questPers "Name " (+ ?numPerson 1) ": "))
	(bind ?d (questNumPerson "Dollars " ?n " contributing: "))
	(assert (person (name ?n) (dollars ?d) (gallons (* (/ ?d ?dollarsT) ?gallonsT))))
)


(defrule start
	
=>
	(assert (peopleFilled 0))
	(assert (gallonsPerDollar 0))
	(assert (numDisplayed 0))
	(bind ?dT (questNum "Enter total dollars contributing: "))
	(assert (totalDollars ?dT))
	(bind ?nP (questNum "Enter the number of people are contributing: "))
	(assert (totalPeople ?nP))
	(bind ?gT (questNum "Enter the total number of gallons getting: " ))
	(assert (totalgallons ?gT))
)

(defrule fillPpersonInfo
	(totalgallons ?gT)
	(totalDollars ?dT)
	(totalPeople ?nP)
	?f <- (peopleFilled ?pF)
	(test (> ?nP ?pF))
=> 
	(fillPerson ?gT ?dT ?pF)
	(retract ?f)
	(assert (peopleFilled (+ ?pF 1)))
)

(defrule startDisplay
	(peopleFilled ?pF)
	(totalPeople ?tP)
	(test (eq ?pF ?tP))
=>
	(printout t "Split:" crlf)
	(assert (startDisplay true))
)

(defrule displaySplit
	(startDisplay ?s)
	(person (name ?n) (gallons ?g))
	(startDisplay ?s)
	(test (eq ?s true))
=>
	(printout t ?n ": " ?g " gallons" crlf)
)
