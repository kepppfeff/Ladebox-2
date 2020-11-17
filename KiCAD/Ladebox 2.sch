EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "Mobile Ladebox mit Arduino Nano"
Date "2020-11-17"
Rev "2.6"
Comp "© kepppfeff (GitHub / GoingElectric.de)"
Comment1 "Übersichtlichkeit mit schwarzen Strichen markiert."
Comment2 "Leitungen, über die der Ladestrom zum Elektroauto fließt, sind zur besseren"
Comment3 "Schäden und Unfälle jeglicher Art übernehme ich keine Haftung."
Comment4 "ACHTUNG! Ein Nachbau darf nur von ausgebildeten Fachkräften durchgeführt werden! Für"
$EndDescr
$Comp
L Ladebox:CEE32rot T1
U 1 1 5B674594
P 2100 1100
F 0 "T1" H 2628 1111 60  0000 L CNN
F 1 "CEE32 rot" H 1600 1325 79  0000 L CNN
F 2 "" H 2100 1100 60  0001 C CNN
F 3 "" H 2100 1100 60  0001 C CNN
	1    2100 1100
	1    0    0    -1  
$EndComp
$Comp
L Ladebox:CEE16blau T2
U 1 1 5B67467F
P 9650 1150
F 0 "T2" H 10078 1186 60  0000 L CNN
F 1 "CEE16 blau" H 9250 1425 79  0000 L CNN
F 2 "" H 9650 1150 60  0001 C CNN
F 3 "" H 9650 1150 60  0001 C CNN
	1    9650 1150
	1    0    0    -1  
$EndComp
$Comp
L Ladebox:FI-Schutzschalter FI1
U 1 1 5B674D87
P 2200 5850
F 0 "FI1" H 2700 6050 60  0000 L CNN
F 1 "Fehlerstrom-Schutzschalter" H 2700 5900 60  0000 L CNN
F 2 "" H 2200 5850 60  0001 C CNN
F 3 "" H 2200 5850 60  0001 C CNN
F 4 "Typ A-EV" H 2700 5750 60  0000 L CNN "Typ"
F 5 "min. 40 A" H 2700 5600 50  0000 L CNN "Stromstärke"
	1    2200 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 3000 2100 1350
Wire Wire Line
	1700 3800 1700 4500
Wire Wire Line
	2300 1350 2300 3000
$Comp
L Ladebox:Typ2-Steckdose T3
U 1 1 5B6759AD
P 2300 7050
F 0 "T3" H 3100 7000 60  0000 C CNN
F 1 "Typ2-Steckdose" H 2300 6850 79  0000 C CNN
F 2 "" H 2300 7050 60  0001 C CNN
F 3 "" H 2300 7050 60  0001 C CNN
F 4 "min. 32 A" H 2300 6700 50  0000 C CNN "Stromstärke"
	1    2300 7050
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR04
U 1 1 5B675B15
P 1350 6750
F 0 "#PWR04" H 1350 6500 50  0001 C CNN
F 1 "Earth" H 1350 6600 50  0001 C CNN
F 2 "" H 1350 6750 50  0001 C CNN
F 3 "~" H 1350 6750 50  0001 C CNN
	1    1350 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 6750 1700 6550
Wire Wire Line
	1700 6550 1350 6550
Wire Wire Line
	1350 6550 1350 6750
Wire Wire Line
	1900 6750 1900 6350
Wire Wire Line
	2100 6350 2100 6750
Wire Wire Line
	2300 6750 2300 6350
$Comp
L power:Earth #PWR01
U 1 1 5B67629D
P 2500 1450
F 0 "#PWR01" H 2500 1200 50  0001 C CNN
F 1 "Earth" H 2500 1300 50  0001 C CNN
F 2 "" H 2500 1450 50  0001 C CNN
F 3 "~" H 2500 1450 50  0001 C CNN
	1    2500 1450
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR02
U 1 1 5B6762FD
P 9900 1500
F 0 "#PWR02" H 9900 1250 50  0001 C CNN
F 1 "Earth" H 9900 1350 50  0001 C CNN
F 2 "" H 9900 1500 50  0001 C CNN
F 3 "~" H 9900 1500 50  0001 C CNN
	1    9900 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1350 2500 1450
Wire Wire Line
	9900 1500 9900 1400
Wire Wire Line
	2500 6350 2500 6750
