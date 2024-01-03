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

[Command]
name = "fw"
command = F
time = 1

[Command]
name = "bw"
command = B
time = 1

[Command]
name = "up"
command = U
time = 1

[Command]
name = "dw"
command = D
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

[Command]
name = "holdx"
command = /$x
time = 1

[Command]
name = "holdy"
command = /$y
time = 1

[Command]
name = "holdb"
command = /$b
time = 1

[Command]
name = "start"
command = s
time = 1


;===========================================================================
;---------------------------------------------------------------------------

[Statedef -1]
;===========================================================================
;---------------------------------------------------------------------------

[State -1]
type = VelSet
triggerall = stateno = 1000 && pos X < 140
trigger1 = command = "fw" || command = "holdfwd"
x = fvar(9)

[State -1]
type = VelSet
triggerall = stateno = 1000 && pos X > -140
trigger1 = command = "bw" || command = "holdback"
x = -fvar(9)

[State -1]
type = PosAdd
triggerall = stateno = 1000 && pos y < 20
trigger1 = command = "dw" || command = "holddown"
y = fvar(9)

[State -1]
type = PosAdd
triggerall = stateno = 1000 && pos y > -180
trigger1 = command = "up" || command = "holdup"
y = -fvar(9)

;beam
[State -1]
type = varadd
v = 39
value = 1
triggerall = command = "holdx" && numhelper(700) = 0 && numhelper(800) = 0
trigger1 = stateno = 1000 && var(39) < 75

;shoot
[State -1]
type = ChangeState
value = 200
trigger1 = command = "x" && stateno = 1000 && numhelper(700) = 0 && numhelper(800) = 0
trigger2 = command = "holdx" && stateno = 1000 && var(39) < 2 && numhelper(700) = 0 && numhelper(800) = 0

;smart
[State -1]
type = ChangeState
trigger1 = command = "a" && stateno = 1000 && var(28) > 0 && numhelper(300) = 0
value = 300

;evade
[State -1]
type = ChangeState
value = 400
trigger1 = command = "y" && stateno = 1000

;beam_fx
[State -1]
type = Explod
triggerall = command = "holdx"
trigger1 = stateno = 1000 && var(39) = 75 && numexplod(253) = 0
anim = 253
ID = 253
pos = 0,-15
postype = p1
ontop = 1
ownpal = 1
bindtime = -1

[State -1, BEAM]
type = helper
triggerall = var(39) > 70
trigger1 = command != "holdx"
ID = 800
pos = 0,0
postype = p1
stateno = 800
helpertype = normal
name = "Beam"
ownpal = 1
keyctrl = 0

[State -1]
type = varset
v = 39
value = 0
trigger1 = command != "holdx"
