EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "Mobile Ladebox mit Arduino Nano"
Date "2020-11-17"
Rev "2.6"
Comp "© kepppfeff (GitHub / GoingElectric.de)"
Comment1 "schwachen) 3,3-V-Spannungsregler sowie Stützkondensatoren an 5 V und 3,3 V."
Comment2 "ATmega328, eine USB-Schnittstelle (für Programmierung und Debugging), einen (sehr"
Comment3 "möglichst mit „low ESR“. Der Arduino Nano enthält unter anderem den Mikrocontroller"
Comment4 "Alle Widerstände min. ¼ W und 5 % oder genauer. Elektrolyt-Kondensatoren min. 16 V und"
$EndDescr
Text HLabel 6900 2200 2    50   Input ~ 0
CP
$Comp
L Ladebox-2-rescue:Arduino_Nano_v3.x-MCU_Module A?
U 1 1 5B80E62F
P 2900 5500
AR Path="/5B80E62F" Ref="A?"  Part="1" 
AR Path="/5B695976/5B80E62F" Ref="A1"  Part="1" 
F 0 "A1" H 2600 4550 50  0000 C CNN
F 1 "Arduino Nano" V 2900 5500 79  0000 C CNN
F 2 "Module:Arduino_Nano" H 3050 4550 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 2900 4500 50  0001 C CNN
	1    2900 5500
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:Opamp_Dual_Generic-Device U?
U 1 1 5B81166C
P 8950 1250
AR Path="/5B81166C" Ref="U?"  Part="1" 
AR Path="/5B695976/5B81166C" Ref="U2"  Part="1" 
F 0 "U2" H 8950 1617 50  0000 C CNN
F 1 "LM6132" H 8950 1526 50  0000 C CNN
F 2 "" H 8950 1250 50  0001 C CNN
F 3 "~" H 8950 1250 50  0001 C CNN
	1    8950 1250
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B811A6F
P 6400 2200
AR Path="/5B811A6F" Ref="R?"  Part="1" 
AR Path="/5B695976/5B811A6F" Ref="R10"  Part="1" 
F 0 "R10" V 6193 2200 50  0000 C CNN
F 1 "1k" V 6284 2200 50  0000 C CNN
F 2 "" V 6330 2200 50  0001 C CNN
F 3 "~" H 6400 2200 50  0001 C CNN
	1    6400 2200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5B812514
P 2700 850
F 0 "#PWR06" H 2700 600 50  0001 C CNN
F 1 "GND" H 2705 677 50  0000 C CNN
F 2 "" H 2700 850 50  0001 C CNN
F 3 "" H 2700 850 50  0001 C CNN
	1    2700 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 1250 6050 1350
Wire Wire Line
	7100 1550 7050 1550
Wire Wire Line
	7050 1550 7050 1750
Wire Wire Line
	7800 1750 7800 1450
Wire Wire Line
	7800 1450 7700 1450
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B81546E
P 7800 2050
AR Path="/5B81546E" Ref="R?"  Part="1" 
AR Path="/5B695976/5B81546E" Ref="R9"  Part="1" 
F 0 "R9" H 7870 2096 50  0000 L CNN
F 1 "120k" H 7870 2005 50  0000 L CNN
F 2 "" V 7730 2050 50  0001 C CNN
F 3 "~" H 7800 2050 50  0001 C CNN
	1    7800 2050
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B8154EE
P 7800 2550
AR Path="/5B8154EE" Ref="R?"  Part="1" 
AR Path="/5B695976/5B8154EE" Ref="R11"  Part="1" 
F 0 "R11" H 7870 2596 50  0000 L CNN
F 1 "68k" H 7870 2505 50  0000 L CNN
F 2 "" V 7730 2550 50  0001 C CNN
F 3 "~" H 7800 2550 50  0001 C CNN
	1    7800 2550
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:D_Schottky-Device D?
U 1 1 5B81559A
P 8200 2550
AR Path="/5B81559A" Ref="D?"  Part="1" 
AR Path="/5B695976/5B81559A" Ref="D5"  Part="1" 
F 0 "D5" V 8154 2629 50  0000 L CNN
F 1 "BAT85" V 8245 2629 50  0000 L CNN
F 2 "" H 8200 2550 50  0001 C CNN
F 3 "~" H 8200 2550 50  0001 C CNN
	1    8200 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	7800 1750 7800 1900
Connection ~ 7800 1750
$Comp
L power:GND #PWR022
U 1 1 5B8161FB
P 7800 2900
F 0 "#PWR022" H 7800 2650 50  0001 C CNN
F 1 "GND" H 7805 2727 50  0000 C CNN
F 2 "" H 7800 2900 50  0001 C CNN
F 3 "" H 7800 2900 50  0001 C CNN
	1    7800 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 2700 7800 2800
Wire Wire Line
	7800 2800 8200 2800
Wire Wire Line
	8200 2800 8200 2700
Connection ~ 7800 2800
Wire Wire Line
	7800 2800 7800 2900
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B817E28
P 8150 1750
AR Path="/5B817E28" Ref="R?"  Part="1" 
AR Path="/5B695976/5B817E28" Ref="R6"  Part="1" 
F 0 "R6" V 7943 1750 50  0000 C CNN
F 1 "220k" V 8034 1750 50  0000 C CNN
F 2 "" V 8080 1750 50  0001 C CNN
F 3 "~" H 8150 1750 50  0001 C CNN
	1    8150 1750
	0    1    1    0   
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B819012
P 8950 1750
AR Path="/5B819012" Ref="R?"  Part="1" 
AR Path="/5B695976/5B819012" Ref="R7"  Part="1" 
F 0 "R7" V 8743 1750 50  0000 C CNN
F 1 "82k" V 8834 1750 50  0000 C CNN
F 2 "" V 8880 1750 50  0001 C CNN
F 3 "~" H 8950 1750 50  0001 C CNN
	1    8950 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	8800 1750 8550 1750
Wire Wire Line
	8550 1350 8650 1350
Wire Wire Line
	9250 1250 9350 1250
Wire Wire Line
	9350 1250 9350 1750
Wire Wire Line
	9350 1750 9100 1750
$Comp
L Ladebox-2-rescue:D_Schottky-Device D?
U 1 1 5B819E33
P 8950 2200
AR Path="/5B819E33" Ref="D?"  Part="1" 
AR Path="/5B695976/5B819E33" Ref="D4"  Part="1" 
F 0 "D4" H 8950 1984 50  0000 C CNN
F 1 "BAT85" H 8950 2075 50  0000 C CNN
F 2 "" H 8950 2200 50  0001 C CNN
F 3 "~" H 8950 2200 50  0001 C CNN
	1    8950 2200
	-1   0    0    1   
$EndComp
Wire Wire Line
	8800 2200 8550 2200
Wire Wire Line
	9100 2200 9350 2200
Wire Wire Line
	9350 2200 9350 1750
Connection ~ 9350 1750
$Comp
L power:GND #PWR011
U 1 1 5B81AF83
P 8350 1200
F 0 "#PWR011" H 8350 950 50  0001 C CNN
F 1 "GND" H 8355 1027 50  0000 C CNN
F 2 "" H 8350 1200 50  0001 C CNN
F 3 "" H 8350 1200 50  0001 C CNN
	1    8350 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 5B825FF5
P 10850 900
F 0 "#PWR09" H 10850 750 50  0001 C CNN
F 1 "+5V" H 10865 1073 50  0000 C CNN
F 2 "" H 10850 900 50  0001 C CNN
F 3 "" H 10850 900 50  0001 C CNN
	1    10850 900 
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR05
U 1 1 5B8260EE
P 1700 850
F 0 "#PWR05" H 1700 700 50  0001 C CNN
F 1 "+12V" H 1715 1023 50  0000 C CNN
F 2 "" H 1700 850 50  0001 C CNN
F 3 "" H 1700 850 50  0001 C CNN
	1    1700 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 900  10850 1100
Wire Wire Line
	10850 1100 10700 1100
$Comp
L power:GND #PWR019
U 1 1 5B8294D4
P 2050 2100
F 0 "#PWR019" H 2050 1850 50  0001 C CNN
F 1 "GND" H 2055 1927 50  0000 C CNN
F 2 "" H 2050 2100 50  0001 C CNN
F 3 "" H 2050 2100 50  0001 C CNN
	1    2050 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5B82A583
P 10200 1600
F 0 "#PWR015" H 10200 1350 50  0001 C CNN
F 1 "GND" H 10205 1427 50  0000 C CNN
F 2 "" H 10200 1600 50  0001 C CNN
F 3 "" H 10200 1600 50  0001 C CNN
	1    10200 1600
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR08
U 1 1 5B82B74E
P 9600 900
F 0 "#PWR08" H 9600 750 50  0001 C CNN
F 1 "+12V" H 9615 1073 50  0000 C CNN
F 2 "" H 9600 900 50  0001 C CNN
F 3 "" H 9600 900 50  0001 C CNN
	1    9600 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 1100 9600 1100