$Sheet
S 5600 4800 1000 2000
U 5B695976
F0 "Steuerplatine" 50
F1 "steuerplatine.sch" 50
F2 "CP" I L 5600 6500 50 
F3 "PP" I L 5600 6650 50 
F4 "Wahlschalter" I R 6600 5400 50 
F5 "Verriegelung_A" I R 6600 5700 50 
F6 "Verriegelung_B" I R 6600 5850 50 
F7 "Verriegelung_Kontakt" I R 6600 6000 50 
F8 "Relais(-)" I R 6600 5050 50 
F9 "+12V" I L 5600 5100 50 
F10 "GND_PE" I L 5600 5300 50 
$EndSheet
Wire Wire Line
	5600 6650 2900 6650
Wire Wire Line
	2900 6650 2900 6750
Wire Wire Line
	5600 6500 2700 6500
Wire Wire Line
	2700 6500 2700 6750
Wire Wire Line
	1900 3800 1900 4300
$Comp
L Ladebox:Verriegelung V1
U 1 1 5B6BF3C8
P 7800 5850
F 0 "V1" H 8200 5700 50  0000 L CNN
F 1 "Verriegelung" H 8377 5850 79  0001 L CNN
F 2 "" H 7875 5850 79  0001 C CNN
F 3 "" H 7875 5850 79  0001 C CNN
F 4 "12 V, 3 A" H 7900 6000 51  0000 L CNN "Spezifikation"
	1    7800 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 5700 6600 5700
Wire Wire Line
	7300 5850 6600 5850
Wire Wire Line
	7300 6000 6600 6000
Wire Wire Line
	2500 4500 2500 5350
Wire Wire Line
	6700 950  6700 1400
Text Notes 8500 6200 0    79   ~ 0
Elektromechanische Stecker-\nverriegelung der Typ2-Steckdose\n• Verriegeln: A +, B -\n• Entriegeln: A -, B +\n• darf maximal 200 ms lang \n   angesteuert werden, da sonst der\n   Elektromagnet überhitzt.\n• über Kontakt kann gemessen werden,\n   ob gerade verriegelt oder nicht.
$Comp
L Ladebox:Relay_SPST R2
U 1 1 5B6BBCA4
P 7900 3400
F 0 "R2" H 7550 3225 50  0000 R CNN
F 1 "Relais" H 7550 3325 60  0000 R CNN
F 2 "" H 7900 3400 50  0001 C CNN
F 3 "" H 7900 3400 50  0001 C CNN
F 4 "Spule: 12 V/DC" H 7550 3575 45  0000 R CNN "Spannung"
F 5 "min. 25 A" H 7550 3450 60  0000 R CNN "Schaltstrom"
	1    7900 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	8100 3000 8100 2900
Wire Wire Line
	9200 2900 9200 3000
Wire Wire Line
	8100 3800 8100 3900
Wire Wire Line
	9200 3900 9200 3800
$Comp
L Ladebox-2-rescue:Fuse-Device F1
U 1 1 5B6C7E5A
P 3550 1700
F 0 "F1" H 3650 1850 50  0000 L CNN
F 1 "Schmelzsicherung" H 3650 1750 50  0000 L CNN
F 2 "" V 3480 1700 50  0001 C CNN
F 3 "~" H 3550 1700 50  0001 C CNN
F 4 "400 mA" H 3650 1650 50  0000 L CNN "Nennstrom"
F 5 "träge" H 3650 1550 50  0000 L CNN "Charakteristik"
	1    3550 1700
	1    0    0    -1  
$EndComp
$Comp
L Ladebox:Schuetz S2
U 1 1 5B6FD1C8
P 2150 3400
F 0 "S2" H 1572 3498 60  0000 R CNN
F 1 "Schütz" H 1572 3392 60  0000 R CNN
F 2 "" H 2150 3400 60  0001 C CNN
F 3 "" H 2150 3400 60  0001 C CNN
F 4 "min. 40 A" H 1550 3250 50  0000 R CNN "Stromstärke"
	1    2150 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1150 3550 1550
Wire Wire Line
	9400 1400 9400 2300
