# Mobile Elektroauto-Ladebox (V2) mit Arduino

Hier stelle ich meine mobile Ladebox mit Typ2-Steckdose für Elektrofahrzeuge vor, welche für Ladeleistungen bis 22 kW (32 A dreiphasig) ausgelegt ist. Vom Gehäuse über die Elektronik (EVSE) bis hin zur Software (bzw. Firmware) ist alles selbst entwickelt bzw. zusammengebaut. Für die Steuerung ist ein Arduino Nano Board (mit Atmega328P Mikrocontroller) zuständig. 

**Zusammenbau und Betrieb einer solchen Ladebox erfolgen auf eigene Gefahr! Wird die Planung und der Bau einer Ladebox nicht sorgfältig und fachgerecht durchgeführt oder werden die nötigen Sicherheitsvorkehrungen nicht umgesetzt, besteht bei der Verwendung der Ladebox Lebensgefahr durch die Entstehung von Bränden oder elektrischen Schlägen!**

![ZOE Box](/Bilder/ZOE%20Box.jpg)

Die Ladebox verfügt über folgende Funktionen / Merkmale:
- Sie verfügt zusätzlich zum üblichen CEE32 rot Stecker über einen CEE16 blau Stecker, somit entfällt das Hintereinanderstecken mehrerer Adapterkabel.
- Flexible Wahl des Ladestroms per Taster und LEDs in fünf Schritten: 10 A, 14 A, 16 A, 20 A, 32 A (die Werte sind im Programmcode anpassbar).
- Die Verriegelung der Typ2-Steckdose verhindert nicht nur ein Abziehen des Typ2-Steckers unter Last, sondern schützt auch die Ladebox vor Diebstahl. Hierzu  wird die Steckdose nicht automatisch bei Stromausfall (bzw. Trennen des Netzsteckers) entriegelt, wie es bei gängigen Ladesteuerungen der Fall ist, sondern erst nach Trennen der Typ2-Steckverbindung am Elektrofahrzeug.
- Ladestrom-Signalisierung nach SAE J1772 bzw. IEC 61851 (siehe https://www.goingelectric.de/wiki/Typ2-Signalisierung-und-Steckercodierung/) mit +/- 12V Rechtecksignal und Erkennung aller möglicher (mir bekannter) Signalisierungsfehler, z.B. Diodenfehler, Kurzschluss/"Status E", undefinierte Spannung. Die Art des Fehlers wird über Blinkimpulse der Fehler-LED ausgegeben.
- Schutz vor Gleichfehlerströmen ab 6 mA mittels Fehlerstromschutzschalter Typ A-EV (teuerstes Bauteil der Ladebox, aber Sicherheit geht vor).
- Automatische Fortsetzung des Ladevorgangs bei kurzzeitiger Unterbrechung der Stromzufuhr. Hierzu wird die Wahl des Ladestroms und des Anschlusses im nichtflüchtigen Speicher (EEPROM) des Atmega328P abgelegt.
- Cooles Lauflicht um die Typ2-Steckdose während des Ladevorgangs :-)

Die Ladebox dient zur Ladung an folgenden Steckdosen:
- CEE32 rot bis 22 kW
- CEE16 rot bis 11 kW (über Adapterkabel)
- CEE16 blau bis 3,7 kW
- Schuko bis 2,3 kW (über Adapterkabel)

