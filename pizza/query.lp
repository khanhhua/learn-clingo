qty(1..4).

subtotal(Pizza, Qty, Subtotal) :-
    qty(Qty),
    pizza(Pizza),
    cost(pizza(Pizza), Cost),
    Subtotal = Qty * Cost.

total(Total) :-
    Total = #sum {S :subtotal(P,Q,S), pizza(P), qty(Q)}.
count(Count) :-
    Count = #sum {Q :subtotal(P,Q,_), pizza(P), qty(Q)}.

:- #count {Q: subtotal(P, Q, _), pizza(P)} 3.
:- 5000 < #sum {S: subtotal(P, Q, S), pizza(P), qty(Q)} < 7000.

#show total/1.
#show count/1.
#show subtotal/3.