Text Label 7750 2300 0    50   ~ 0
_
Text Label 7850 2300 0    50   ~ 0
_
Text Label 7950 2300 0    50   ~ 0
_
Text Label 8050 2300 0    50   ~ 0
_
Text Label 8150 2300 0    50   ~ 0
_
Text Label 8250 2300 0    50   ~ 0
_
Text Label 7600 4300 0    50   ~ 0
_
Text Label 7500 4300 0    50   ~ 0
_
Text Label 7400 4300 0    50   ~ 0
_
Text Label 7300 4300 0    50   ~ 0
_
Text Label 7200 4300 0    50   ~ 0
_
Text Label 8350 2300 0    50   ~ 0
_
Text Label 8450 2300 0    50   ~ 0
_
Text Label 8550 2300 0    50   ~ 0
_
Text Label 8650 2300 0    50   ~ 0
_
Text Label 8750 2300 0    50   ~ 0
_
Text Label 8850 2300 0    50   ~ 0
_
Text Label 8950 2300 0    50   ~ 0
_
Text Label 9050 2300 0    50   ~ 0
_
Text Label 9150 2300 0    50   ~ 0
_
Text Label 9250 2300 0    50   ~ 0
_
Text Label 9350 2300 0    50   ~ 0
_
Text Label 9400 2250 1    50   ~ 0
_
Text Label 9400 2150 1    50   ~ 0
_
Text Label 9400 2050 1    50   ~ 0
_
Text Label 9400 1950 1    50   ~ 0
_
Text Label 9400 1850 1    50   ~ 0
_
Text Label 9400 1750 1    50   ~ 0
_
Text Label 9400 1650 1    50   ~ 0
_
Text Label 9400 1550 1    50   ~ 0
_
Text Label 9400 1450 1    50   ~ 0
_
Text Label 9650 1450 1    50   ~ 0
_
Text Label 9650 1550 1    50   ~ 0
_
Text Label 9650 1650 1    50   ~ 0
_
Text Label 9650 1750 1    50   ~ 0
_
Text Label 9650 1850 1    50   ~ 0
_
Text Label 9650 1950 1    50   ~ 0
_
Text Label 9650 2050 1    50   ~ 0
_
Text Label 9650 2150 1    50   ~ 0
_
Text Label 9650 2250 1    50   ~ 0
_
Text Label 9650 2350 1    50   ~ 0
_
Text Label 9650 2450 1    50   ~ 0
_
Text Label 9650 2550 1    50   ~ 0
_
Text Label 9650 2650 1    50   ~ 0
_
Text Label 9650 2750 1    50   ~ 0
_
Text Label 9650 2850 1    50   ~ 0
_
Text Label 7750 2400 1    50   ~ 0
_
Text Label 7750 2450 3    50   ~ 0
_
Text Label 7750 2600 1    50   ~ 0
_
Text Label 7750 2700 1    50   ~ 0
_
Text Label 7750 2800 1    50   ~ 0
_
Text Label 7650 4050 1    50   ~ 0
_
Text Label 7650 4150 1    50   ~ 0
_
Text Label 7650 4250 1    50   ~ 0
_
Text Label 5850 4500 0    50   ~ 0
_
Text Label 5750 4500 0    50   ~ 0
_
Text Label 5650 4500 0    50   ~ 0
_
Text Label 5550 4500 0    50   ~ 0
_
Text Label 5450 4500 0    50   ~ 0
_
Text Label 5250 4500 0    50   ~ 0
_
Text Label 5150 4500 0    50   ~ 0
_
Text Label 5400 4500 2    50   ~ 0
_
Text Label 5050 4500 0    50   ~ 0
_
Text Label 4950 4500 0    50   ~ 0
_
Text Label 4900 4500 2    50   ~ 0
_
Text Label 4750 4500 0    50   ~ 0
_
Text Label 4650 4500 0    50   ~ 0
_
Text Label 4550 4500 0    50   ~ 0
_
Text Label 4450 4500 0    50   ~ 0
_
Text Label 4350 4500 0    50   ~ 0
_
Text Label 4250 4500 0    50   ~ 0
_
Text Label 4200 4500 2    50   ~ 0
_
Text Label 4050 4500 0    50   ~ 0
_
Text Label 3950 4500 0    50   ~ 0
_
Text Label 3850 4500 0    50   ~ 0
_
Text Label 3750 4500 0    50   ~ 0
_
Text Label 3650 4500 0    50   ~ 0
_
Text Label 3450 4500 0    50   ~ 0
_
Text Label 3600 4500 2    50   ~ 0
_
Text Label 3350 4500 0    50   ~ 0
_
Text Label 3250 4500 0    50   ~ 0
_
Text Label 3150 4500 0    50   ~ 0
_
Text Label 3100 4500 2    50   ~ 0
_
Text Label 2950 4500 0    50   ~ 0
_
Text Label 2850 4500 0    50   ~ 0
_
Text Label 2750 4500 0    50   ~ 0
_
Text Label 2650 4500 0    50   ~ 0
_
Text Label 2550 4500 0    50   ~ 0
_
Text Label 7100 4300 0    50   ~ 0
_
Text Label 7000 4300 0    50   ~ 0
_
Text Label 6900 4300 0    50   ~ 0
_
Text Label 6700 4300 0    50   ~ 0
_
Text Label 6850 4300 2    50   ~ 0
_
Text Label 6600 4300 0    50   ~ 0
_
Text Label 6500 4300 0    50   ~ 0
_
Text Label 6400 4300 0    50   ~ 0
_
Text Label 6300 4300 0    50   ~ 0
_
Text Label 6200 4300 0    50   ~ 0
_
Text Label 6150 4300 2    50   ~ 0
_
Text Label 6000 4300 0    50   ~ 0
_
Text Label 5900 4300 0    50   ~ 0
_
Text Label 5800 4300 0    50   ~ 0
_
Text Label 5700 4300 0    50   ~ 0
_
Text Label 5600 4300 0    50   ~ 0
_
Text Label 5500 4300 0    50   ~ 0
_
Text Label 5400 4300 0    50   ~ 0
_
Text Label 5300 4300 0    50   ~ 0
_
Text Label 5200 4300 0    50   ~ 0
_
Text Label 5100 4300 0    50   ~ 0
_
Text Label 5000 4300 0    50   ~ 0
_
Text Label 4900 4300 0    50   ~ 0
_
Text Label 4800 4300 0    50   ~ 0
_
Text Label 4700 4300 0    50   ~ 0
_
Text Label 4600 4300 0    50   ~ 0
_
Text Label 4500 4300 0    50   ~ 0
_
Text Label 4400 4300 0    50   ~ 0
_
Text Label 4300 4300 0    50   ~ 0
_
Text Label 4200 4300 0    50   ~ 0
_
Text Label 4100 4300 0    50   ~ 0
_
Text Label 4000 4300 0    50   ~ 0
_
Text Label 3900 4300 0    50   ~ 0
_
Text Label 3800 4300 0    50   ~ 0
_
Text Label 3700 4300 0    50   ~ 0
_
Text Label 3600 4300 0    50   ~ 0
_
Text Label 3500 4300 0    50   ~ 0
_
Text Label 3400 4300 0    50   ~ 0
_
Text Label 3300 4300 0    50   ~ 0
_
Text Label 3200 4300 0    50   ~ 0
_
Text Label 3000 4300 0    50   ~ 0
_
Text Label 3100 4300 0    50   ~ 0
_
Text Label 2900 4300 0    50   ~ 0
_
Text Label 2800 4300 0    50   ~ 0
_
Text Label 2700 4300 0    50   ~ 0
_
Text Label 2600 4300 0    50   ~ 0
_
Text Label 2500 4300 0    50   ~ 0
_
Text Label 2400 4300 0    50   ~ 0
_
Text Label 2350 4300 2    50   ~ 0
_
Text Label 2200 4300 0    50   ~ 0
_
Text Label 2150 4300 2    50   ~ 0
_
Text Label 2000 4300 0    50   ~ 0
_
Text Label 1900 4300 0    50   ~ 0
_
Text Label 1900 4250 1    50   ~ 0
_
Text Label 1900 4150 1    50   ~ 0
_
Text Label 1900 4050 1    50   ~ 0
_
Text Label 1900 3950 1    50   ~ 0
_
Text Label 1900 3850 1    50   ~ 0
_
Text Label 2100 3900 1    50   ~ 0
_
Text Label 2100 4000 1    50   ~ 0
_
Text Label 2100 4100 1    50   ~ 0
_
Text Label 2100 4200 1    50   ~ 0
_
Text Label 1700 4500 1    50   ~ 0
_
Text Label 1700 4400 1    50   ~ 0
_
Text Label 1700 4300 1    50   ~ 0
_
Text Label 1700 4200 1    50   ~ 0
_
Text Label 1700 4100 1    50   ~ 0
_
Text Label 1700 4000 1    50   ~ 0
_
Text Label 1700 3900 1    50   ~ 0
_
Text Label 2100 4250 3    50   ~ 0
_
Text Label 2100 4400 1    50   ~ 0
_
Text Label 2100 4450 3    50   ~ 0
_
Text Label 2100 4600 1    50   ~ 0
_
Text Label 2100 4700 1    50   ~ 0
_
Text Label 2100 4800 1    50   ~ 0
_
Text Label 2100 4900 1    50   ~ 0
_
Text Label 2100 5000 1    50   ~ 0
_
Text Label 2100 5100 1    50   ~ 0
_
Text Label 2100 5200 1    50   ~ 0
_
Text Label 2100 5300 1    50   ~ 0
_
Text Label 2300 5250 1    50   ~ 0
_
Text Label 2300 5150 1    50   ~ 0
_
Text Label 2300 5050 1    50   ~ 0
_
Text Label 2300 4950 1    50   ~ 0
_
Text Label 2300 4850 1    50   ~ 0
_
Text Label 2300 4750 1    50   ~ 0
_
Text Label 2300 4650 1    50   ~ 0
_
Text Label 2300 4550 1    50   ~ 0
_
Text Label 2300 4450 1    50   ~ 0
_
Text Label 2300 4350 1    50   ~ 0
_
Text Label 2300 4250 1    50   ~ 0
_
Text Label 2300 4150 1    50   ~ 0
_
Text Label 2300 4050 1    50   ~ 0
_
Text Label 2300 3950 1    50   ~ 0
_
Text Label 2300 3850 1    50   ~ 0
_
Text Label 2500 4600 1    50   ~ 0
_
Text Label 2500 4700 1    50   ~ 0
_
Text Label 2500 4800 1    50   ~ 0
_
Text Label 2500 4900 1    50   ~ 0
_
Text Label 2500 5000 1    50   ~ 0
_
Text Label 2500 5100 1    50   ~ 0
_
Text Label 2500 5200 1    50   ~ 0
_
Text Label 2500 5300 1    50   ~ 0
_
Text Label 1900 5250 1    50   ~ 0
_
Text Label 1900 5150 1    50   ~ 0
_
Text Label 1900 5050 1    50   ~ 0
_
Text Label 1900 4950 1    50   ~ 0
_
Text Label 1900 4850 1    50   ~ 0
_
Text Label 1900 4750 1    50   ~ 0
_
Text Label 1900 4650 1    50   ~ 0
_
Text Label 1900 4550 1    50   ~ 0
_
Text Label 1900 4450 1    50   ~ 0
_
Text Label 1900 4350 1    50   ~ 0
_
Text Label 1750 4500 0    50   ~ 0
_
Text Label 1850 4500 0    50   ~ 0
_
Text Label 1950 4500 0    50   ~ 0
_
Text Label 2050 4500 0    50   ~ 0
_
Text Label 2150 4500 0    50   ~ 0
_
Text Label 2250 4500 0    50   ~ 0
_
Text Label 2350 4500 0    50   ~ 0
_
Text Label 2450 4500 0    50   ~ 0
_
Text Label 6000 4500 2    50   ~ 0
_
Text Label 6050 4500 0    50   ~ 0
_
Text Label 6150 4500 0    50   ~ 0
_
Text Label 6250 4500 0    50   ~ 0
_
Text Label 6350 4500 0    50   ~ 0
_
Text Label 6450 4500 0    50   ~ 0
_
Text Label 6550 4500 0    50   ~ 0
_
Text Label 6650 4500 0    50   ~ 0
_
Text Label 6750 4500 0    50   ~ 0
_
Text Label 6850 4500 0    50   ~ 0
_
Text Label 7000 4500 2    50   ~ 0
_
Text Label 7050 4500 0    50   ~ 0
_
Text Label 7150 4500 0    50   ~ 0
_
Text Label 7300 4500 2    50   ~ 0
_
Text Label 7350 4500 0    50   ~ 0
_
Text Label 7450 4500 0    50   ~ 0
_
Text Label 7550 4500 0    50   ~ 0
_
Text Label 7650 4500 0    50   ~ 0
_
Text Label 7750 4500 0    50   ~ 0
_
Text Label 7850 4500 0    50   ~ 0
_
Text Label 7950 4500 0    50   ~ 0
_
Text Label 8050 4500 0    50   ~ 0
_
Text Label 8150 4500 0    50   ~ 0
_
Text Label 8250 4500 0    50   ~ 0
_
Text Label 8350 4500 0    50   ~ 0
_
Text Label 8450 4500 0    50   ~ 0
_
Text Label 8600 4500 2    50   ~ 0
_
Text Label 8650 4500 0    50   ~ 0
_
Text Label 8750 4500 0    50   ~ 0
_
Text Label 8850 4500 0    50   ~ 0
_
Text Label 8950 4500 0    50   ~ 0
_
Text Label 9050 4500 0    50   ~ 0
_
Text Label 9150 4500 0    50   ~ 0
_
Text Label 9250 4500 0    50   ~ 0
_
Text Label 9350 4500 0    50   ~ 0
_
Text Label 9450 4500 0    50   ~ 0
_
Text Label 9550 4400 1    50   ~ 0
_
Text Label 9550 4300 1    50   ~ 0
_
Text Label 9550 4200 1    50   ~ 0
_
Text Label 9550 4100 1    50   ~ 0
_
Text Label 9550 4000 1    50   ~ 0
_
Wire Wire Line
	9550 3800 9550 4500
