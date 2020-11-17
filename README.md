# Mobile Elektroauto-Ladebox (V2) mit Arduino

Bei diesem Projekt handelt es sich um eine mobile Ladebox mit Typ2-Steckdose für Elektrofahrzeuge. Vom Gehäuse über die Elektronik (auch EVSE genannt) bis hin zur Software (Firmware) habe ich alles selbst entwickelt bzw. zusammengebaut. Für die Steuerung ist ein Arduino Nano Board (mit Atmega328P Mikrocontroller) zuständig. Das Alleinstellungsmerkmal dieser Ladebox ist, dass sie nicht nur über einen CEE32 rot Stecker, sondern zusätzlich über einen CEE16 blau Anschlussstecker verfügt, somit werden weniger hintereinandergesteckte Adapterkabel benötigt.

Die Ladestrom-Signalisierung erfolgt nach SAE J1772 bzw. IEC 61851 mit +/- 12V Rechtecksignal. Nach bestem Wissen und Gewissen werden sämtliche Signalisierungsfehler (z.B. Diodenfehler, Kurzschluss/"Status E", undefinierte Spannung) erkannt und bei Auftreten eines Fehlers der Ladevorgang sofort unterbrochen. Zudem ist für die Abschaltung bei Gleichfehlerströmen ab 6 mA ein Fehlerstromschutzschalter vom Typ A-EV verbaut (welcher zugleich das teuerste Bauteil der Ladebox darstellt).

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

Bei Fragen und Anregungen stehe ich auch unter kepppfeff@t-online.de jederzeit zur Verfügung.
