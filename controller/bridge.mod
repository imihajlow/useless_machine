PCBNEW-LibModule-V1  Пн. 11 мая 2015 11:03:41
# encoding utf-8
Units mm
$INDEX
BH800
Bridge
$EndINDEX
$MODULE BH800
Po 0 0 0 15 554FB6EA 00000000 ~~
Li BH800
Sc 0
AR 
Op 0 0 0
T0 0 -5 1 1 0 0.15 N V 21 N "BH800"
T1 0 0 1 1 0 0.15 N V 21 N "Val**"
DS -7 -3 -11 -3 0.15 21
DS -11 -3 -11 3 0.15 21
DS -11 3 -7 3 0.15 21
DC 5 0 17 0 0.15 21
$PAD
Sh "1" C 1.2 1.2 0 0 0
Dr 0.8 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -10 0
$EndPAD
$PAD
Sh "2" C 1.2 1.2 0 0 0
Dr 0.8 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 10 0
$EndPAD
$EndMODULE BH800
$MODULE Bridge
Po 0 0 0 15 5550625A 00000000 ~~
Li Bridge
Sc 0
AR /554E3523
Op 0 0 0
T0 0 -1.27 1 1 0 0.15 N V 21 N "JP1"
T1 0 0 1 1 0 0.15 N V 21 N "Brigde"
DS -1.27 0 1.27 0 1 15
$PAD
Sh "1" R 1 1 0 0 0
Dr 0 0 0
At SMD N 00008000
Ne 1 "AGND"
Po -1.27 0
.LocalClearance 0.00001
.ZoneConnection 2
.ThermalWidth 0.00001
.ThermalGap 0.00001
$EndPAD
$PAD
Sh "2" R 1 1 0 0 0
Dr 0 0 0
At SMD N 00008000
Ne 2 "DGND"
Po 1.27 0
.LocalClearance 0.00001
.ZoneConnection 2
.ThermalWidth 0.0001
.ThermalGap 0.0001
$EndPAD
$EndMODULE Bridge
$EndLIBRARY