Wire Wire Line
	2100 3800 2100 5350
Wire Wire Line
	2300 3800 2300 5350
Wire Wire Line
	9650 1400 9650 2500
Text Label 2300 5350 1    50   ~ 0
_
Text Label 1900 5350 1    50   ~ 0
_
$Comp
L Ladebox:Netzteil P1
U 1 1 5BF09E6C
P 4200 5200
F 0 "P1" H 4200 5300 50  0000 C CNN
F 1 "Netzteil" H 4200 5200 50  0000 C CNN
F 2 "" H 4200 5200 50  0001 C CNN
F 3 "" H 4200 5200 50  0001 C CNN
F 4 "12 V, 8 W" H 4200 5100 50  0000 C CNN "Ausgang"
	1    4200 5200
	1    0    0    -1  
$EndComp
Connection ~ 9650 2500
Wire Wire Line
	9650 2500 9650 3000
$Comp
L Ladebox:Relay_SPST R1
U 1 1 5B86A674
P 4250 3400
F 0 "R1" H 3900 3225 50  0000 R CNN
F 1 "Relais" H 3900 3325 60  0000 R CNN
F 2 "" H 4250 3400 50  0001 C CNN
F 3 "" H 4250 3400 50  0001 C CNN
F 4 "Spule: 12 V/DC" H 3900 3575 45  0000 R CNN "Spannung"
F 5 "min. 1 A" H 3900 3450 60  0000 R CNN "Schaltstrom"
	1    4250 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	4000 3800 4000 3900
