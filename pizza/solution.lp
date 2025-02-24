#program base.
#const n=2.
#const guests=5.

no(1..n).
qty(0..guests).

% GENERATE

{line(N,P,Q): no(N)} 2:- pizza(P), qty(Q).

% CONSTRAINTS - I don't want these!
:- line(N1, P1, Q1), line(N2, P2, Q2),
    P1 = P2,
    N1 != N2.
:- line(N1, P1, Q1), line(N2, P2, Q2),
    P1 != P2,
    N1 = N2.
:- line(N1, P1, Q1), line(N2, P2, Q2),
    P1 = P2,
    N1 = N2,
    Q1 != Q2.
:- line(_, _, Q), Q = 0.
:- line(N1, _, _), line(N2, _, _),
   N2 - N1 > 1.
:- not starts_at_1.
:- count(Count), Count < guests.

% FORMAT output

subtotal(P, Q, Subtotal) :-
    line(_, P, Q),
    cost(pizza(P), Cost),
    Subtotal = Q * Cost.

starts_at_1 :-
    1 {line(1, P, Q)} 1.

total(Total) :-
    Total = #sum{Subtotal, P: subtotal(P,Q, Subtotal)}.

count(Count) :-
    Count = #sum{Q, P: subtotal(P,Q, Subtotal)}.

#maximize {Count : count(Count)}.
#minimize {Total: total(Total)}.

#show subtotal/3.
#show total/1.
#show count/1.
