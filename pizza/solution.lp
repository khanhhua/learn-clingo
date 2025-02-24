#program base.
#const n=2.

no(1..n).
qty(0..3).

% GENERATE

{line(N,P,Q): no(N)} 2:- pizza(P), qty(Q).

% CONSTRAINTS - I don't want these!
:- line(N1, P1, Q1), line(N2, P2, Q2),
    P1 = P2,
    N1 != N2,
    Q1 != Q2.
:- line(N1, P1, Q1), line(N2, P2, Q2),
    P1 != P2,
    N1 != N2,
    Q1 = Q2.
:- line(_, _, Q), Q = 0.

:- count(Count), Count < n.

% FORMAT output
product(P, Q) :- line(_, P, Q).

subtotal(P, Q, Subtotal) :-
    line(_, P, Q),
    cost(pizza(P), Cost),
    Subtotal = Q * Cost.
total(Total) :-
    Total = #sum{Subtotal, P: subtotal(P,Q, Subtotal)}.
count(Count) :-
    Count = #sum{Q, P: subtotal(P,Q, Subtotal)}.

#maximize {Count : count(Count)}.
#minimize {Total: total(Total)}.

#show product/2.
#show total/1.
#show count/1.