Wire Wire Line
	4450 3800 4450 3900
$Comp
L Ladebox-2-rescue:D-Device D1
U 1 1 5B87D2D0
P 5700 3400
F 0 "D1" V 5654 3479 50  0000 L CNN
F 1 "1N4007" V 5745 3479 50  0000 L CNN
F 2 "" H 5700 3400 50  0001 C CNN
F 3 "~" H 5700 3400 50  0001 C CNN
	1    5700 3400
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 3250 5700 2900
Wire Wire Line
	5700 3550 5700 3900
Wire Wire Line
	7250 2900 7250 5400
Wire Wire Line
	7250 5400 6600 5400
$Comp
L power:Earth #PWR03
U 1 1 5B88AEC8
P 5050 5550
F 0 "#PWR03" H 5050 5300 50  0001 C CNN
F 1 "Earth" H 5050 5400 50  0001 C CNN
F 2 "" H 5050 5550 50  0001 C CNN
F 3 "~" H 5050 5550 50  0001 C CNN
	1    5050 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 5300 5050 5300
Wire Wire Line
	5050 5300 5050 5550
Wire Wire Line
	5050 5300 5600 5300
Connection ~ 5050 5300
Wire Wire Line
	3050 5300 3700 5300
Wire Wire Line
	4450 2900 4450 3000