Wire Wire Line
	9600 1100 9600 900 
Text HLabel 1100 950  0    50   Input ~ 0
+12V
Text HLabel 1100 1550 0    50   Input ~ 0
GND_PE
NoConn ~ 2800 4500
NoConn ~ 3400 4900
NoConn ~ 3400 5000
$Comp
L power:+5V #PWR025
U 1 1 5B835CBF
P 3100 4400
F 0 "#PWR025" H 3100 4250 50  0001 C CNN
F 1 "+5V" H 3115 4573 50  0000 C CNN
F 2 "" H 3100 4400 50  0001 C CNN
F 3 "" H 3100 4400 50  0001 C CNN
	1    3100 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 4400 3100 4500
$Comp
L power:GND #PWR037
U 1 1 5B837831
P 2950 6700
F 0 "#PWR037" H 2950 6450 50  0001 C CNN
F 1 "GND" H 2955 6527 50  0000 C CNN
F 2 "" H 2950 6700 50  0001 C CNN
F 3 "" H 2950 6700 50  0001 C CNN
	1    2950 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 6500 2900 6600
Wire Wire Line
	3000 6600 3000 6500
Wire Wire Line
	2950 6600 2950 6700
$Comp
L Ladebox-2-rescue:C-Device C?
U 1 1 5B6EA241
P 3950 1100
AR Path="/5B6EA241" Ref="C?"  Part="1" 
AR Path="/5B695976/5B6EA241" Ref="C2"  Part="1" 
F 0 "C2" H 4065 1146 50  0000 L CNN
F 1 "100n" H 4065 1055 50  0000 L CNN
F 2 "" H 3988 950 50  0001 C CNN
F 3 "~" H 3950 1100 50  0001 C CNN
	1    3950 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 1000 4400 900 
$Comp
L Ladebox-2-rescue:C-Device C?
U 1 1 5B6F2663
P 3950 1500
AR Path="/5B6F2663" Ref="C?"  Part="1" 
AR Path="/5B695976/5B6F2663" Ref="C5"  Part="1" 
F 0 "C5" H 4065 1546 50  0000 L CNN
F 1 "100n" H 4065 1455 50  0000 L CNN
F 2 "" H 3988 1350 50  0001 C CNN
F 3 "~" H 3950 1500 50  0001 C CNN
	1    3950 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 900  3950 950 
Text HLabel 5650 6700 2    50   Input ~ 0
Relais(-)
$Comp
L Ladebox-2-rescue:D-Device D?
U 1 1 5B7AC605
P 7900 5100
AR Path="/5B7AC605" Ref="D?"  Part="1" 
AR Path="/5B695976/5B7AC605" Ref="D16"  Part="1" 
F 0 "D16" V 7854 5179 50  0000 L CNN
F 1 "1N4007" V 7945 5179 50  0000 L CNN
F 2 "" H 7900 5100 50  0001 C CNN
F 3 "~" H 7900 5100 50  0001 C CNN
	1    7900 5100
	0    1    1    0   
$EndComp
Text HLabel 7050 6150 2    50   Input ~ 0
Verriegelung_A
Text HLabel 9250 6150 2    50   Input ~ 0
Verriegelung_B
$Comp
L Ladebox-2-rescue:LED-Device D?
U 1 1 5B84AB40
P 850 3450
AR Path="/5B84AB40" Ref="D?"  Part="1" 
AR Path="/5B695976/5B84AB40" Ref="D6"  Part="1" 
F 0 "D6" V 888 3333 50  0000 R CNN
F 1 "LED" V 797 3333 50  0000 R CNN
F 2 "" H 850 3450 50  0001 C CNN
F 3 "~" H 850 3450 50  0001 C CNN
	1    850  3450
	0    -1   -1   0   
$EndComp
$Comp
L Ladebox-2-rescue:LED-Device D?
U 1 1 5B84ACC5
P 1300 3450
AR Path="/5B84ACC5" Ref="D?"  Part="1" 
AR Path="/5B695976/5B84ACC5" Ref="D7"  Part="1" 
F 0 "D7" V 1338 3333 50  0000 R CNN
F 1 "LED" V 1247 3333 50  0000 R CNN
F 2 "" H 1300 3450 50  0001 C CNN
F 3 "~" H 1300 3450 50  0001 C CNN
	1    1300 3450
	0    -1   -1   0   
$EndComp
$Comp
L Ladebox-2-rescue:LED-Device D?
U 1 1 5B84AD2D
P 1750 3450
AR Path="/5B84AD2D" Ref="D?"  Part="1" 
AR Path="/5B695976/5B84AD2D" Ref="D8"  Part="1" 
F 0 "D8" V 1788 3333 50  0000 R CNN
F 1 "LED" V 1697 3333 50  0000 R CNN
F 2 "" H 1750 3450 50  0001 C CNN
F 3 "~" H 1750 3450 50  0001 C CNN
	1    1750 3450
	0    -1   -1   0   
$EndComp
$Comp
L Ladebox-2-rescue:LED-Device D?
U 1 1 5B84ADF1
P 2200 3450
AR Path="/5B84ADF1" Ref="D?"  Part="1" 
AR Path="/5B695976/5B84ADF1" Ref="D9"  Part="1" 
F 0 "D9" V 2238 3333 50  0000 R CNN
F 1 "LED" V 2147 3333 50  0000 R CNN
F 2 "" H 2200 3450 50  0001 C CNN
F 3 "~" H 2200 3450 50  0001 C CNN
	1    2200 3450
	0    -1   -1   0   
$EndComp
$Comp
L Ladebox-2-rescue:LED-Device D?
U 1 1 5B84AE5D
P 2650 3450
AR Path="/5B84AE5D" Ref="D?"  Part="1" 
AR Path="/5B695976/5B84AE5D" Ref="D10"  Part="1" 
F 0 "D10" V 2688 3333 50  0000 R CNN
F 1 "LED" V 2597 3333 50  0000 R CNN
F 2 "" H 2650 3450 50  0001 C CNN
F 3 "~" H 2650 3450 50  0001 C CNN
	1    2650 3450
	0    -1   -1   0   
$EndComp
$Comp
L Ladebox-2-rescue:LED-Device D?
U 1 1 5B84AEC7
P 3100 3450
AR Path="/5B84AEC7" Ref="D?"  Part="1" 
AR Path="/5B695976/5B84AEC7" Ref="D11"  Part="1" 
F 0 "D11" V 3138 3333 50  0000 R CNN
F 1 "LED" V 3047 3333 50  0000 R CNN
F 2 "" H 3100 3450 50  0001 C CNN
F 3 "~" H 3100 3450 50  0001 C CNN
	1    3100 3450
	0    -1   -1   0   
$EndComp
$Comp
L Ladebox-2-rescue:LED-Device D?
U 1 1 5B84AF37
P 3550 3450
AR Path="/5B84AF37" Ref="D?"  Part="1" 
AR Path="/5B695976/5B84AF37" Ref="D12"  Part="1" 
F 0 "D12" V 3588 3333 50  0000 R CNN
F 1 "LED" V 3497 3333 50  0000 R CNN
F 2 "" H 3550 3450 50  0001 C CNN
F 3 "~" H 3550 3450 50  0001 C CNN
	1    3550 3450
	0    -1   -1   0   
$EndComp
$Comp
L Ladebox-2-rescue:LED-Device D?
U 1 1 5B84AFA7
P 4000 3450
AR Path="/5B84AFA7" Ref="D?"  Part="1" 
AR Path="/5B695976/5B84AFA7" Ref="D13"  Part="1" 
F 0 "D13" V 4038 3333 50  0000 R CNN
F 1 "LED" V 3947 3333 50  0000 R CNN
F 2 "" H 4000 3450 50  0001 C CNN
F 3 "~" H 4000 3450 50  0001 C CNN
	1    4000 3450
	0    -1   -1   0   
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B84B080
P 850 3050
AR Path="/5B84B080" Ref="R?"  Part="1" 
AR Path="/5B695976/5B84B080" Ref="R12"  Part="1" 
F 0 "R12" H 920 3096 50  0000 L CNN
F 1 "150" H 920 3005 50  0000 L CNN
F 2 "" V 780 3050 50  0001 C CNN
F 3 "~" H 850 3050 50  0001 C CNN
	1    850  3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2900 4000 2800
Wire Wire Line
	850  2800 850  2900
Wire Wire Line
	1300 2900 1300 2800
Connection ~ 1300 2800
Wire Wire Line
	1300 2800 850  2800
Wire Wire Line
	1750 2900 1750 2800
Wire Wire Line
	1300 2800 1750 2800
Wire Wire Line
	2200 2900 2200 2800
Wire Wire Line
	1750 2800 2200 2800
