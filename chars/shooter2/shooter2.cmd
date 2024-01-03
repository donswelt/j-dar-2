; 6-Button_Pad_CMD

;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF";Required (do not remove)
command = F, F
time = 10

[Command]
name = "BB";Required (do not remove)
command = B, B
time = 10

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = a+b
time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup";Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;===========================================================================
;---------------------------------------------------------------------------

[Statedef -1]
;===========================================================================
;---------------------------------------------------------------------------

;DIFFICULTY_EASY
[State -1]
type = varSet
v = 17
value = 1
trigger1 = p2stateno = 12000

;DIFFICULTY_MEDIUM
[State -1]
type = varSet
v = 17
value = 0
trigger1 = p2stateno = 12010

;DIFFICULTY_HARD
[State -1]
type = varSet
v = 17
value = -1
trigger1 = p2stateno = 12020

[State -1]
type = NULL ;changestate
value = 10000
trigger1 = p2stateno = 1000