Wire Wire Line
	3700 5100 3550 5100
Wire Wire Line
	4100 2900 4100 3000
Text Notes 8500 1700 2    79   ~ 0
Umschalter zur Wahl\nzwischen den beiden\nAnschlusssteckern\n3 × Ein-Aus-Ein
Text Notes 6550 3350 2    79   ~ 0
Freilauf-\ndioden
Wire Wire Line
	1900 4300 1900 5350
Connection ~ 1900 4300
Wire Wire Line
	1700 4500 2500 4500
Connection ~ 2500 4500
$Comp
L Ladebox:Schalter S1
U 1 1 5BCB6AE3
P 6250 1750
F 0 "S1" H 6950 1900 50  0000 L CNN
F 1 "Schalter" H 6950 1800 50  0000 L CNN
F 2 "" H 6260 1750 50  0001 C CNN
F 3 "" H 6260 1750 50  0001 C CNN
F 4 "min. 1 A" H 6950 1700 50  0000 L CNN "Schaltstrom"
F 5 "250 V/AC" H 6950 1600 50  0000 L CNN "Schaltspannung"
	1    6250 1750
	1    0    0    -1  
$EndComp
Connection ~ 7250 2900
Wire Wire Line
	6800 2500 9650 2500
Wire Wire Line
	6700 950  3050 950 
Wire Wire Line
	6800 2500 6800 2100
Wire Wire Line
	6600 2100 6600 2500
Wire Wire Line
	1900 1350 1900 2300
Wire Wire Line
	1700 1350 1700 2500
Wire Wire Line
	6150 2300 1900 2300
Connection ~ 1900 2300
Wire Wire Line
	1900 2300 1900 3000
Wire Wire Line
	6600 2500 1700 2500
Connection ~ 1700 2500
Wire Wire Line
	1700 2500 1700 3000
Wire Wire Line
	6150 2300 6150 2100
Wire Wire Line
	6350 2100 6350 2300