Wire Wire Line
	2650 2900 2650 2800
Wire Wire Line
	2200 2800 2650 2800
Connection ~ 2650 2800
Wire Wire Line
	3100 2900 3100 2800
Wire Wire Line
	2650 2800 3100 2800
Connection ~ 3100 2800
Wire Wire Line
	3550 2900 3550 2800
Wire Wire Line
	3100 2800 3550 2800
Connection ~ 3550 2800
Wire Wire Line
	3550 2800 4000 2800
Wire Wire Line
	850  3200 850  3300
Wire Wire Line
	1300 3200 1300 3300
Wire Wire Line
	1750 3200 1750 3300
Wire Wire Line
	2200 3200 2200 3300
Wire Wire Line
	2650 3200 2650 3300
Wire Wire Line
	3100 3200 3100 3300
Wire Wire Line
	3550 3200 3550 3300
Wire Wire Line
	4000 3200 4000 3300
Entry Wire Line
	850  3950 950  4050
Entry Wire Line
	1300 3950 1400 4050
Entry Wire Line
	1750 3950 1850 4050
Entry Wire Line
	2200 3950 2300 4050
Entry Wire Line
	2650 3950 2750 4050
Entry Wire Line
	3100 3950 3200 4050
Entry Wire Line
	3550 3950 3650 4050
Entry Wire Line
	4000 3950 4100 4050
Entry Wire Line
	3900 6950 4000 7050
Entry Wire Line
	3900 5200 4000 5300
Entry Wire Line
	3900 5350 4000 5450
NoConn ~ 3400 5300
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B8458A1
P 4400 4650
AR Path="/5B8458A1" Ref="R?"  Part="1" 
AR Path="/5B695976/5B8458A1" Ref="R20"  Part="1" 
F 0 "R20" H 4470 4696 50  0000 L CNN
F 1 "1k" H 4470 4605 50  0000 L CNN
F 2 "" V 4330 4650 50  0001 C CNN
F 3 "~" H 4400 4650 50  0001 C CNN
	1    4400 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR026
U 1 1 5B845943
P 4400 4400
F 0 "#PWR026" H 4400 4250 50  0001 C CNN
F 1 "+5V" H 4415 4573 50  0000 C CNN
F 2 "" H 4400 4400 50  0001 C CNN
F 3 "" H 4400 4400 50  0001 C CNN
	1    4400 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4500 4400 4400
Text HLabel 4550 5050 2    50   Input ~ 0
PP
Text Label 850  3900 0    50   ~ 0
A4
Text Label 1300 3900 0    50   ~ 0
A5
Text Label 1750 3900 0    50   ~ 0
D2
Text Label 2200 3900 0    50   ~ 0
D3
Text Label 2650 3900 0    50   ~ 0
D4
Text Label 3100 3900 0    50   ~ 0
D11
Text Label 3550 3900 0    50   ~ 0
D12
NoConn ~ 2400 4900
NoConn ~ 2400 5000
Wire Wire Line
	850  3950 850  3600
Wire Wire Line
	1300 3950 1300 3600
Wire Wire Line
	1750 3950 1750 3600
Wire Wire Line
	2200 3950 2200 3600
Wire Wire Line
	2650 3950 2650 3600
Wire Wire Line
	3100 3950 3100 3600
Wire Wire Line
	3550 3950 3550 3600
Wire Wire Line
	4400 1600 4400 1700
Wire Wire Line
	3950 1650 3950 1700
Text Label 4050 5300 0    50   ~ 0
D8
Text Label 4050 5450 0    50   ~ 0
D7
Text Label 4050 7050 0    50   ~ 0
A3
Wire Wire Line
	8200 2300 8200 2400
Wire Wire Line
	7800 2300 7800 2400
Wire Wire Line
	7800 2200 7800 2300
Connection ~ 7800 2300
Wire Wire Line
	7800 2300 8200 2300
Wire Wire Line
	7800 2300 7400 2300
Wire Wire Line
	7400 2300 7400 3950
Text Notes 7550 3650 0    79   ~ 0
Messung posi-\ntiver Span-\nnungen an CP
Entry Wire Line
	7300 4050 7400 3950
Entry Wire Line
	8750 4050 8850 3950
Text Label 7400 3900 0    50   ~ 0
A6
Text Label 8850 3900 0    50   ~ 0
A7
Text Notes 5250 3550 0    79   ~ 0
Ausgabe\ndes ±12 V\nPWM-Signals\nam CP-Pin
$Comp
L Switch:SW_Push SW2
U 1 1 5BB1726B
P 1400 4650
F 0 "SW2" V 1354 4798 50  0000 L CNN
F 1 "START" V 1445 4798 50  0000 L CNN
F 2 "" H 1400 4850 50  0001 C CNN
F 3 "" H 1400 4850 50  0001 C CNN
	1    1400 4650
	0    1    1    0   
$EndComp
$Comp
L Switch:SW_Push SW1
U 1 1 5BB1741F
P 850 4650
F 0 "SW1" V 804 4798 50  0000 L CNN
F 1 "STROM" V 895 4798 50  0000 L CNN
F 2 "" H 850 4850 50  0001 C CNN
F 3 "" H 850 4850 50  0001 C CNN
	1    850  4650
	0    1    1    0   
$EndComp
Entry Wire Line
	1900 5000 2000 5100
Entry Wire Line
	1900 5100 2000 5200
Entry Wire Line
	1900 5200 2000 5300
Entry Wire Line
	1900 5300 2000 5400
Entry Wire Line
	1900 5400 2000 5500
Entry Wire Line
	1900 5500 2000 5600
Entry Wire Line
	1900 5600 2000 5700
Entry Wire Line
	1900 5700 2000 5800
Entry Wire Line
	1900 5800 2000 5900
Entry Wire Line
	1900 5900 2000 6000
Entry Wire Line
	1900 6100 2000 6200
Entry Wire Line
	4000 4900 3900 4800
Text Label 5100 3900 0    50   ~ 0
D5
Wire Wire Line
	2000 5100 2400 5100
Wire Wire Line
	2400 5200 2000 5200
Wire Wire Line
	2000 5300 2400 5300
Wire Wire Line
	2000 5400 2400 5400
Wire Wire Line
	2000 5500 2400 5500
Wire Wire Line
	2000 5600 2400 5600
Wire Wire Line
	2000 5700 2400 5700
Wire Wire Line
	2000 5800 2400 5800
Wire Wire Line
	2000 5900 2400 5900
Wire Wire Line
	2000 6000 2400 6000
Wire Wire Line
	2000 6100 2400 6100
Text Label 2050 5100 0    50   ~ 0
D2
Text Label 2050 5200 0    50   ~ 0
D3
Text Label 2050 5400 0    50   ~ 0
D5
Text Label 2050 5500 0    50   ~ 0
D6
Text Label 2050 5600 0    50   ~ 0
D7
Text Label 2050 5700 0    50   ~ 0
D8
Text Label 2050 5800 0    50   ~ 0
D9
Text Label 2050 5900 0    50   ~ 0
D10
Text Label 2050 6000 0    50   ~ 0
D11
Text Label 2050 6100 0    50   ~ 0
D12
Entry Wire Line
	3800 5700 3900 5600
Entry Wire Line
	3800 5800 3900 5700
Entry Wire Line
	3800 5900 3900 5800
Entry Wire Line
	3800 6000 3900 5900
Entry Wire Line
	3800 6100 3900 6000
Entry Wire Line
	3800 6200 3900 6100
Wire Wire Line
	3400 5700 3800 5700
Wire Wire Line
	3800 5800 3400 5800
Wire Wire Line
	3400 5900 3800 5900
Wire Wire Line
	3800 6000 3400 6000
Wire Wire Line
	3400 6100 3800 6100
Wire Wire Line
	3800 6200 3400 6200
Text Label 3750 5500 2    50   ~ 0
A0
Text Label 3750 5700 2    50   ~ 0
A2
Text Label 3750 5800 2    50   ~ 0
A3
Text Label 3750 5900 2    50   ~ 0
A4
Text Label 3750 6000 2    50   ~ 0
A5
Text Label 3750 6100 2    50   ~ 0
A6
Wire Wire Line
	850  6850 1800 6850
Entry Wire Line
	1400 4150 1500 4050
Entry Wire Line
	850  4150 950  4050
Text Label 1400 4300 0    50   ~ 0
D10
Text Label 850  4300 0    50   ~ 0
D9
$Comp
L power:GND #PWR030
U 1 1 5BCD21B6
P 850 4950
F 0 "#PWR030" H 850 4700 50  0001 C CNN
F 1 "GND" H 855 4777 50  0000 C CNN
F 2 "" H 850 4950 50  0001 C CNN
F 3 "" H 850 4950 50  0001 C CNN
	1    850  4950
	1    0    0    -1  
$EndComp
Entry Wire Line
	1900 6750 1800 6850
