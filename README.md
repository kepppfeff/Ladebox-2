# Mobile Elektroauto-Ladebox (V2) mit Arduino

Bei diesem Projekt handelt es sich um eine mobile Ladebox mit Typ2-Steckdose für Elektrofahrzeuge. Vom Gehäuse über die Elektronik (EVSE genannt) bis hin zur Firmware des Mikrocontrollers habe ich alles selbst entwickelt bzw. zusammengebaut. Für die Steuerung ist ein Arduino Nano Board (mit Atmega328P Mikrocontroller) zuständig.

Die Ladestrom-Signalisierung erfolgt nach SAE J1772 bzw. IEC 61851 mit +/- 12V Rechtecksignal. Nach bestem Wissen und Gewissen werden sämtliche Signalisierungsfehler (z.B. Diodenfehler, Kurzschluss/"Status E", undefinierte Spannung) erkannt und bei Auftreten eines Fehlers der Ladevorgang sofort unterbrochen. Zudem ist für die Abschaltung bei Gleichfehlerströmen >6mA ein Fehlerstromschutzschalter vom Typ A-EV verbaut.

Die Ladebox dient zur Ladung an folgenden Steckdosen:
- CEE32 rot bis 22 kW
- CEE16 rot bis 11 kW (über Adapterkabel)
- CEE16 blau bis 3,7 kW
- Schuko bis 2,3 kW (über Adapterkabel) 

Das Alleinstellungsmerkmal dieser Ladebox ist, dass bereits zwei Stecker direkt an der Ladebox vorhanden sind, welche ohne Adapter genutzt werden können.  

Hier auf GitHub stelle ich sämtliche benötigte Dateien zur Verfügung, mit der die Box nachgebaut bzw. weiterentwickelt werden kann:
- Schaltplan im pdf-Format sowie die zugehörigen KiCAD-Dateien (nur schematic; ein PCB-Layout gibt es bislang nicht, da ich alles auf Lochrasterplatinen zusammengelötet habe)
- Programmcode für die Arduino-IDE zum Flashen des Mikrocontrollers (ich habe mich bemüht, alles zu kommentieren, sodass alles selbsterklärend sein sollte)
- Excel-Liste mit allen benötigten Teilen
- CAD-Datei zum 3D-Druck der Steckerhalterung für CEE32 rot und CEE16 blau

Bei Fragen und Anregungen stehe ich unter kepppfeff@t-online.de jederzeit zur Verfügung.
