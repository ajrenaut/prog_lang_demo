Employee subclass: Commission [
        | sales rate minimumEarning |
        init [
                sales := 0.
                rate := 0.
                minimumEarning := 0.
                ^super init
        ]

        setSales: newSales [
                sales := newSales
        ]

        setRate: newRate [
                rate := newRate
        ]

        setMinimumEarning: newMin [
                minimumEarning := newMin
        ]


        getInfo [
                Transcript nextPutAll: 'Salaried Employee: '.
                firstName display.
                Transcript nextPutAll: ' '.
                lastName display.
                Transcript cr.

                Transcript nextPutAll: 'minimum salary: '.
                minimumEarning display.
                Transcript nextPutAll: ', sales amount: '.
                sales display.
                Transcript nextPutAll: ', commission rate: '.
                rate display.
                Transcript nextPutAll: '%'.
                Transcript cr.

                Transcript nextPutAll: 'earned $'.
                (self getEarning) display.
                Transcript cr
        ]

        getEarning [
                | earning |
                earning := (sales * rate).
                (minimumEarning > earning)
                        ifTrue: [ earning := minimumEarning ].
                ^earning
        ]
]