Text Label 4050 6200 0    50   ~ 0
D6
$Comp
L power:+5V #PWR020
U 1 1 5BCEE4C9
P 850 2700
F 0 "#PWR020" H 850 2550 50  0001 C CNN
F 1 "+5V" H 865 2873 50  0000 C CNN
F 2 "" H 850 2700 50  0001 C CNN
F 3 "" H 850 2700 50  0001 C CNN
	1    850  2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  2700 850  2800
Text Notes 4750 6450 0    79   ~ 0
Erkennt,\nob die Typ2-\nSteckdose\nverriegelt ist.
Text Label 3750 6200 2    50   ~ 0
A7
Entry Wire Line
	3800 5500 3900 5400
Wire Wire Line
	3400 5500 3800 5500
Text Notes 5600 5000 2    79   ~ 0
Messung des\nCodier-Wider-\nstandes im\nTyp2-Stecker\nmittels Span-\nnungsteiler
Entry Wire Line
	5000 4050 5100 3950
Text Label 4050 4900 0    50   ~ 0
A0
Text Notes 1700 5900 2    79   ~ 0
Taster werden\nüber interne\nPull-Up-Wider-\nstände des AT-\nmega betrieben
$Comp
L power:GND #PWR031
U 1 1 5C00A6C7
P 1400 4950
F 0 "#PWR031" H 1400 4700 50  0001 C CNN
F 1 "GND" H 1405 4777 50  0000 C CNN
F 2 "" H 1400 4950 50  0001 C CNN
F 3 "" H 1400 4950 50  0001 C CNN
	1    1400 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  4950 850  4850
Wire Wire Line
	1400 4950 1400 4850
$Comp
L Ladebox-2-rescue:CP-Device C?
U 1 1 5B6D449D
P 2600 1650
AR Path="/5B6D449D" Ref="C?"  Part="1" 
AR Path="/5B695976/5B6D449D" Ref="C6"  Part="1" 
F 0 "C6" H 2718 1696 50  0000 L CNN
F 1 "22μ" H 2718 1605 50  0000 L CNN
F 2 "" H 2638 1500 50  0001 C CNN
F 3 "~" H 2600 1650 50  0001 C CNN
	1    2600 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 1450 2600 1450
Wire Wire Line
	2600 1450 2600 1500
Wire Wire Line
	2600 1800 2600 1850
Wire Wire Line
	2600 1850 2450 1850
$Comp
L Ladebox-2-rescue:CP-Device C?
U 1 1 5B6F15A2
P 3000 1000
AR Path="/5B6F15A2" Ref="C?"  Part="1" 
AR Path="/5B695976/5B6F15A2" Ref="C1"  Part="1" 
F 0 "C1" H 3118 1046 50  0000 L CNN
F 1 "22μ" H 3118 955 50  0000 L CNN
F 2 "" H 3038 850 50  0001 C CNN
F 3 "~" H 3000 1000 50  0001 C CNN
	1    3000 1000
	1    0    0    -1  
$EndComp
NoConn ~ 1650 1550
Wire Wire Line
	2050 2100 2050 2050
NoConn ~ 1650 1250
Wire Wire Line
	3000 750  3000 850 
$Comp
L power:+12V #PWR07
U 1 1 5B7DB8A5
P 4200 850
F 0 "#PWR07" H 4200 700 50  0001 C CNN
F 1 "+12V" H 4215 1023 50  0000 C CNN
F 2 "" H 4200 850 50  0001 C CNN
F 3 "" H 4200 850 50  0001 C CNN
	1    4200 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 850  4200 900 
$Comp
L power:-12V #PWR013
U 1 1 5B7EBAEA
P 3000 1350
F 0 "#PWR013" H 3000 1450 50  0001 C CNN
F 1 "-12V" H 3015 1523 50  0000 C CNN
F 2 "" H 3000 1350 50  0001 C CNN
F 3 "" H 3000 1350 50  0001 C CNN
	1    3000 1350
	-1   0    0    1   
$EndComp
Wire Wire Line
	3950 1250 3950 1300
Wire Wire Line
	2700 750  2700 850 
$Comp
L power:+12V #PWR012
U 1 1 5B7EBD3F
P 6050 1250
F 0 "#PWR012" H 6050 1100 50  0001 C CNN
F 1 "+12V" H 6065 1423 50  0000 C CNN
F 2 "" H 6050 1250 50  0001 C CNN
F 3 "" H 6050 1250 50  0001 C CNN
	1    6050 1250
	1    0    0    -1  
$EndComp
$Comp
L power:-12V #PWR018
U 1 1 5B8260E7
P 4200 1750
F 0 "#PWR018" H 4200 1850 50  0001 C CNN
F 1 "-12V" H 4215 1923 50  0000 C CNN
F 2 "" H 4200 1750 50  0001 C CNN
F 3 "" H 4200 1750 50  0001 C CNN
	1    4200 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	4200 1750 4200 1700
Wire Wire Line
	3000 1150 3000 1250
Wire Wire Line
	2450 1250 3000 1250
Connection ~ 3000 1250
Wire Wire Line
	3000 1250 3000 1350
Wire Wire Line
	3000 750  2700 750 
Wire Wire Line
	1400 4150 1400 4450
Wire Wire Line
	850  4150 850  4450
$Comp
L power:GND #PWR014
U 1 1 5BCFC4AF
P 3650 1350
F 0 "#PWR014" H 3650 1100 50  0001 C CNN
F 1 "GND" H 3655 1177 50  0000 C CNN
F 2 "" H 3650 1350 50  0001 C CNN
F 3 "" H 3650 1350 50  0001 C CNN
	1    3650 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1300 3650 1300
Connection ~ 3950 1300
Wire Wire Line
	3950 1300 3950 1350
Wire Wire Line
	6900 3450 6900 3550
$Comp
L Comparator:LM393 U4
U 1 1 5B782705
P 5150 2150
F 0 "U4" H 5150 2517 50  0000 C CNN
F 1 "LM393" H 5150 2426 50  0000 C CNN
F 2 "" H 5150 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm393-n.pdf" H 5150 2150 50  0001 C CNN
	1    5150 2150
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B7841D4
P 5550 1300
AR Path="/5B7841D4" Ref="R?"  Part="1" 
AR Path="/5B695976/5B7841D4" Ref="R4"  Part="1" 
F 0 "R4" H 5620 1346 50  0000 L CNN
F 1 "1k" H 5620 1255 50  0000 L CNN
F 2 "" V 5480 1300 50  0001 C CNN
F 3 "~" H 5550 1300 50  0001 C CNN
	1    5550 1300
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B7842D4
P 5550 1800
AR Path="/5B7842D4" Ref="R?"  Part="1" 
AR Path="/5B695976/5B7842D4" Ref="R8"  Part="1" 
F 0 "R8" H 5620 1846 50  0000 L CNN
F 1 "22k" H 5620 1755 50  0000 L CNN
F 2 "" V 5480 1800 50  0001 C CNN
F 3 "~" H 5550 1800 50  0001 C CNN
	1    5550 1800
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR010
U 1 1 5B8B1007
P 5550 1050
F 0 "#PWR010" H 5550 900 50  0001 C CNN
F 1 "+12V" H 5565 1223 50  0000 C CNN
F 2 "" H 5550 1050 50  0001 C CNN
F 3 "" H 5550 1050 50  0001 C CNN
	1    5550 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 1050 5550 1150
Wire Wire Line
	4550 5050 4400 5050
Wire Wire Line
	4850 2050 4550 2050
Wire Wire Line
	8000 1750 7800 1750
Wire Wire Line
	8300 1750 8550 1750
Connection ~ 8550 1750
Wire Wire Line
	8550 1750 8550 1350
Wire Wire Line
	8350 1150 8350 1200
Wire Wire Line
	8350 1150 8650 1150
Wire Wire Line
	8550 1750 8550 2200
Text Notes 7750 900  2    79   ~ 0
Spannungsfolger
Text Notes 9250 2850 2    79   ~ 0
Messung\nnegativer\nSpannun-\ngen an CP
Wire Wire Line
	3950 900  4200 900 
Wire Wire Line
	3950 1700 4200 1700
$Comp
L Ladebox-2-rescue:C-Device C?
U 1 1 5CB1FA6A
P 6500 3150
AR Path="/5CB1FA6A" Ref="C?"  Part="1" 
AR Path="/5B695976/5CB1FA6A" Ref="C7"  Part="1" 
F 0 "C7" H 6615 3196 50  0000 L CNN
F 1 "100n" H 6615 3105 50  0000 L CNN
F 2 "" H 6538 3000 50  0001 C CNN
F 3 "~" H 6500 3150 50  0001 C CNN
	1    6500 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3300 6500 3550
Wire Wire Line
	6500 2750 6700 2750
Wire Wire Line
	6500 3550 6700 3550
Wire Wire Line
	6500 2750 6500 3000