Hier auf GitHub stelle ich sämtliche benötigte Dateien zur Verfügung, mit der die Box nachgebaut bzw. weiterentwickelt werden kann:
- Schaltplan im pdf-Format (zur Vorschau Datei anklicken) sowie die zugehörigen KiCAD-Dateien
- Programmcode für die Arduino-IDE zum Flashen des Mikrocontrollers (ich habe mich bemüht, alles zu kommentieren, sodass alles selbsterklärend sein sollte)
- Excel-Liste mit allen benötigten Teilen und Links zu Bezugsquellen (kann auch im Browser angesehen werden: https://1drv.ms/x/s!AtqpgKTCo4sfsErbr3rMgM7kWvw-?e=OKO3dO)
- CAD-Datei zum 3D-Druck der Steckerhalterung für CEE32 rot und CEE16 blau (zur Vorschau Datei anklicken)

Bei Fragen und Anregungen stehe ich jederzeit hier, auf GoingElectric.de (Benutzername kepppfeff-ZOE) sowie unter kepppfeff@t-online.de zur Verfügung. 

Meine Empfehlungslinks/-codes:
- &Charge (Bonusprogramm): 10 Freikilometer für jeden über den Link https://and-charge.com/#/invite-friends?code=VKUBDE
- Bonnet App (Ladestrom): 17,55 € Rabatt mit meinem Code RZV554
- JUICIFY (THG-Prämie, Auszahlung innerhalb weniger Tage): HTTPS://JUICIFY.GREEN/?REF=51D5DF

![Rückseite](/Bilder/ZOE%20Box%20R%C3%BCckseite.JPG)

### Gehäuse und Bedienkonzept

Das Gehäuse habe ich aus Sperrholz gefertigt und mit 6 Dachlattenstücken verstärkt (alles geklebt und genagelt). Die Kiste hat die Maße 28 cm × 14 cm × 8,5 cm. Die rückseitige Platte ist mit 6 Schrauben befestigt und lässt sich abnehmen. Ich habe diese Platte zwar mit Schaumstoffstreifen abgedichtet, bin mir aber nicht ganz sicher, ob die Box wasserdicht (im Sinne von spritzwassergeschützt) ist, daher verwende ich sie sicherheitshalber nicht bei Regen im Freien. 
Seitlich habe ich eine 3D-gedruckte Halterung angebracht, in welcher die beiden Stecker Platz finden. Leider steht dadurch die Box etwas wacklig bzw. kippt leicht um. Das sind die beiden Gründe, weshalb ich bin mit dem Gehäuse insgesamt noch nicht ganz zufrieden bin, aber ich habe bisher noch keine bessere Lösung gefunden.

![Vorderseite](/Bilder/ZOE%20Box%20Vorderseite%20neu.jpeg)

An der Vorderseite der Ladebox sind die Bedienelemente und die Typ2-Steckdose angeordnet. Links oben befinden sich zwei Drucktaster zum Einstellen der gewünschten Stromstärke und zum Starten des Ladevorgangs. Mit dem großen Drehschalter rechts wird zwischen den beiden Steckern gewählt. Dieser ist eigentlich überdimensioniert, ist aber ein Relikt von Version 1 der Ladebox, bei welcher der gesamte Ladestrom über diesen Schalter floss. Bei Version 2 fließt nur noch der Versorgungsstrom für die Steuerelektronik über den Schalter, daher würde nun auch ein kleinerer Schalter ausreichen. In der Teile-Liste habe ich einen kompakten Kippschalter anstatt des Drehschalters hinterlegt.

Als Anzeigeelemente stehen 8 grüne LEDs zur Verfügung, welche ringförmig um die Typ2-Steckdose angeordnet sind. 5 davon stehen für die 5 möglichen Stromstärken und die restlichen 3 zeigen den Status der Ladebox an. 

Die Bedienung gestaltet sich folgendermaßen:

 - Über den Schalter wählt man aus, ob einphasig über CEE16 blau oder dreiphasig über CEE32 rot geladen werden soll. 
 - Anschließend wählt man über den unteren Taster die gewünschte Stromstärke, welche über die LEDs angezeigt wird. Bei Anschluss über CEE32 rot ist 16 A voreingestellt. Bei Betrieb über CEE16 blau ist 10 A voreingestellt und es kann maximal 16 A gewählt werden. Alle genannten Werte sind natürlich im Arduino-Programmcode anpassbar. Ist durch den gemessenen Ladekabel-Kodierwiderstand der Ladestrom begrenzt, kann natürlich nur ein entsprechend niedrigerer Ladestrom vom Benutzer gewählt werden, was auch durch ein Blinken der Auto-LED signalisiert wird.
 ![Auswahl Ladestrom](/Bilder/IMG_20201122_153244%5B1%5D.jpg)
 - Sobald ein Elektroauto angeschlossen ist (d.h. CP-Spannung auf +9 V), leuchtet die LED mit dem Auto-Symbol.
 - Um den Ladevorgang zu starten, drückt man den oberen Taster (geht nur, wenn ein Auto angeschlossen ist). Daraufhin wird der Typ2-Stecker verriegelt und das Rechtecksignal wird gestartet, mit einer Pulsweite entsprechend der gewählten Stromstärke.
 - Die Ladebox wartet, bis das Elektroauto die Ladung anfordert (d.h. CP-Spannung auf +6 V). Dies dauert meist wenige Sekunden. Währenddessen blinkt die Sanduhr-LED.
 - Sobald das Elektroauto die Ladung anfordert, wird die Stromversorgung zum E-Auto eingeschaltet: bei dreiphasiger Ladung über ein 4-poliges 40-A-Schütz und bei einphasiger Ladung über zwei 30-A-Relais. Ab jetzt kann die Ladestrom-Einstellung nicht mehr geändert werden, wodurch eine Manipulation verhindert wird (Brandgefahr).
 - Wenn das Elektroauto fertig geladen hat bzw. der Ladevorgang manuell am Auto beendet wurde (d.h. CP-Spannung auf +9 V), wird das Schütz bzw. werden die Relais deaktiviert und das Lauflicht erlischt, stattdessen leuchten alle LEDs auf. Der Typ2-Stecker wird aber noch nicht entriegelt; so ist sichergestellt, dass die Ladebox nicht ohne weiteres geklaut werden kann. Das CP-Rechtecksignal läuft weiter, sodass das Elektroauto jederzeit die Ladung erneut anfordern kann (Vorklimatisierung müsste somit auch möglich sein, habe ich aber noch nie getestet).
 - Sobald der Ladestecker am Elektroauto abgezogen wurde (d.h. CP-Spannung auf +12 V), wird auch die Typ2-Steckdose der Ladebox entriegelt. Die Ladebox muss hierzu weiterhin am Strom hängen, erst danach kann der netzseitige Stecker gezogen werden.
![Alle LEDs leuchten](/Bilder/IMG_20201122_153349%5B1%5D.jpg)

### Elektrik + Elektronik

Der Zusammenbau von netzspannungsführenden Teilen darf grundsätzlich nur von ausgebildeten Fachkräften durchgeführt werden. An jeder Stelle muss sorgfältig auf eine ausreichende Dimensionierung von elektrischen Komponenten und Leitungsquerschnitten und eine Minimierung von Übergangswiderständen geachtet werden. Bei flexiblen Leitern ist die Verwendung von Aderendhülsen notwendig (Ausnahme Federklemmen, z.B. WAGO). Vor Inbetriebnahme muss durch Messungen mit entsprechendem Messequipment sichergestellt werden, dass alle relevanten Anforderungen eingehalten werden. 

Bei den Leitungen für 32 A habe ich einen Leitungsquerschnitt von 4 mm² verwendet. Dies entspricht auch dem serienmäßigen Typ2-Ladekabel unseres Elektroautos (Renault ZOE Q210). Da das Auto in unserem Fall eine vergleichsweise geringe Akkukapazität hat, kann es maximal eine Stunde lang mit den vollen 22 kW laden, daher halte ich diesen Querschnitt für in Ordnung. Wenn die 22 kW aber auch für längere Zeit bereitgestellt werden sollen, würde ich zu einen Leitungsquerschnitt von 6 mm² raten. 

Die Elektronik habe ich entsprechend der Seiten des Schaltplans auf zwei Lochrasterplatinen verteilt: eine Netzplatine und eine Steuerplatine. Die Netzplatine enthält somit lediglich die drei 230-V-Relais, eine Schmelzsicherung und drei Dioden. Um netzspannungsführende Leiterbahnen herum habe ich immer zwei Lochreihen Abstand gelassen und dort die Kupferpads weggefräst, um eine ausreichende Isolierung sicherzustellen.

Die Steuerplatine enthält sämtliche Elektronik von Schaltplan-Seite 2. Hier ein Foto der Platine kurz vor der Fertigstellung. Es fehlen noch der 5V-Spannungsregler, der 4700-uF-Kondensator für die Steckerverriegelung und die einsteckbaren Bauteile (Arduino, Ladungspumpe, Komparator, OpAmp).

![Steuerplatine](/Bilder/20190227_115933.jpg)

Weitere Fotos vom Inneren der Box habe ich im Moment nicht, reiche ich aber bei Gelegenheit nach. In der oberen Hälfte der Ladebox befinden sich die beiden Platinen und das Netzteil. Die Steuerplatine ist hierbei so montiert, dass der USB-Anschluss des Arduino Boards nach Abnehmen der hinteren Abdeckung zugänglich ist, sodass einfach Firmware-Updates aufgespielt werden können. In der unteren Hälfte der Ladebox ist eine Hutschiene angeschraubt, an welcher das Schütz und der Fehlerstromschutzschalter befestigt sind. 

Noch ein Hinweis zur Rechteck-Signalisierung: Die Schaltung wurde bisher mit einer Renault ZOE Q210 sowie mit einem Hyundai Ioniq Elektro (28 kWh) getestet und funktioniert seit mehr als zwei Jahren sehr zuverlässig. Da das Rechtecksignal allerdings nicht mit einer Frequenz von 1 kHz erzeugt wird (wie es die SAE J1772 bzw. IEC 61851 vorsieht), sondern nur mit 976 Hz, könnte es andere Fahrzeuge geben, die es mit der Frequenz sehr genau nehmen und die Ladung verweigern (auch wenn ich das eher für unwahrscheinlich halte). Prinzipiell müsste es möglich sein, den Atmega328P durch das Ausnutzen weiterer Register (nach Recherche im Datenblatt) dazu zu bringen, näher an die 1 kHz heranzukommen. Da es bei unserem Elektroauto aber mit den 976 Hz einwandfrei funktioniert, habe ich mich nicht weiter damit befasst.

### Flashen (Aufspielen der Firmware) und Testen

Zum Flashen des Mikrocontrollers muss das Arduino-Board lediglich über ein Mini-USB-Kabel mit einem PC verbunden und der Programmcode (.ino) mit der Arduino IDE geöffnet werden. Anleitungen zur genauen Vorgehensweise gibt es zuhauf im Internet. Der Mikrocontroller kann, muss aber dafür noch nicht mit der restlichen Schaltung verbunden sein, er wird dann über USB mit Strom versorgt. 

Um zu überprüfen, ob das Programm grundsätzlich ausgeführt wird, sollte zunächst in Zeile 20 des Programmcodes das Debugging aktiviert werden ("false" durch "true" ersetzen). Dadurch gibt der Mikrocontroller Statusinformationen über die serielle Schnittstelle aus (also über das USB-Kabel). Diese können in der Arduino IDE über den Button mit der Lupe (rechts oben) quasi in Echtzeit angezeigt werden.

Vor dem Zusammenbau der Ladebox muss die aufgebaute Schaltung noch getestet und ggf. kalibriert werden. Hierzu muss die Elektronik lediglich mit 12 V versorgt werden, ein Anschluss an Netzspannung ist nicht erforderlich, auch das Schütz wird nicht benötigt. Die korrekte Schaltfunktion der Relais kann mit einem Multimeter überprüft werden. Dennoch sollten alle LEDs und Taster, der Wahlschalter sowie der Verriegelungsaktuator angeschlossen werden, damit sämtliche Funktionen ausprobiert und getestet werden können. Um Ladevorgänge gefahrlos, aber realistisch simulieren zu können, muss der Anschluss eines Ladekabels an PP und eines Elektroautos an CP "vorgetäuscht" werden. Dazu werden eine Standard-Diode (z.B. 1N4007) und drei Widerstände mit den Werten 220 Ω, 1,3 kΩ und 2,7 kΩ benötigt (besser weitere mögliche Widerstandswerte für PP), welche entsprechend https://www.goingelectric.de/wiki/Typ2-Signalisierung-und-Steckercodierung/ an PP und CP der Steuerplatine angeschlossen werden. Ich habe diese Bauteile auf einem Breadboard (Steckplatine) verschaltet, um verschiedene Szenarien durchspielen zu können und auch Fehler simulieren zu können. 

Um die Spannungsmessung zu kalibrieren, muss parallel zum Testaufbau die Debug-Schnittstelle ausgelesen werden (über USB-Kabel) und die ausgegebenen Messwerte für +12 V und -12 V (für -12V muss ein Ladevorgang simuliert werden) mit den tatsächlichen Versorgungsspannungen (mit Multimeter messen) verglichen werden. Anschließend im Programmcode die Werte CP_PLUS_FAKTOR und CP_MINUS_FAKTOR (Zeile 42 / 43) so anpassen, dass die Messwerte möglichst genau übereinstimmen und das ganze dann nochmal nachprüfen.

Vor dem Einbau der Elektronik in die Ladebox nicht vergessen, die Debug-Ausgabe in Zeile 20 des Programmcodes wieder zu deaktivieren, da diese die Reaktionsgeschwindigkeit des Mikrocontrollers herabsetzt.

### Fehlerzustände

Erkennt die Ladebox einen Fehler, wird der Ladevorgang sofort unterbrochen, das CP-Signal auf -12 V gesetzt und die Art des Fehlers (bei mehreren Fehlern nur des zuerst erkannten) wird über Blinkimpulse der Fehler-LED ausgegeben:
- 1x blinken: Maximaltemperatur überschritten (Temperatur wird über den internen Temperatursensor des ATmega328P gemessen)
- 2x blinken: Mindesttemperatur unterschritten (vermutlich Temperatursensor defekt oder Auswertung fehlerhaft)
- 3x blinken: Verriegelung funktioniert nicht. In diesem Fall wird alle 30 Sekunden erneut versucht, die Steckdose zu verriegeln, bei Erfolg wird automatisch der Ladevorgang gestartet
- 4x blinken: Ladekabel-Kodierwiderstand (PP) entspricht keinem definierten Wert oder hat sich zu einem anderen verändert
- 5x blinken: Am Pilotsignal wurde ein Fahrzeug erkannt, es ist jedoch kein Ladekabel-Kodierwiderstand vorhanden.
- 6x blinken: Der Status des Elektrofahrzeugs konnte innerhalb einer im Programmcode definierbaren Zeitdauer (CP_TIMEOUT) nicht ermittelt werden. 
- 7x blinken: Am Pilotsignal wurde eine undefinierte Spannung erkannt.
- 8x blinken: Am CP-Pin wurde eine zu hohe Spannung gemessen (größer als +12,5 V oder kleiner als -12,5 V)
- 9x blinken: Diodenfehler (negativer Pegel der CP-Spannung ist ungleich -12 V)
- 10x blinken: CP-Pin ist mit GND bzw. PE verbunden ("Status E")
- 11x blinken: Das Elektroauto ist plötzlich nicht mehr angeschlossen, ohne dass der Ladevorgang ordnungsgemäß beendet wurde. Bei einigen Elektroautos kann der Ladevorgang gar nicht ordnungsgemäß beendet werden, z.B. beim Hyundai Ioniq. Der Fehler wird also nach jedem Ausstecken des Ladekabels angezeigt. Ist aber nicht weiter tragisch, ansonsten funktioniert trotzdem alles wie es soll.
- 12x blinken: Der Schalter zur Wahl zwischen ein- und dreiphasiger Ladung wurde während des Betriebs umgestellt.
- 13x blinken: Das Elektroauto fordert eine Belüftung an (CP-Spannung ist +3 V)
