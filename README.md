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

Im Folgenden eine etwas genauere Beschreibung der Ladebox.

## Gehäuse und Bedienkonzept

Das Gehäuse habe ich aus Sperrholz gefertigt und mit 6 Dachlattenstücken verstärkt (alles geklebt). Die Kiste hat die Maße 28 cm × 14 cm × 8,5 cm. Die rückseitige Platte ist mit 6 Schrauben befestigt und lässt sich so abnehmen. Ich habe diese Platte zwar mit Schaumstoffstreifen abgedichtet, bin ich mir nicht ganz sicher, ob die Box wasserdicht ist, daher verwende ich sie sicherheitshalber niemals bei Regen im Freien. 
Seitlich habe ich eine 3D-gedruckte Halterung angebracht, in welcher die beiden Stecker Platz finden.

An der Vorderseite der Ladebox sind die Bedienelemente und die Typ2-Steckdose angeordnet. Links oben befinden sich zwei Drucktaster zum Einstellen der gewünschten Stromstärke und zum Starten des Ladevorgangs. Mit dem großen Drehschalter rechts wird zwischen den beiden Steckern gewählt. Dieser ist eigentlich überdimensioniert, ist aber ein Relikt von Version 1 der Ladebox, bei welcher der gesamte Ladestrom über diesen Schalter floss. Bei Version 2 fließt nur noch der Versorgungsstrom für die Ladeelektronik über den Schalter (zusammen mit vielen weiteren Verbesserungen). Daher findet man den Drehschalter auch nicht in der Teile-Liste, sondern einen kompakten Kippschalter, der in diesem Fall ausreicht.

Als Anzeigeelemente stehen 9 grüne LEDs zur Verfügung, welche ringförmig um die Typ2-Steckdose angeordnet sind. 5 davon stehen für die 5 möglichen Stromstärken und die restlichen 3 zeigen den Status der Ladebox an. 

Die Bedienung gestaltet sich folgendermaßen:

 - Über den Schalter wird ausgewählt, ob einphasig über CEE16 blau oder dreiphasig über CEE32 rot geladen werden soll. 
 - Anschließend wählt man über den unteren Taster die gewünschte Stromstärke, welche über die LEDs angezeigt wird. Hierbei muss der Anwender beurteilen, wie viel die Elektroinstallation, an der man die Ladebox betreibt, hergibt. Bei den langen Ladezeiten und hohen Stromstärken, die das Laden eines E-Autos erfordert, ist die Brandgefahr nicht zu unterschätzen! Daher sollte man im Zweifelsfall lieber eine deutlich niedrigere Stromstärke einstellen als die Dimensionierung der Sicherungen des Stromkreises erlauben würde.
 - Sobald ein Elektroauto angeschlossen ist (d.h. CP-Spannung auf +9 V), leuchtet die LED mit dem Auto-Symbol.
 - Um den Ladevorgang zu starten, drückt man den oberen Taster. Daraufhin wird der Typ2-Stecker verriegelt und das Rechtecksignal wird gestartet, mit einer Pulsweite entsprechend der eingestellten Stromstärke.
 - Die Ladebox wartet, bis das Elektroauto die Ladung anfordert. Dies dauert meist wenige Sekunden. Währenddessen blinkt die LED mit der Sanduhr.
 - Sobald das Elektroauto die Ladung anfordert, wird die Stromversorgung zum E-Auto eingeschaltet, bei dreiphasiger Ladung über ein 40A-Schütz und bei einphasiger Ladung über zwei 30A-Relais.
 - Während des Ladevorgangs bilden die LEDs ein Lauflicht um die Typ2-Steckdose. Der Ladestrom kann jetzt nicht mehr geändert werden, wodurch eine Manipulation verhindert werden soll.
 - Wenn das Elektroauto fertig geladen hat, wird das Schütz deaktiviert, der Typ2-Stecker aber noch nicht entriegelt, damit die Ladebox nicht ohne weiteres geklaut werden kann. Erst wenn der Ladestecker vom Elektroauto abgezogen wurde, wird auch die Typ2-Steckdose der Ladebox entriegelt.
 