Connection ~ 4200 1700
Wire Wire Line
	4200 1700 4400 1700
Connection ~ 4200 900 
Wire Wire Line
	4200 900  4400 900 
$Comp
L power:+12V #PWR021
U 1 1 5CC4CD51
P 6700 2700
F 0 "#PWR021" H 6700 2550 50  0001 C CNN
F 1 "+12V" H 6715 2873 50  0000 C CNN
F 2 "" H 6700 2700 50  0001 C CNN
F 3 "" H 6700 2700 50  0001 C CNN
	1    6700 2700
	1    0    0    -1  
$EndComp
$Comp
L power:-12V #PWR024
U 1 1 5CC4CDEA
P 6700 3600
F 0 "#PWR024" H 6700 3700 50  0001 C CNN
F 1 "-12V" H 6715 3773 50  0000 C CNN
F 2 "" H 6700 3600 50  0001 C CNN
F 3 "" H 6700 3600 50  0001 C CNN
	1    6700 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	6700 3600 6700 3550
Connection ~ 6700 3550
Wire Wire Line
	6700 3550 6900 3550
Wire Wire Line
	6700 2750 6700 2700
Connection ~ 6700 2750
Wire Wire Line
	6700 2750 6900 2750
Wire Wire Line
	3650 1300 3650 1350
Text Notes 10950 3850 2    79   ~ 0
Steckerverriegelung\nwird nicht direkt vom\nNetzteil, sondern\nüber großen\nKondensator\nmit Konstant-\nstrom-Lade-\nschaltung\nversorgt.
Text Notes 1200 2650 0    79   ~ 0
Acht grüne LEDs kreisförmig um Typ2-Dose
Text Notes 3450 2300 2    79   ~ 0
Ladungs-\npumpe für\nnegative\nSpannung
Text Notes 8700 900  2    79   ~ 0
Invertierer
Text HLabel 1000 6350 2    50   Input ~ 0
Wahlschalter
$Comp
L power:GND #PWR038
U 1 1 5B914B81
P 4400 6700
F 0 "#PWR038" H 4400 6450 50  0001 C CNN
F 1 "GND" H 4405 6527 50  0000 C CNN
F 2 "" H 4400 6700 50  0001 C CNN
F 3 "" H 4400 6700 50  0001 C CNN
	1    4400 6700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4550 5700 4400 5700
Wire Wire Line
	4400 5700 4400 5800
Wire Wire Line
	4400 6600 4400 6700
Wire Wire Line
	4400 6200 4000 6200
Entry Wire Line
	3900 6100 4000 6200
Text Label 1750 6850 2    50   ~ 0
A2
Text Notes 2150 7500 2    79   ~ 0
Erkennt, in\nwelcher Stel-\nlung sich der\nSchalter befindet.
Wire Wire Line
	4000 7050 4700 7050
Wire Wire Line
	6050 2700 5950 2700
Wire Wire Line
	5350 2600 5100 2600
Wire Wire Line
	5100 2600 5100 3950
$Comp
L power:GND #PWR040
U 1 1 5BDCC3F8
P 5500 7350
F 0 "#PWR040" H 5500 7100 50  0001 C CNN
F 1 "GND" H 5505 7177 50  0000 C CNN
F 2 "" H 5500 7350 50  0001 C CNN
F 3 "" H 5500 7350 50  0001 C CNN
	1    5500 7350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5500 7250 5500 7350
Text HLabel 4550 5700 2    50   Input ~ 0
Verriegelung_Kontakt
Wire Wire Line
	4550 2050 4550 2800
NoConn ~ 1650 1750
$Comp
L Ladebox-2-rescue:CP-Device C?
U 1 1 5BCEE881
P 1250 1250
AR Path="/5BCEE881" Ref="C?"  Part="1" 
AR Path="/5B695976/5BCEE881" Ref="C3"  Part="1" 
F 0 "C3" H 1368 1296 50  0000 L CNN
F 1 "22μ" H 1368 1205 50  0000 L CNN
F 2 "" H 1288 1100 50  0001 C CNN
F 3 "~" H 1250 1250 50  0001 C CNN
	1    1250 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 850  1700 950 
$Comp
L power:GND #PWR017
U 1 1 5BD18717
P 1250 1650
F 0 "#PWR017" H 1250 1400 50  0001 C CNN
F 1 "GND" H 1255 1477 50  0000 C CNN
F 2 "" H 1250 1650 50  0001 C CNN
F 3 "" H 1250 1650 50  0001 C CNN
	1    1250 1650
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:CP-Device C?
U 1 1 5BC3D2A9
P 10700 1350
AR Path="/5BC3D2A9" Ref="C?"  Part="1" 
AR Path="/5B695976/5BC3D2A9" Ref="C4"  Part="1" 
F 0 "C4" H 10818 1396 50  0000 L CNN
F 1 "22μ" H 10818 1305 50  0000 L CNN
F 2 "" H 10738 1200 50  0001 C CNN
F 3 "~" H 10700 1350 50  0001 C CNN
	1    10700 1350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5BC3D417
P 10700 1600
F 0 "#PWR016" H 10700 1350 50  0001 C CNN
F 1 "GND" H 10705 1427 50  0000 C CNN
F 2 "" H 10700 1600 50  0001 C CNN
F 3 "" H 10700 1600 50  0001 C CNN
	1    10700 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 1200 10700 1100
Wire Wire Line
	10700 1600 10700 1500
Entry Wire Line
	1900 4250 2000 4350
Wire Wire Line
	3000 4350 3000 4500
Text Label 2050 4350 0    50   ~ 0
+3,3V
Entry Wire Line
	4600 4050 4700 3950
Text Label 4700 3900 0    50   ~ 0
+3,3V
Wire Wire Line
	4700 2800 4700 3950
Text Label 4000 3900 0    50   ~ 0
D13
Wire Wire Line
	4000 3950 4000 3600
Entry Wire Line
	1900 6000 2000 6100
Wire Wire Line
	2400 6200 2000 6200
Text Label 2050 6200 0    50   ~ 0
D13
$Comp
L Ladebox-2-rescue:Q_NPN_CBE-Device Q?
U 1 1 5BC4CD0B
P 5400 7050
AR Path="/5BC4CD0B" Ref="Q?"  Part="1" 
AR Path="/5B695976/5BC4CD0B" Ref="Q6"  Part="1" 
F 0 "Q6" H 5591 7096 50  0000 L CNN
F 1 "BC337-40" H 5591 7005 50  0000 L CNN
F 2 "" H 5600 7150 50  0001 C CNN
F 3 "~" H 5400 7050 50  0001 C CNN
	1    5400 7050
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:Q_PNP_CBE-Device Q?
U 1 1 5BC9049E
P 5950 1550
AR Path="/5BC9049E" Ref="Q?"  Part="1" 
AR Path="/5B695976/5BC9049E" Ref="Q1"  Part="1" 
F 0 "Q1" H 6141 1504 50  0000 L CNN
F 1 "BC557B" H 6141 1595 50  0000 L CNN
F 2 "" H 6150 1650 50  0001 C CNN
F 3 "~" H 5950 1550 50  0001 C CNN
	1    5950 1550
	1    0    0    1   
$EndComp
Entry Bus Bus
	1900 4150 2000 4050
Entry Bus Bus
	3900 4150 4000 4050
Wire Wire Line
	2000 4350 3000 4350
Wire Wire Line
	5550 1450 5550 1550
Wire Wire Line
	5750 1550 5550 1550
Connection ~ 5550 1550
Wire Wire Line
	5550 1550 5550 1650
Wire Wire Line
	5550 1950 5550 2150
Wire Wire Line
	5450 2150 5550 2150
Wire Wire Line
	4550 2800 4700 2800
Wire Wire Line
	4750 2250 4750 2600
Wire Wire Line
	4750 2250 4850 2250
Wire Wire Line
	1250 950  1250 1100
Wire Wire Line
	2050 950  2050 1050
Wire Wire Line
	1700 950  2050 950 
Connection ~ 1700 950 
Connection ~ 1750 2800
Connection ~ 2200 2800
Wire Wire Line
	6900 2750 6900 2850
Wire Wire Line
	5500 6700 5650 6700
Connection ~ 10700 1100
Wire Wire Line
	10700 1100 10500 1100
Text Label 2050 5300 0    50   ~ 0
D4
Text Notes 5300 7500 2    79   ~ 0
Schaltet die Strom-\nzufuhr zum E-Auto
$Comp
L Ladebox:TC7662BxPA U3
U 1 1 5BE86A45
P 2050 1550
F 0 "U3" H 1750 1050 50  0000 C CNN
F 1 "ICL7660A" H 2400 1050 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 2150 1450 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21469a.pdf" H 2150 1450 50  0001 C CNN
	1    2050 1550
	1    0    0    -1  
$EndComp
Connection ~ 6050 2200
Wire Wire Line
	6050 2200 6050 2700