Wire Wire Line
	5900 2100 5900 2900
Wire Wire Line
	5700 2900 5700 2100
Wire Wire Line
	5800 1350 5800 1400
Wire Wire Line
	6250 1150 6250 1400
Wire Wire Line
	3550 1150 6250 1150
Wire Wire Line
	3550 1850 3550 3900
Wire Wire Line
	4000 3900 3550 3900
Wire Wire Line
	4100 2900 3750 2900
Wire Wire Line
	3750 2900 3350 3250
Wire Wire Line
	5350 1350 5800 1350
Wire Wire Line
	7750 3000 7750 2300
$Comp
L Ladebox:Relay_SPST R3
U 1 1 5B6BBDD0
P 9400 3400
F 0 "R3" H 9800 3575 50  0000 L CNN
F 1 "Relais" H 9800 3475 60  0000 L CNN
F 2 "" H 9400 3400 50  0001 C CNN
F 3 "" H 9400 3400 50  0001 C CNN
F 4 "Spule: 12 V/DC" H 9800 3225 45  0000 L CNN "Spannung"
F 5 "min. 25 A" H 9800 3350 60  0000 L CNN "Schaltstrom"
	1    9400 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 5100 3550 3900
Connection ~ 3550 3900
Wire Wire Line
	4750 5100 5350 5100
Wire Wire Line
	5350 5100 5350 1350
Connection ~ 5350 5100
Wire Wire Line
	5350 5100 5600 5100
Wire Wire Line
	3050 950  3050 3550
Wire Wire Line
	3350 3250 2800 3250
Wire Wire Line
	2800 3550 3050 3550
Connection ~ 3050 3550
Wire Wire Line
	3050 3550 3050 5300
Wire Wire Line
	7650 4300 7650 3800
Connection ~ 7750 2300
Wire Wire Line
	7750 2300 9400 2300
Connection ~ 8100 2900
Wire Wire Line
	8100 2900 9200 2900
Connection ~ 8100 3900
Wire Wire Line
	8100 3900 9200 3900
Wire Wire Line
	7250 2900 8100 2900
Wire Wire Line
	6350 2300 7750 2300
Wire Wire Line
	1900 4300 7650 4300
Connection ~ 5700 2900
Connection ~ 5700 3900
Wire Wire Line
	4450 3900 5700 3900
Wire Wire Line
	4450 2900 5700 2900
