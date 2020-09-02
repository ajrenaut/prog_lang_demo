payment(F, L, P) :- commission(F, L, Minimum, Sales, Rate),
        Sales*Rate > Minimum,
        P is Sales*Rate.

payment(F, L, P) :- commission(F, L, Minimum, Sales, Rate),
        Sales*Rate =< Minimum,
        P is Minimum.

payment(F, L, P) :- salaried(F, L, Salary),
        P is Salary.

payment(F, L, P) :- hourly(F, L, Hours, Rate),
        Hours > 50,
        P is ((((Hours-50)*2)+(10*1.5)+40)*Rate).

payment(F, L, P) :- hourly(F, L, Hours, Rate),
        Hours =< 50, Hours > 40,
        P is ((((Hours-40)*1.5)+40)*Rate).

payment(F, L, P) :- hourly(F, L, Hours, Rate),
        Hours =< 40,
        P is (Hours*Rate).