Wire Wire Line
	6050 1750 6050 2200
Wire Wire Line
	6250 2200 6050 2200
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5C119200
P 6700 1750
AR Path="/5C119200" Ref="R?"  Part="1" 
AR Path="/5B695976/5C119200" Ref="R5"  Part="1" 
F 0 "R5" H 6770 1796 50  0000 L CNN
F 1 "4,7k" H 6770 1705 50  0000 L CNN
F 2 "" V 6630 1750 50  0001 C CNN
F 3 "~" H 6700 1750 50  0001 C CNN
	1    6700 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2200 6700 2200
Wire Wire Line
	6700 1350 6700 1600
Wire Wire Line
	6700 1350 7100 1350
Wire Wire Line
	6700 1900 6700 2200
Connection ~ 6700 2200
Wire Wire Line
	6700 2200 6900 2200
Wire Wire Line
	1100 950  1250 950 
Wire Wire Line
	1100 1550 1250 1550
Wire Wire Line
	1250 1400 1250 1550
Wire Wire Line
	1250 1550 1250 1650
Connection ~ 1250 950 
Connection ~ 1250 1550
Wire Wire Line
	1250 950  1700 950 
Connection ~ 850  2800
Wire Wire Line
	10200 1400 10200 1600
Connection ~ 5100 2600
Wire Wire Line
	5100 2600 4750 2600
Connection ~ 4700 2800
Wire Wire Line
	4700 2800 5350 2800
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5CC50F64
P 4850 7050
AR Path="/5CC50F64" Ref="R?"  Part="1" 
AR Path="/5B695976/5CC50F64" Ref="R30"  Part="1" 
F 0 "R30" V 4643 7050 50  0000 C CNN
F 1 "4,7k" V 4734 7050 50  0000 C CNN
F 2 "" V 4780 7050 50  0001 C CNN
F 3 "~" H 4850 7050 50  0001 C CNN
	1    4850 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	2900 6600 2950 6600
Connection ~ 2950 6600
Wire Wire Line
	2950 6600 3000 6600
Wire Wire Line
	4000 4900 4400 4900
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5CEE7319
P 4400 5950
AR Path="/5CEE7319" Ref="R?"  Part="1" 
AR Path="/5B695976/5CEE7319" Ref="R26"  Part="1" 
F 0 "R26" H 4470 5996 50  0000 L CNN
F 1 "120k" H 4470 5905 50  0000 L CNN
F 2 "" V 4330 5950 50  0001 C CNN
F 3 "~" H 4400 5950 50  0001 C CNN
	1    4400 5950
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5CEE74D8
P 4400 6450
AR Path="/5CEE74D8" Ref="R?"  Part="1" 
AR Path="/5B695976/5CEE74D8" Ref="R28"  Part="1" 
F 0 "R28" H 4470 6496 50  0000 L CNN
F 1 "68k" H 4470 6405 50  0000 L CNN
F 2 "" V 4330 6450 50  0001 C CNN
F 3 "~" H 4400 6450 50  0001 C CNN
	1    4400 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 3950 8850 3500
Wire Wire Line
	8850 3500 9350 3000
Wire Wire Line
	9350 3000 9350 2200
Connection ~ 9350 2200
Wire Wire Line
	4400 4800 4400 4900
Connection ~ 4400 4900
Wire Wire Line
	4400 4900 4400 5050
Wire Wire Line
	4400 6100 4400 6200
Connection ~ 4400 6200
Wire Wire Line
	4400 6200 4400 6300
$Comp
L Ladebox-2-rescue:Q_NPN_CBE-Device Q?
U 1 1 5BDD365B
P 6300 6350
AR Path="/5BDD365B" Ref="Q?"  Part="1" 
AR Path="/5B695976/5BDD365B" Ref="Q5"  Part="1" 
F 0 "Q5" H 6491 6396 50  0000 L CNN
F 1 "BC547C" H 6491 6305 50  0000 L CNN
F 2 "" H 6500 6450 50  0001 C CNN
F 3 "~" H 6300 6350 50  0001 C CNN
	1    6300 6350
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:Q_NPN_CBE-Device Q?
U 1 1 5BDD3729
P 8350 5900
AR Path="/5BDD3729" Ref="Q?"  Part="1" 
AR Path="/5B695976/5BDD3729" Ref="Q4"  Part="1" 
F 0 "Q4" H 8541 5946 50  0000 L CNN
F 1 "BC547C" H 8541 5855 50  0000 L CNN
F 2 "" H 8550 6000 50  0001 C CNN
F 3 "~" H 8350 5900 50  0001 C CNN
	1    8350 5900
	1    0    0    -1  
$EndComp
$Comp
L Ladebox:Relay R23
U 1 1 5BDD3BB7
P 8650 5100
F 0 "R23" H 9050 5275 50  0000 L CNN
F 1 "Relais" H 9050 5175 60  0000 L CNN
F 2 "" H 8650 5100 60  0001 C CNN
F 3 "" H 8650 5100 60  0001 C CNN
F 4 "Spule: 12 V/DC" H 9050 4925 45  0000 L CNN "Spannung"
F 5 "min. 5 A" H 9050 5050 60  0000 L CNN "Schaltstrom"
	1    8650 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 4700 8450 4600
Wire Wire Line
	8450 4600 7900 4600
Wire Wire Line
	7900 4600 7900 4950
Wire Wire Line
	7900 5250 7900 5600
Wire Wire Line
	8450 5600 8450 5500
Wire Wire Line
	8450 5700 8450 5600
Wire Wire Line
	6550 4600 6550 4500
Wire Wire Line
	6550 4500 6000 4500
Wire Wire Line
	6000 4500 6000 4850
Wire Wire Line
	6000 5150 6000 5500
Wire Wire Line
	6550 5500 6550 5400
Connection ~ 8450 5600
Wire Wire Line
	7900 5600 8450 5600
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5BEC8376
P 7700 5900
AR Path="/5BEC8376" Ref="R?"  Part="1" 
AR Path="/5B695976/5BEC8376" Ref="R25"  Part="1" 
F 0 "R25" V 7493 5900 50  0000 C CNN
F 1 "22k" V 7584 5900 50  0000 C CNN
F 2 "" V 7630 5900 50  0001 C CNN
F 3 "~" H 7700 5900 50  0001 C CNN
	1    7700 5900
	0    1    1    0   
$EndComp
Wire Wire Line
	9250 6150 9100 6150
Wire Wire Line
	9100 6150 9100 5800
$Comp
L power:GND #PWR036
U 1 1 5BF45E3F
P 6400 6650
F 0 "#PWR036" H 6400 6400 50  0001 C CNN
F 1 "GND" H 6405 6477 50  0000 C CNN
F 2 "" H 6400 6650 50  0001 C CNN
F 3 "" H 6400 6650 50  0001 C CNN
	1    6400 6650
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR035
U 1 1 5BF45ECE
P 8450 6200
F 0 "#PWR035" H 8450 5950 50  0001 C CNN
F 1 "GND" H 8455 6027 50  0000 C CNN
F 2 "" H 8450 6200 50  0001 C CNN
F 3 "" H 8450 6200 50  0001 C CNN
	1    8450 6200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8450 6200 8450 6100
Wire Wire Line
	6400 6650 6400 6550
$Comp
L power:+12V #PWR029
U 1 1 5BE0AD32
P 8450 4500
F 0 "#PWR029" H 8450 4350 50  0001 C CNN
F 1 "+12V" H 8465 4673 50  0000 C CNN
F 2 "" H 8450 4500 50  0001 C CNN
F 3 "" H 8450 4500 50  0001 C CNN
	1    8450 4500
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR027
U 1 1 5BE0AE41
P 6550 4400
F 0 "#PWR027" H 6550 4250 50  0001 C CNN
F 1 "+12V" H 6565 4573 50  0000 C CNN
F 2 "" H 6550 4400 50  0001 C CNN
F 3 "" H 6550 4400 50  0001 C CNN
	1    6550 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 4400 6550 4500
Connection ~ 6550 4500
$Comp
L Ladebox:Relay R22
U 1 1 5BE2F526
P 6750 5000
F 0 "R22" H 7150 5175 50  0000 L CNN
F 1 "Relais" H 7150 5075 60  0000 L CNN
F 2 "" H 6750 5000 60  0001 C CNN
F 3 "" H 6750 5000 60  0001 C CNN
F 4 "Spule: 12 V/DC" H 7150 4825 45  0000 L CNN "Spannung"
F 5 "min. 5 A" H 7150 4950 60  0000 L CNN "Schaltstrom"
	1    6750 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8450 4500 8450 4600