Text Label 7750 3000 1    50   ~ 0
_
Text Label 9650 2950 1    50   ~ 0
_
Text Label 9550 3900 1    50   ~ 0
_
Text Label 9550 4500 1    50   ~ 0
_
Text Label 7650 3950 1    50   ~ 0
_
Text Label 7650 3850 1    50   ~ 0
_
Text Label 7750 2850 3    50   ~ 0
_
Text Label 2300 6450 1    50   ~ 0
_
Text Label 2300 6550 1    50   ~ 0
_
Text Label 2300 6650 1    50   ~ 0
_
Text Label 2300 6750 1    50   ~ 0
_
Text Label 2500 6400 1    50   ~ 0
_
Text Label 2500 6500 1    50   ~ 0
_
Text Label 2500 6600 1    50   ~ 0
_
Text Label 2500 6700 1    50   ~ 0
_
Text Label 2100 6700 1    50   ~ 0
_
Text Label 2100 6600 1    50   ~ 0
_
Text Label 2100 6500 1    50   ~ 0
_
Text Label 2100 6400 1    50   ~ 0
_
Text Label 1900 6450 1    50   ~ 0
_
Text Label 1900 6550 1    50   ~ 0
_
Text Label 1900 6650 1    50   ~ 0
_
Text Label 1900 6750 1    50   ~ 0
_
Text Label 2300 2950 1    50   ~ 0
_
Text Label 2100 3000 1    50   ~ 0
_
Text Label 1900 2950 1    50   ~ 0
_
Text Label 1700 3000 1    50   ~ 0
_
Text Label 1700 2900 1    50   ~ 0
_
Text Label 1700 2800 1    50   ~ 0
_
Text Label 1700 2700 1    50   ~ 0
_
Text Label 1700 2600 1    50   ~ 0
_
Text Label 1700 2500 1    50   ~ 0
_
Text Label 1700 2400 1    50   ~ 0
_
Text Label 1700 2300 1    50   ~ 0
_
Text Label 1700 2200 1    50   ~ 0
_
Text Label 1700 2100 1    50   ~ 0
_
Text Label 1700 2000 1    50   ~ 0
_
Text Label 1700 1900 1    50   ~ 0
_
Text Label 1700 1800 1    50   ~ 0
_
Text Label 1700 1700 1    50   ~ 0
_
Text Label 1700 1600 1    50   ~ 0
_
Text Label 1700 1500 1    50   ~ 0
_
Text Label 1700 1400 1    50   ~ 0
_
Text Label 1900 1450 1    50   ~ 0
_
Text Label 1900 1550 1    50   ~ 0
_
Text Label 1900 1650 1    50   ~ 0
_
Text Label 1900 1750 1    50   ~ 0
_
Text Label 1900 1850 1    50   ~ 0
_
Text Label 1900 1950 1    50   ~ 0
_
Text Label 1900 2050 1    50   ~ 0
_
Text Label 1900 2150 1    50   ~ 0
_
Text Label 1900 2250 1    50   ~ 0
_
Text Label 1900 2350 1    50   ~ 0
_
Text Label 1900 2450 1    50   ~ 0
_
Text Label 1900 2550 1    50   ~ 0
_
Text Label 1900 2650 1    50   ~ 0
_
Text Label 1900 2750 1    50   ~ 0
_
Text Label 1900 2850 1    50   ~ 0
_
Text Label 2100 2900 1    50   ~ 0
_
Text Label 2100 2800 1    50   ~ 0
_
Text Label 2100 2700 1    50   ~ 0
_
Text Label 2100 2600 1    50   ~ 0
_
Text Label 2100 2400 1    50   ~ 0
_
Text Label 2100 2200 1    50   ~ 0
_
Text Label 2100 2100 1    50   ~ 0
_
Text Label 2100 2000 1    50   ~ 0
_
Text Label 2100 1900 1    50   ~ 0
_
Text Label 2100 1800 1    50   ~ 0
_
Text Label 2100 1700 1    50   ~ 0
_
Text Label 2100 1600 1    50   ~ 0
_
Text Label 2100 1500 1    50   ~ 0
_
Text Label 2100 1400 1    50   ~ 0
_
Text Label 2300 1450 1    50   ~ 0
_
Text Label 2300 1550 1    50   ~ 0
_
Text Label 2300 1650 1    50   ~ 0
_
Text Label 2300 1750 1    50   ~ 0
_
Text Label 2300 1850 1    50   ~ 0
_
Text Label 2300 1950 1    50   ~ 0
_
Text Label 2300 2050 1    50   ~ 0
_
Text Label 2300 2150 1    50   ~ 0
_
Text Label 2300 2250 1    50   ~ 0
_
Text Label 2300 2350 1    50   ~ 0
_
Text Label 2300 2450 1    50   ~ 0
_
Text Label 2300 2550 1    50   ~ 0
_
Text Label 2300 2650 1    50   ~ 0
_
Text Label 2300 2750 1    50   ~ 0
_
Text Label 2300 2850 1    50   ~ 0
_
Text Label 2100 2450 3    50   ~ 0
_
Text Label 2100 2250 3    50   ~ 0
_
Wire Wire Line
	5900 2900 6950 2900
Wire Wire Line
	5700 3900 6100 3900
Wire Wire Line
	6950 3250 6950 2900
Connection ~ 6950 2900
Wire Wire Line
	6950 2900 7250 2900
Wire Wire Line
	6950 3550 6950 3900
Connection ~ 6950 3900
Wire Wire Line
	6950 3900 8100 3900
Wire Wire Line
	6700 3900 6950 3900
Wire Wire Line
	6100 3900 6100 4050
Wire Wire Line
	6100 4050 6800 4050
Wire Wire Line
	6800 5050 6600 5050
Connection ~ 6100 3900
Wire Wire Line
	6100 3900 6400 3900
Wire Wire Line
	2500 4500 9550 4500
Wire Wire Line
	6800 4050 6800 5050
$Comp
L Ladebox-2-rescue:D-Device D2
U 1 1 5FCA8C54
P 6950 3400
F 0 "D2" V 6904 3479 50  0000 L CNN
F 1 "1N4007" V 6995 3479 50  0000 L CNN
F 2 "" H 6950 3400 50  0001 C CNN
F 3 "~" H 6950 3400 50  0001 C CNN
	1    6950 3400
	0    -1   1    0   
$EndComp
$Comp
L device:D D3
U 1 1 5FCDB9E8
P 6550 3900
F 0 "D3" H 6550 4116 50  0000 C CNN
F 1 "1N4007" H 6550 4025 50  0000 C CNN
F 2 "" H 6550 3900 50  0001 C CNN
F 3 "" H 6550 3900 50  0001 C CNN
	1    6550 3900
	1    0    0    -1  
$EndComp
$EndSCHEMATC
