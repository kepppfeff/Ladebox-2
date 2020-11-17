# Mobile Elektroauto-Ladebox (V2) mit Arduino

Hier stelle ich meine mobile Ladebox mit Typ2-Steckdose für Elektrofahrzeuge vor, welche für Ladeleistungen bis 22 kW (32 A dreiphasig) ausgelegt ist. Vom Gehäuse über die Elektronik (auch EVSE genannt) bis hin zur Software (Firmware) habe ich alles selbst entwickelt bzw. zusammengebaut. Für die Steuerung ist ein Arduino Nano Board (mit Atmega328P Mikrocontroller) zuständig. 

Die Ladebox hat folgende Funktionen / Merkmale:
- Sie verfügt zusätzlich zum CEE32 rot Stecker über einen fix angebrachten CEE16 blau Anschlussstecker, somit entfällt das Hintereinanderstecken mehrerer Adapterkabel.
- Flexible Wahl des Ladestroms per Taster und LEDs in fünf Schritten: 10 A, 14 A, 16 A, 20 A, 32 A (selbstverständlich in der Software anpassbar).
- Die Verriegelung der Typ2-Steckdose verhindert nicht nur ein Abziehen des Typ2-Steckers unter Last, sondern schützt auch die Ladebox vor Diebstahl. Hierzu  wird die Steckdose nicht automatisch bei Stromausfall (bzw. Trennen des Netzsteckers) entriegelt, wie es bei gängigen Ladesteuerungen der Fall ist, sondern erst nach Trennen der Typ2-Steckverbindung am Elektrofahrzeug.
- Ladestrom-Signalisierung nach SAE J1772 bzw. IEC 61851 (siehe https://www.goingelectric.de/wiki/Typ2-Signalisierung-und-Steckercodierung/) mit +/- 12V Rechtecksignal und Erkennung aller möglicher (mir bekannter) Signalisierungsfehler, z.B. Diodenfehler, Kurzschluss/"Status E", undefinierte Spannung. Die Art des Fehlers wird über Blinkimpulse der Fehler-LED ausgegeben.
- Schutz vor Gleichfehlerströmen ab 6 mA mittels Fehlerstromschutzschalter Typ A-EV (teuerstes Bauteil der Ladebox).
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

Bei Fragen und Anregungen stehe ich jederzeit hier, auf GoingElectric.de sowie unter kepppfeff@t-online.de zur Verfügung.

Im Folgenden eine etwas genauere Beschreibung der Ladebox.

Das Gehäuse habe ich aus Sperrholz gefertigt und mit 6 Dachlattenstücken verstärkt (alles geklebt). Die Kiste hat die Maße 28 cm × 14 cm × 8,5 cm. Die rückseitige Platte ist mit 6 Schrauben befestigt und lässt sich dadurch abnehmen. Ich habe diese Platte zwar mit Schaumstoffstreifen abgedichtet, bin mir aber nicht ganz sicher, ob die Box wasserdicht ist, daher verwende ich sie sicherheitshalber nicht bei Regen im Freien. 
Seitlich habe ich eine 3D-gedruckte Halterung angebracht, in welcher die beiden Stecker Platz finden.

An der Vorderseite der Ladebox sind die Bedienelemente und die Typ2-Steckdose angeordnet. Links oben befinden sich zwei Drucktaster zum Einstellen der gewünschten Stromstärke und zum Starten des Ladevorgangs. Mit dem großen Drehschalter rechts wird zwischen den beiden Steckern gewählt. Dieser ist eigentlich überdimensioniert, ist aber ein Relikt von Version 1 der Ladebox, bei welcher der gesamte Ladestrom über diesen Schalter floss. Bei Version 2 fließt nur noch der Versorgungsstrom für die Ladeelektronik über den Schalter, daher reicht nun auch ein kleineres Modell. In der Teile-Liste habe ich einen Kippschalter anstatt des Drehschalters eingefügt.

Als Anzeigeelemente stehen 9 grüne LEDs zur Verfügung, welche ringförmig um die Typ2-Steckdose angeordnet sind. 5 davon stehen für die 5 möglichen Stromstärken und die restlichen 3 zeigen den Status der Ladebox an. 

Die Bedienung gestaltet sich folgendermaßen:

 - Über den Schalter wählt man aus, ob einphasig über CEE16 blau oder dreiphasig über CEE32 rot geladen werden soll. 
 - Anschließend wählt man über den unteren Taster die gewünschte Stromstärke, welche über die LEDs angezeigt wird. Bei einphasigem Betrieb kann maximal 16 A ausgewählt werden (in der Software anpassbar).
 - Sobald ein Elektroauto angeschlossen ist (d.h. CP-Spannung auf +9 V), leuchtet die LED mit dem Auto-Symbol.
 - Um den Ladevorgang zu starten, drückt man den oberen Taster. Daraufhin wird der Typ2-Stecker verriegelt und das Rechtecksignal wird gestartet, mit einer Pulsweite entsprechend der eingestellten Stromstärke.
 - Die Ladebox wartet, bis das Elektroauto die Ladung anfordert. Dies dauert meist wenige Sekunden. Währenddessen blinkt die Sanduhr-LED.
 - Sobald das Elektroauto die Ladung anfordert, wird die Stromversorgung zum E-Auto eingeschaltet: bei dreiphasiger Ladung über das 40A-Schütz und bei einphasiger Ladung über zwei 30A-Relais. Ab jetzt kann die Ladestrom-Einstellung nicht mehr geändert werden, wodurch eine Manipulation verhindert werden soll.
 - Wenn das Elektroauto fertig geladen hat bzw. der Ladevorgang manuell am Auto beendet wurde, wird das Schütz bzw. werden die Relais deaktiviert und alle LEDs leuchten, der Typ2-Stecker wird aber noch nicht entriegelt. So ist sichergestellt, dass die Ladebox nicht ohne weiteres geklaut werden kann.
 - Sobald der Ladestecker am Elektroauto abgezogen wurde, wird auch die Typ2-Steckdose der Ladebox entriegelt. Die Ladebox muss hierzu weiterhin am Strom hängen, erst danach kann der netzseitige Stecker gezogen werden.