Connection ~ 8450 4600
Text Notes 9650 2150 0    79   ~ 0
5-V-\nSpannungswandler\nfür Arduino und LEDs
$Comp
L Ladebox-2-rescue:Opamp_Dual_Generic-Device U?
U 3 1 5BE153AF
P 4500 1300
AR Path="/5BE153AF" Ref="U?"  Part="3" 
AR Path="/5B695976/5BE153AF" Ref="U2"  Part="3" 
F 0 "U2" H 4500 1350 50  0000 L CNN
F 1 "LM6132" H 4500 1250 50  0000 L CNN
F 2 "" H 4500 1300 50  0001 C CNN
F 3 "~" H 4500 1300 50  0001 C CNN
	3    4500 1300
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:Opamp_Dual_Generic-Device U?
U 2 1 5BE1565C
P 7400 1450
AR Path="/5BE1565C" Ref="U?"  Part="2" 
AR Path="/5B695976/5BE1565C" Ref="U2"  Part="2" 
F 0 "U2" H 7400 1825 50  0000 C CNN
F 1 "LM6132" H 7400 1725 50  0000 C CNN
F 2 "" H 7400 1450 50  0001 C CNN
F 3 "~" H 7400 1450 50  0001 C CNN
	2    7400 1450
	1    0    0    -1  
$EndComp
$Comp
L Comparator:LM393 U4
U 2 1 5BE15D98
P 5650 2700
F 0 "U4" H 5650 3067 50  0000 C CNN
F 1 "LM393" H 5650 2976 50  0000 C CNN
F 2 "" H 5650 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm393-n.pdf" H 5650 2700 50  0001 C CNN
	2    5650 2700
	1    0    0    -1  
$EndComp
$Comp
L Comparator:LM393 U4
U 3 1 5BE15E89
P 7000 3150
F 0 "U4" H 7000 3200 50  0000 L CNN
F 1 "LM393" H 7000 3100 50  0000 L CNN
F 2 "" H 7000 3150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm393-n.pdf" H 7000 3150 50  0001 C CNN
	3    7000 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 1750 7800 1750
NoConn ~ 3400 5600
$Comp
L Ladebox-2-rescue:Q_NPN_BCE-Device Q?
U 1 1 5BEA27F0
P 10250 4900
AR Path="/5BEA27F0" Ref="Q?"  Part="1" 
AR Path="/5B695976/5BEA27F0" Ref="Q2"  Part="1" 
F 0 "Q2" H 10440 4946 50  0000 L CNN
F 1 "BD139" H 10440 4855 50  0000 L CNN
F 2 "" H 10450 5000 50  0001 C CNN
F 3 "~" H 10250 4900 50  0001 C CNN
	1    10250 4900
	-1   0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:Q_NPN_CBE-Device Q?
U 1 1 5BEA316D
P 10450 5300
AR Path="/5BEA316D" Ref="Q?"  Part="1" 
AR Path="/5B695976/5BEA316D" Ref="Q3"  Part="1" 
F 0 "Q3" H 10641 5346 50  0000 L CNN
F 1 "BC547C" H 10641 5255 50  0000 L CNN
F 2 "" H 10650 5400 50  0001 C CNN
F 3 "~" H 10450 5300 50  0001 C CNN
	1    10450 5300
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:D_Schottky-Device D?
U 1 1 5BEB41B5
P 10150 4450
AR Path="/5BEB41B5" Ref="D?"  Part="1" 
AR Path="/5B695976/5BEB41B5" Ref="D14"  Part="1" 
F 0 "D14" V 10196 4371 50  0000 R CNN
F 1 "1N5817" V 10105 4371 50  0000 R CNN
F 2 "" H 10150 4450 50  0001 C CNN
F 3 "~" H 10150 4450 50  0001 C CNN
	1    10150 4450
	0    -1   -1   0   
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5BEB4562
P 10700 4650
AR Path="/5BEB4562" Ref="R?"  Part="1" 
AR Path="/5B695976/5BEB4562" Ref="R21"  Part="1" 
F 0 "R21" H 10770 4696 50  0000 L CNN
F 1 "1k" H 10770 4605 50  0000 L CNN
F 2 "" V 10630 4650 50  0001 C CNN
F 3 "~" H 10700 4650 50  0001 C CNN
	1    10700 4650
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5BEB466E
P 10150 5600
AR Path="/5BEB466E" Ref="R?"  Part="1" 
AR Path="/5B695976/5BEB466E" Ref="R24"  Part="1" 
F 0 "R24" H 10080 5554 50  0000 R CNN
F 1 "2,2" H 10080 5645 50  0000 R CNN
F 2 "" V 10080 5600 50  0001 C CNN
F 3 "~" H 10150 5600 50  0001 C CNN
	1    10150 5600
	-1   0    0    1   
$EndComp
Wire Wire Line
	10700 4800 10700 4900
Wire Wire Line
	10550 4900 10450 4900
Wire Wire Line
	10550 4900 10550 5100
Wire Wire Line
	10150 5300 10150 5450
Wire Wire Line
	10150 5750 10150 5850
Wire Wire Line
	10550 5850 10550 5500
$Comp
L power:GND #PWR034
U 1 1 5BF1D13E
P 10350 5950
F 0 "#PWR034" H 10350 5700 50  0001 C CNN
F 1 "GND" H 10355 5777 50  0000 C CNN
F 2 "" H 10350 5950 50  0001 C CNN
F 3 "" H 10350 5950 50  0001 C CNN
	1    10350 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10350 5950 10350 5850
Wire Wire Line
	10700 4400 10700 4500
$Comp
L Ladebox-2-rescue:CP-Device C?
U 1 1 5BF6309E
P 9450 3800
AR Path="/5BF6309E" Ref="C?"  Part="1" 
AR Path="/5B695976/5BF6309E" Ref="C8"  Part="1" 
F 0 "C8" H 9600 3900 67  0000 L CNB
F 1 "min. 3900μ" H 9600 3700 67  0000 L CNB
F 2 "" H 9488 3650 50  0001 C CNN
F 3 "~" H 9450 3800 50  0001 C CNN
	1    9450 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 4200 8900 4700
$Comp
L power:+12V #PWR023
U 1 1 5BF940D5
P 9450 3500
F 0 "#PWR023" H 9450 3350 50  0001 C CNN
F 1 "+12V" H 9465 3673 50  0000 C CNN
F 2 "" H 9450 3500 50  0001 C CNN
F 3 "" H 9450 3500 50  0001 C CNN
	1    9450 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	9450 3500 9450 3650
Wire Wire Line
	9450 3950 9450 4200
Connection ~ 10350 5850
Wire Wire Line
	10350 5850 10550 5850
Wire Wire Line
	10150 5300 10250 5300
Wire Wire Line
	10150 5850 10350 5850
Wire Wire Line
	10150 5100 10150 5300
Connection ~ 10150 5300
$Comp
L Ladebox-2-rescue:D-Device D?
U 1 1 5B7AC8BD
P 6000 5000
AR Path="/5B7AC8BD" Ref="D?"  Part="1" 
AR Path="/5B695976/5B7AC8BD" Ref="D15"  Part="1" 
F 0 "D15" V 5954 5079 50  0000 L CNN
F 1 "1N4007" V 6045 5079 50  0000 L CNN
F 2 "" H 6000 5000 50  0001 C CNN
F 3 "~" H 6000 5000 50  0001 C CNN
	1    6000 5000
	0    1    1    0   
$EndComp
Wire Wire Line
	6800 4600 6800 4500
Wire Wire Line
	6800 4500 6550 4500
Wire Wire Line
	8700 4700 8700 4600
Wire Wire Line
	8700 4600 8450 4600
$Comp
L Ladebox-2-rescue:D-Device D?
U 1 1 5C3D016F
P 9400 5800
AR Path="/5C3D016F" Ref="D?"  Part="1" 
AR Path="/5B695976/5C3D016F" Ref="D18"  Part="1" 
F 0 "D18" H 9400 5584 50  0000 C CNN
F 1 "1N4007" H 9400 5675 50  0000 C CNN
F 2 "" H 9400 5800 50  0001 C CNN
F 3 "~" H 9400 5800 50  0001 C CNN
	1    9400 5800
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR033
U 1 1 5C3D0176
P 9700 5700
F 0 "#PWR033" H 9700 5550 50  0001 C CNN
F 1 "+12V" H 9715 5873 50  0000 C CNN
F 2 "" H 9700 5700 50  0001 C CNN
F 3 "" H 9700 5700 50  0001 C CNN
	1    9700 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 5700 9700 5800
Wire Wire Line
	9700 5800 9550 5800
Wire Wire Line
	8800 5600 8800 5500
Wire Wire Line
	5200 7050 5000 7050
Wire Wire Line
	4000 5300 5550 5300
Wire Wire Line
	6400 5500 6400 6150
Wire Wire Line
	5550 5300 6150 5900
Wire Wire Line
	4000 5450 5500 5450
Wire Wire Line
	6900 5400 6900 5700
Wire Wire Line
	6150 5900 7550 5900
$Comp
L Ladebox-2-rescue:D-Device D?
U 1 1 5CC8D24C
P 7200 5700
AR Path="/5CC8D24C" Ref="D?"  Part="1" 
AR Path="/5B695976/5CC8D24C" Ref="D17"  Part="1" 
F 0 "D17" H 7200 5484 50  0000 C CNN
F 1 "1N4007" H 7200 5575 50  0000 C CNN
F 2 "" H 7200 5700 50  0001 C CNN
F 3 "~" H 7200 5700 50  0001 C CNN
	1    7200 5700
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR032
U 1 1 5CC8D253
P 7500 5600
F 0 "#PWR032" H 7500 5450 50  0001 C CNN
F 1 "+12V" H 7515 5773 50  0000 C CNN
F 2 "" H 7500 5600 50  0001 C CNN
F 3 "" H 7500 5600 50  0001 C CNN
	1    7500 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 5600 7500 5700
Wire Wire Line
	7500 5700 7350 5700
Wire Wire Line
	6900 5700 7050 5700
Wire Wire Line
	6900 6150 7050 6150
Wire Wire Line
	5850 5800 5500 5450
Wire Wire Line
	5850 5950 5850 5800
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5C855DB6
P 5850 6100
AR Path="/5C855DB6" Ref="R?"  Part="1" 
AR Path="/5B695976/5C855DB6" Ref="R27"  Part="1" 
F 0 "R27" H 5920 6146 50  0000 L CNN
F 1 "22k" H 5920 6055 50  0000 L CNN
F 2 "" V 5780 6100 50  0001 C CNN
F 3 "~" H 5850 6100 50  0001 C CNN
	1    5850 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 6250 5850 6350
Wire Wire Line
	5850 6350 6100 6350
Wire Wire Line
	7850 5900 8150 5900
Connection ~ 6900 5700
Wire Wire Line
	6900 5700 6900 6150
Wire Wire Line
	9100 5800 9250 5800
Wire Wire Line
	8800 5600 9100 5600
Connection ~ 9100 5800
Wire Wire Line
	9100 5600 9100 5800
Wire Wire Line
	6000 5500 6400 5500
Connection ~ 6400 5500
Wire Wire Line
	6400 5500 6550 5500
$Comp
L power:GND #PWR039
U 1 1 5CFD7A3B
P 850 7350
F 0 "#PWR039" H 850 7100 50  0001 C CNN
F 1 "GND" H 855 7177 50  0000 C CNN
F 2 "" H 850 7350 50  0001 C CNN
F 3 "" H 850 7350 50  0001 C CNN
	1    850  7350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1000 6350 850  6350
Wire Wire Line
	850  6350 850  6450
Wire Wire Line
	850  7250 850  7350
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5CFD7A45
P 850 6600
AR Path="/5CFD7A45" Ref="R?"  Part="1" 
AR Path="/5B695976/5CFD7A45" Ref="R29"  Part="1" 
F 0 "R29" H 920 6646 50  0000 L CNN
F 1 "120k" H 920 6555 50  0000 L CNN
F 2 "" V 780 6600 50  0001 C CNN
F 3 "~" H 850 6600 50  0001 C CNN
	1    850  6600
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5CFD7A4C
P 850 7100
AR Path="/5CFD7A4C" Ref="R?"  Part="1" 
AR Path="/5B695976/5CFD7A4C" Ref="R31"  Part="1" 
F 0 "R31" H 920 7146 50  0000 L CNN
F 1 "68k" H 920 7055 50  0000 L CNN
F 2 "" V 780 7100 50  0001 C CNN
F 3 "~" H 850 7100 50  0001 C CNN
	1    850  7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	850  6750 850  6850
Connection ~ 850  6850
Wire Wire Line
	850  6850 850  6950
Wire Wire Line
	5500 6700 5500 6850
$Comp
L power:+5V #PWR028
U 1 1 5D0E4ADD
P 10700 4400
F 0 "#PWR028" H 10700 4250 50  0001 C CNN
F 1 "+5V" H 10715 4573 50  0000 C CNN
F 2 "" H 10700 4400 50  0001 C CNN
F 3 "" H 10700 4400 50  0001 C CNN
	1    10700 4400
	1    0    0    -1  
$EndComp
Connection ~ 8900 4200
Wire Wire Line
	10150 4600 10150 4700
Connection ~ 10550 4900
Wire Wire Line
	10150 4200 10150 4300
Wire Wire Line
	10700 4900 10550 4900
Connection ~ 9450 4200
Wire Wire Line
	9450 4200 10150 4200
Wire Wire Line
	9450 4200 8900 4200
Wire Wire Line
	7000 4600 7000 4500
Wire Wire Line
	7000 4500 7600 4500
Wire Wire Line
	7600 4500 7900 4200
Wire Wire Line
	7900 4200 8900 4200
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B7422D0
P 4000 3050
AR Path="/5B7422D0" Ref="R?"  Part="1" 
AR Path="/5B695976/5B7422D0" Ref="R19"  Part="1" 
F 0 "R19" H 4070 3096 50  0000 L CNN
F 1 "150" H 4070 3005 50  0000 L CNN
F 2 "" V 3930 3050 50  0001 C CNN
F 3 "~" H 4000 3050 50  0001 C CNN
	1    4000 3050
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B742252
P 3550 3050
AR Path="/5B742252" Ref="R?"  Part="1" 
AR Path="/5B695976/5B742252" Ref="R18"  Part="1" 
F 0 "R18" H 3620 3096 50  0000 L CNN
F 1 "150" H 3620 3005 50  0000 L CNN
F 2 "" V 3480 3050 50  0001 C CNN
F 3 "~" H 3550 3050 50  0001 C CNN
	1    3550 3050
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B7421D6
P 3100 3050
AR Path="/5B7421D6" Ref="R?"  Part="1" 
AR Path="/5B695976/5B7421D6" Ref="R17"  Part="1" 
F 0 "R17" H 3170 3096 50  0000 L CNN
F 1 "150" H 3170 3005 50  0000 L CNN
F 2 "" V 3030 3050 50  0001 C CNN
F 3 "~" H 3100 3050 50  0001 C CNN
	1    3100 3050
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B74215C
P 2650 3050
AR Path="/5B74215C" Ref="R?"  Part="1" 
AR Path="/5B695976/5B74215C" Ref="R16"  Part="1" 
F 0 "R16" H 2720 3096 50  0000 L CNN
F 1 "150" H 2720 3005 50  0000 L CNN
F 2 "" V 2580 3050 50  0001 C CNN
F 3 "~" H 2650 3050 50  0001 C CNN
	1    2650 3050
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B7420E2
P 2200 3050
AR Path="/5B7420E2" Ref="R?"  Part="1" 
AR Path="/5B695976/5B7420E2" Ref="R15"  Part="1" 
F 0 "R15" H 2270 3096 50  0000 L CNN
F 1 "150" H 2270 3005 50  0000 L CNN
F 2 "" V 2130 3050 50  0001 C CNN
F 3 "~" H 2200 3050 50  0001 C CNN
	1    2200 3050
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B742070
P 1750 3050
AR Path="/5B742070" Ref="R?"  Part="1" 
AR Path="/5B695976/5B742070" Ref="R14"  Part="1" 
F 0 "R14" H 1820 3096 50  0000 L CNN
F 1 "150" H 1820 3005 50  0000 L CNN
F 2 "" V 1680 3050 50  0001 C CNN
F 3 "~" H 1750 3050 50  0001 C CNN
	1    1750 3050
	1    0    0    -1  
$EndComp
$Comp
L Ladebox-2-rescue:R-Device R?
U 1 1 5B741FFC
P 1300 3050
AR Path="/5B741FFC" Ref="R?"  Part="1" 
AR Path="/5B695976/5B741FFC" Ref="R13"  Part="1" 
F 0 "R13" H 1370 3096 50  0000 L CNN
F 1 "150" H 1370 3005 50  0000 L CNN
F 2 "" V 1230 3050 50  0001 C CNN
F 3 "~" H 1300 3050 50  0001 C CNN
	1    1300 3050
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Switching:R-78E5.0-0.5 U1
U 1 1 5FB5ED8E
P 10200 1100
F 0 "U1" H 10200 1342 50  0000 C CNN
F 1 "LC78_05-0.5" H 10200 1251 50  0000 C CNN
F 2 "Converter_DCDC:Converter_DCDC_RECOM_R-78E-0.5_THT" H 10250 850 50  0001 L CIN
F 3 "https://www.recom-power.com/pdf/Innoline/R-78Exx-0.5.pdf" H 10200 1100 50  0001 C CNN
	1    10200 1100
	1    0    0    -1  
$EndComp
Wire Bus Line
	3900 4150 3900 6950
Wire Bus Line
	950  4050 8750 4050
Wire Bus Line
	1900 4150 1900 6750
$EndSCHEMATC
