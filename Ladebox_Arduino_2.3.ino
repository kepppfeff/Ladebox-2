/* 
 *  Hinweis zum Flashen des Mikrocontrollers: Wenn kein Original-Arduino-Board verwendet wird, muss zusätzlich zur Arduino IDE ein Treiber für den
 *  CH340G-Chip installiert werden. Diesen erhält man beispielsweise hier (für Windows): http://iot.fkainka.de/wp-content/uploads/2015/09/CH341SER.zip
 */

#include <EEPROM.h>  // Library zur einfachen Verwendung des nichtflüchtigen Speichers


/*
 *  ####    #    ####    #    ##   ##  ##### ##### ##### ####           ####  ###  #   #  ###  #   # #####
 *  #   #  # #   #   #  # #   # # # #  #       #   #     #   #    |     #   #  #   ##  # #   # #   #   #
 *  ####  #####  ####  #####  #  #  #  ###     #   ###   ####  ---|---  ####   #   # # # #   # #   #   #
 *  #     #   #  #  #  #   #  #     #  #       #   #     #  #     |     #      #   #  ## #   # #   #   #
 *  #     #   #  #   # #   #  #     #  #####   #   ##### #   #          #     ###  #   #  ###   ###    #
 *  
 *  DIE FOLGENDEN WERTE KÖNNEN NACH BEDARF VERÄNDERT WERDEN, Z.B. ZUR INDIVIDUALISIERUNG, FEHLERSUCHE ODER KALIBRIERUNG
 */
// Folgenden Wert zu true ändern, um Statusinformationen über die serielle Schnittstelle ausgeben zu lassen. Dies reduziert allerdings
// die Reaktionsgeschwindigkeit und Sicherheit der Ladebox und sollte daher nur zur Fehlersuche verwendet werden.
#define DEBUG false

// Falls der folgende Wert zu true geändert wird, beendet die Ladebox einen Ladevorgang nicht, wenn ein Fehler erkannt wurde.
// ACHTUNG! Dies sollte nur in Ausnahmefällen zu Testzwecken verwendet werden und der Betrieb muss durchgängig überwacht werden!
// Über die serielle Schnittstelle werden Fehlermeldungen weiterhin ausgegeben, sofern DEBUG auf true gesetzt ist.
#define FEHLER_IGNORIEREN false

// Falls der folgende Wert zu true geändert wird, beendet die Ladebox einen Ladevorgang nicht, wenn das E-Auto eine Belüftung anfordert. 
// Dies ist eigentlich nur für (alte) Elektrofahrzeuge mit Bleiakkumulatoren relevant und darf nur aktiviert werden, wenn die Ladebox ausschließlich im Freien genutzt wird.
#define BELUEFTUNG false

// Wenn der folgende Wert bei false belassen wird, erwartet die Ladebox zunächst den Status +9 V vom E-Auto, bevor sie das PWM-Signal aktiviert. 
// Erst dann kann das E-Auto auf +6 V (oder +3 V) wechseln und somit den Ladevorgang starten. 
// Falls der folgende Wert zu true geändert wird, startet die Ladebox einen Ladevorgang auch dann, wenn bereits ohne PWM-Signal der Status +6 V gemeldet wird.
// Dies ist beispielsweise bei vielen einfachen Typ2-Adaptern (z.B. Typ2 auf Schuko) oder ggf. bei älteren oder umgebauten Elektrofahrzeugen notwendig.
#define ADAPTERKOMPATIBILITAET false

#define CP_TIMEOUT 300  // gibt an, nach welcher Zeit (in Millisekunden) ein Ladevorgang abgebrochen wird, wenn der Status des E-Autos nicht ermittelt werden kann.

// Durch die folgenden Werte werden die ADC-Messwerte (10 Bit, also zwischen 0 und 1023) dividiert, um die Spannung am CP-Pin zu erhalten. Da alle Widerstände und die
// Versorgungsspannungen gewissen Toleranzen unterliegen, ist hier ggf. eine Anpassung erforderlich. Zur Kalibrierung kann sehr gut die Debug-Schnittstelle verwendet werden.
// Damit die Berechnung mit Gleitkommazahlen erfolgt, darf die Nachkommastelle auch bei einem glatten Wert nicht weggelassen werden, also nicht z.B. 74 schreiben, sondern 74.0
#define CP_PLUS_FAKTOR 73.3
#define CP_MINUS_FAKTOR 74.9

#define AN LOW  // gibt an, wie die Pins geschaltet werden müssen, um die LEDs einzuschalten (HIGH oder LOW).

#define DREIPHASIG HIGH  // gibt an, wie das Logiksignal des Wahlschalters interpretiert wird.

#define VERRIEGELT HIGH  // gibt an, wie das Logiksignal vom Verriegelungs-Kontakt interpretiert wird.

// Folgendes Array legt fest, welche fünf verschiedenen Ladestromstärken ausgewählt werden können. 
// Die Werte können individuell angepasst werden, müssen aber in aufsteigender Reihenfolge sortiert sein.
// Es handelt sich um 8-Bit-Werte, d.h. 0 bedeutet 0 % Pulsweite, 255 bedeutet 100 % Pulsweite.
const byte PULSWEITE [5] = {   42,   58,   68,   85,   136   };    // 10 A, 13,5 A, 16 A, 20 A, 32 A

#define MAX_PULSWEITE_EINPHASIG 68  // gibt an, welche maximale Stromstärke bei einphasigem Betrieb eingestellt werden kann. Hier 16 A.

#define START_STROMSTAERKE_EINPHASIG  0  // gibt an, welche Stromstärke bei einphasigem Anschluss voreingestellt ist (Ladevorgang startet nicht selbstständig). Hier 10 A.
#define START_STROMSTAERKE_DREIPHASIG 2  // gibt an, welche Stromstärke bei dreiphasigem Anschluss voreingestellt ist (Ladevorgang startet nicht selbstständig). Hier 16 A.

// Die folgenden Parameter definieren den Temperaturbereich (in Grad Celsius), in welchem ein Ladevorgang durchgeführt werden kann.
// Wichtig: Gemessen wird nicht die "Gehäuseinnentemperatur" der Ladebox, sondern die interne Temperatur des Mikrocontrollers, welche geringfügig abweichen kann.
#define MAX_TEMPERATUR  60  // Bei Überschreitung wird ein Fehler in der Ladebox vermutet, der eine Überhitzung verursacht. Ladevorgang wird abgebrochen.
#define MIN_TEMPERATUR -10  // Bei Unterschreitung wird ein Fehler des Temperatursensors vermutet, welcher behoben werden muss. Ladevorgang wird abgebrochen.

// Werte zur Kalibrierung des Temperatursensors (bei Bedarf im Internet recherchieren, aber normalerweise kann das so bleiben, da die Messung sowieso recht ungenau ist):
#define TEMP_OFFSET 324.3
#define TEMP_GAIN 1.22

// Im Folgenden die Pinbelegung des Arduino Nano Boards.
// Ausgänge sind mit O_ (für Output) gekennzeichnet.
// Digitale Eingänge sind mit I_ (für Input) gekennzeichnet.
// Analoge Eingänge (ADC) sind mit A_ gekennzeichnet.
#define O_LADUNG          A3  // Ansteuerung der Relais bzw. des Schütz zur Stromzufuhr zum Elektrofahrzeug
#define O_CP_SIGNAL        5  // Ausgabe des ±12-V-PWM-Signals am CP-Pin, durch welches dem Elektrofahrzeug die mögliche Ladestromstärke mitgeteilt wird
#define O_LED_WARTEN      13
#define O_LED_AUTO        12
#define O_LED_FEHLER      11
#define O_LED_STROM_0      4  // LED zur Auswahl der unter PULSWEITE[0] definierten Stromstärke
#define O_LED_STROM_1      3  // LED zur Auswahl der unter PULSWEITE[1] definierten Stromstärke
#define O_LED_STROM_2      2  // LED zur Auswahl der unter PULSWEITE[2] definierten Stromstärke
#define O_LED_STROM_3     A5  // LED zur Auswahl der unter PULSWEITE[3] definierten Stromstärke
#define O_LED_STROM_4     A4  // LED zur Auswahl der unter PULSWEITE[4] definierten Stromstärke
#define I_SCHALTER        A2  // Wahlschalter zwischen CEE32 rot (dreiphasig) und CEE16 blau (einphasig)
#define I_VERRIEGELUNG     6  // Zur Messung müssen O_VERRIEGELUNG_A und O_VERRIEGELUNG_B beide LOW (oder INPUT) sein.
#define O_VERRIEGELUNG_A   7
#define O_VERRIEGELUNG_B   8
#define A_CP_PLUS         A6  // Messung positiver Spannungen am CP-Pin zur Ermittlung des Status des Elektrofahrzeugs
#define A_CP_MINUS        A7  // Messung negativer Spannungen am CP-Pin zur Überprüfung der korrekten Kommunikation
#define A_PP              A0  // Messung des im Ladekabel eingebauten Widerstandes zwischen PP und PE
#define I_TASTER_START    10  // Taster zum Starten des Ladevorgangs
#define I_TASTER_STROM     9  // Taster zur Auswahl der gewünschten Stromstärke
// Wenn die Pinbelegung variiert werden soll, müssen folgende Dinge beachtet werden:
// - Pins A6 und A7 sind nur als ADC-Eingänge nutzbar, nicht als digitale I/O.
// - Das Pilotsignal (PWM) kann nur an den Pins 5 oder 6 ausgegeben werden (nur hier steht die benötigte Frequenz zur Verfügung).
// - Bei der Verteilung der LEDs auf die Pins ist auf die maximale Stromtreiberfähigkeit der Ports zu achten: 
//      - Pins 0-4 dürfen zusammen max. 100 mA gegen GND treiben.
//      - Pins 5-13 dürfen zusammen max. 100 mA gegen GND treiben.
//      - Pins A0-A5 dürfen zusammen max. 100 mA gegen GND treiben.
//      - Werden die LEDs (anders als im Schaltplan) aktiv-HIGH betrieben, gelten andere Bedingungen!
//      - Details siehe Datenblatt des ATmega328 unter "Common DC Characteristics".
// - Pin 13 wird vom Arduino-Bootloader beim Einschalten kurzzeitig als Output verwendet. Daher dürfen hier auf keinen Fall Verriegelung oder Relais (O_LADUNG) angeschlossen werden!

// Alle LED-Pins werden zur Ansteuerung des Lauflichts in ein Array übertragen. Hier kann die Reihenfolge verändert werden, um der Anordnung der LEDs zu entsprechen:
const byte O_LED [8] = { O_LED_FEHLER, O_LED_AUTO, O_LED_WARTEN, O_LED_STROM_4, O_LED_STROM_3, O_LED_STROM_2, O_LED_STROM_1, O_LED_STROM_0 };

// Im Folgenden sind die Indizes des EEPROM angegeben, die zur Speicherung der Ladeparameter verwendet werden. Diese sind willkürlich gewählt. 
// Es wird immer 8 mal der gleiche Wert gespeichert, um sicherzugehen, dass der EEPROM einwandfrei funktioniert. 
const byte EEPROM_STROMSTAERKE [8] = { 100, 101, 102, 103, 104, 105, 106, 107 };
const byte EEPROM_WAHLSCHALTER [8] = { 200, 201, 202, 203, 204, 205, 206, 207 };
const byte EEPROM_LADEKABEL [8] = { 300, 301, 302, 304, 305, 306, 307 };


/*
 *  ####   ##### ##### ###  #   #  ### ##### ###  ###   #   #  ##### #   #
 *  #   #  #     #      #   ##  #   #    #    #  #   #  ##  #  #     ##  #
 *  #   #  ###   ###    #   # # #   #    #    #  #   #  # # #  ###   # # #
 *  #   #  #     #      #   #  ##   #    #    #  #   #  #  ##  #     #  ##
 *  ####   ##### #     ###  #   #  ###   #   ###  ###   #   #  ##### #   #
 *  
 *  HIER SOLLTE IN DER REGEL NICHTS VERÄNDERT WERDEN!
 */
// Die LED-Pins zur Auswahl der Ladestromstärke werden für einfache Verarbeitung in ein Array übertragen.
const byte O_LED_STROM [5] = { O_LED_STROM_0, O_LED_STROM_1, O_LED_STROM_2, O_LED_STROM_3, O_LED_STROM_4 };

// Mithilfe der folgenden Fehlercodes kann die Fehlerursache identifiziert werden. So oft blinkt die Fehler-LED (es wird immer nur der jeweils erste erkannte Fehler angezeigt).
#define F_TEMP_MAX         1  // Höchsttemperatur überschritten
#define F_TEMP_MIN         2  // Mindesttemperatur unterschritten (vermutlich Temperatursensor defekt oder Auswertung fehlerhaft)
#define F_VERRIEGELUNG     3  // Verriegelung funktioniert nicht
#define F_PP_UNDEFINIERT   4  // PP-Widerstand entspricht keinem definierten Wert oder hat sich zu einem anderen verändert
#define F_PP_FEHLT         5  // PP-Widerstand fehlt (wenn über CP ein Fahrzeug erkannt wurde)
#define F_CP_TIMEOUT       6  // Der Status des E-Autos konnte innerhalb von CP_TIMEOUT nicht ermittelt werden
#define F_CP_UNDEFINIERT   7  // Keinen definierten Status (des E-Autos) erkannt
#define F_CP_SPANNUNG      8  // Spannung am CP-Pin größer als +12 V oder kleiner als -12 V gemessen
#define F_CP_DIODE         9  // Diodenfehler (beim E-Auto)
#define F_CP_KURZSCHLUSS  10  // CP-Pin mit GND bzw. PE verbunden
#define F_NOTABBRUCH      11  // Elektroauto ist plötzlich nicht mehr angeschlossen und hat vorher nicht den Ladevorgang beendet
#define F_SCHALTER        12  // Der Schalter zur Wahl zwischen ein- und dreiphasiger Ladung wurde während des Betriebs umgestellt
#define F_BELUEFTUNG      13  // Elektroauto fordert Belüftung an (wird natürlich nur als Fehler gewertet, wenn BELUEFTUNG als false definiert ist)

// Kategorien für Messwerte der positiven Spannung an CP (Index für Array CP_Status und Wert für Status_Fahrzeug):
#define PLUS_12_V           0
#define PLUS_9_V            1
#define PLUS_6_V            2
#define PLUS_3_V            3
#define PLUS_UNDEFINIERT    4
#define NICHT_POSITIV       5

// Kategorien für Messwerte der negativen Spannung an CP (Index für Array CP_Status und Wert für Status_Fahrzeug):
#define MINUS_12_V          6
#define MINUS_UNDEFINIERT   7
#define NICHT_NEGATIV       8

// Weitere Kategorie für zu hohe Messwerte der positiven und negativen Spannung an CP (Index für Array CP_Status):
#define ZU_HOHE_SPANNUNG    9

struct Taster {
  int pin;
  byte status = 0;  // 0 bedeutet: Taster nicht gedrückt. 1 bedeutet: Taster wurde soeben gedrückt. 2 bedeutet: Tastendruck verarbeitet, warte auf loslassen des Tasters.
  unsigned long zeit = 0;  // Speichert Millisekunden bei Drücken und Loslassen des Tasters zum Entprellen.
  String name;  // Für Debugging
};


/*
 *  #   #   #    ####  ###   #    ###   #     ##### #   #
 *  #   #  # #   #   #  #   # #   #  #  #     #     ##  #
 *  #   # #####  ####   #  #####  ####  #     ###   # # #
 *   # #  #   #  #  #   #  #   #  #   # #     #     #  ##
 *    #   #   #  #   # ### #   #  ####  ##### ##### #   #
 */
byte Betriebsphase = 0;

uint16_t CP_Plus [100], CP_Minus [100];  // Arrays für die 100-fache Messung der positiven und negativen Spannung am CP-Pin

byte CP_Status[9];  // Zählt, wie viele Messwerte von welcher Kategorie es jeweils gibt.

byte Status_Fahrzeug = 255; // Bei erfolgreicher Messung des Fahrzeugstatus wird dieser hier gespeichert. 
                           //  Mögliche Werte sind PLUS_12_V, PLUS_9_V, PLUS_6_V, PLUS_3_V und MINUS_12_V. 255 bedeutet: Status wurde noch nicht erkannt.
                           
byte Pulsweite;  // Speichert die aktuelle Pulsweite des CP-Signals. 0 bedeutet 0 %, 255 bedeutet 100 %.
byte Ladekabel_max, Ladekabel_max_gespeichert;  // Speichert die maximal mögliche Pulsweite aufgrund der Belastbarkeit des Ladekabels. 255 bedeutet: kein Ladekabel angeschlossen.

byte Stromstaerke; // Wertebereich: 0 bis 4. Speichert die eingestellte Ladestromstärke. Dient als Index für PULSWEITE und O_LED_STROM.

byte Fehlercode = 0;  // 0 bedeutet: kein Fehler. Andere mögliche Werte sind die mit F_ gekennzeichneten Konstanten (siehe oben unter DEFINITIONEN).

unsigned long Millisekunden, gespeicherte_Zeit, letzte_Messung;

uint16_t Verriegelungscounter = 30000;  // Dient der Zeitmessung zur Abschaltung der Verriegelung (180 ms) und zur frühestmöglichen 
                                       //  erneuten Aktivierung des Verriegelungsaktuators (30 s).
                                       
bool Schalterstellung; // Speichert die Position des Wahlschalters (HIGH oder LOW)
bool verriegelt; // Speichert den Status der Verriegelung (true bedeutet verriegelt)

byte Blinkstatus_Auto_LED;  // Dient zum Steuern des dreifachen Blinkens der Auto-LED (in Betriebsphase 1).

Taster Starttaster, Stromtaster;

/*
 *  #    #    #    #   #  ####  #####  ####   ####    ###    ###  ####    #    ##   ##  ##   ##
 *  #    #   # #   #   #  #   #   #    #   #  #   #  #   #  #     #   #  # #   # # # #  # # # #
 *  ######  #####  #   #  ####    #    ####   ####   #   #  #  ## ####  #####  #  #  #  #  #  #
 *  #    #  #   #  #   #  #       #    #      #  #   #   #  #   # #  #  #   #  #     #  #     #
 *  #    #  #   #   ###   #       #    #      #   #   ###    ###  #   # #   #  #     #  #     #
 */

// Vorbereitungsschleife (wird zu Beginn einmal ausgeführt):
void setup() {
  
  // Definiere alle LED-Pins als Ausgang und schalte zum Funktionstest alle LEDs ein:
  for (byte i = 0; i < 8; i++) {
    pinMode( O_LED[i], OUTPUT );
    digitalWrite( O_LED[i], AN );
  }
  // Definiere alle nötigen Pins als Ausgang:
  pinMode( O_LADUNG, OUTPUT ); pinMode( O_CP_SIGNAL, OUTPUT ); pinMode(O_VERRIEGELUNG_A, OUTPUT ); pinMode( O_VERRIEGELUNG_B, OUTPUT );
  // Aktiviere die internen Pull-Up-Widerstände zum Auslesen der Taster:
  pinMode( I_TASTER_STROM, INPUT_PULLUP ); pinMode( I_TASTER_START, INPUT_PULLUP );
  
  if( DEBUG ) Serial.begin(115200);  // Starte ggf. die serielle Schnittstelle.
  
  delay(500); // Warte einen Moment, damit man die LEDs leuchten sieht.
  
  Starttaster.pin = I_TASTER_START;  Stromtaster.pin = I_TASTER_STROM;
  if(DEBUG) {
    Starttaster.name = "Start";  Stromtaster.name = "Strom";
  }

  Schalterstellung = digitalRead(I_SCHALTER);

  // Setze die Frequenz für Timer/Counter0 auf ca. 1 kHz (976 Hz). Dies wird unter anderem für das PWM-Signal an den Pins 5 und 6 verwendet.
  TCCR0B = TCCR0B & 0b11111000 | 0b00000011;
  // Aktiviere Interrupt durch Timer/Counter0, welches einmal pro Millisekunde auslöst:
  OCR0A = 100; // Compare-Register setzen (8-Bit-Wert, willkürlich gewählt)
  TIMSK0 |= (1<<OCIE0A); // Interrupt aktivieren

  bool EEPROM_funktioniert = true;
  // Lese aus, welche Werte im EEPROM gespeichert sind:
  Stromstaerke = EEPROM.read( EEPROM_STROMSTAERKE[0] );
  byte Wahlschalter_gespeichert = EEPROM.read( EEPROM_WAHLSCHALTER[0] );
  Ladekabel_max_gespeichert = EEPROM.read( EEPROM_LADEKABEL[0] );
  
  // Überprüfe, ob alle 8 Bytes den gleichen Wert haben:
  for( byte i = 1; i < 8; i++ ) {
    if( EEPROM.read( EEPROM_STROMSTAERKE[i] ) != Stromstaerke ) EEPROM_funktioniert = false;
    if( EEPROM.read( EEPROM_WAHLSCHALTER[i] ) != Wahlschalter_gespeichert ) EEPROM_funktioniert = false;
    if( EEPROM.read( EEPROM_LADEKABEL[i] ) != Ladekabel_max_gespeichert ) EEPROM_funktioniert = false;
  }
  
  // Überprüfe, ob die Werte Sinn ergeben:
  EEPROM_funktioniert &= ( Stromstaerke < 5 );
  EEPROM_funktioniert &= ( Wahlschalter_gespeichert < 2 );
  EEPROM_funktioniert &= ( Ladekabel_max_gespeichert != 255 );
  EEPROM_funktioniert &= ( Wahlschalter_gespeichert == DREIPHASIG || PULSWEITE[Stromstaerke] <= MAX_PULSWEITE_EINPHASIG );
  EEPROM_funktioniert &= ( PULSWEITE[Stromstaerke] <= Ladekabel_max_gespeichert );
  
  if( EEPROM_funktioniert ) {
    if(DEBUG) {
      Serial.print( "Folgender Betriebszustand ist im EEPROM gespeichert: " );
      if( Wahlschalter_gespeichert == DREIPHASIG ) Serial.print( "drei" );
      else Serial.print( "ein" );
      Serial.print( "phasig, Stromstaerke Stufe " + String(Stromstaerke) + ", Ladekabel-Belastbarkeit: " + String(Ladekabel_max_gespeichert) + "\n" );
    }
    if( Wahlschalter_gespeichert == Schalterstellung ) {
      // Als nächstes soll überprüft werden, ob noch ein E-Auto vom letzten Ladevorgang angeschlossen ist. Falls ja, Ladevorgang automatisch starten.
      Betriebsphase_0();
    } 
    else Betriebsphase_1();  // Den Benutzer die gewünschte Stromstärke einstellen und den Ladevorgang starten lassen.
  } 
  else {
    debug( "Keine oder fehlerhafte Werte im EEPROM gespeichert!\n" );
    Betriebsphase_1();  // Den Benutzer die gewünschte Stromstärke einstellen und den Ladevorgang starten lassen.
  }

  letzte_Messung = millis();
}


// Hauptschleife (wird anschließend ständig wiederholt):
void loop() {
  
  // Messung des PP-Widerstands:
  uint16_t PP_Messwert = analogRead( A_PP );
  if( PP_Messwert > 1020 )                          Ladekabel_max = 255;   // Kein Ladekabel angeschlossen.
  else if( PP_Messwert > 558 && PP_Messwert < 658 ) Ladekabel_max =  58;   // 1500 Ω  (1200...1800 Ω)  -> max. 13 A
  else if( PP_Messwert > 367 && PP_Messwert < 461 ) Ladekabel_max =  85;   //  680 Ω  (560...820 Ω)    -> max. 20 A
  else if( PP_Messwert > 156 && PP_Messwert < 218 ) Ladekabel_max = 136;   //  220 Ω  (180...270 Ω)    -> max. 32 A
  else if( PP_Messwert > 77 && PP_Messwert < 110 )  Ladekabel_max = 227;   //  100 Ω  (82...120 Ω)     -> max. 63 A
 else { // Kein definierter PP-Widerstand.
    Fehler( F_PP_UNDEFINIERT );
    Ladekabel_max = 255;
  }
  debug( "PP-Messung: " + String(PP_Messwert) + ", Ladekabel-Belastbarkeit: " + String(Ladekabel_max) + "\n" );

  // Führe 100 Messungen der Spannungen am CP-Pin durch:
  for(byte index = 0; index < 100; index++) {
    CP_Plus[index] = analogRead(A_CP_PLUS);
    CP_Minus[index] = analogRead(A_CP_MINUS);
  }
  
  // Vorbereitungen für Messung der Temperatur: 
  ADMUX = ( (1<<REFS1) | (1<<REFS0) | (1<<MUX3));  // Setze den Multiplexer und wähle die interne 1,1-V-Spannungsreferenz.
  ADCSRA |= (1<<ADEN);  // Aktiviere den ADC.

  // Verarbeitung der CP-Messwerte:
  for(byte i = 0; i < 10; i++) CP_Status[i] = 0;  // Lösche die von der letzten Messung gespeicherten Daten.
  debug( "CP Messwerte:" );
  for(byte index = 0; index < 100; index++) {
    // Berechnung der positiven und negativen Spannung:
    float Spannung_Plus  = (float)CP_Plus[index]  / CP_PLUS_FAKTOR;
    float Spannung_Minus = (float)CP_Minus[index] / CP_MINUS_FAKTOR;
    debug( " +" + String(Spannung_Plus, 2) + " V, -" + String(Spannung_Minus, 2) + " V," );
    
    // Auswertung der positiven Spannung:
    if     ( Spannung_Plus > 12.5 )               CP_Status[ZU_HOHE_SPANNUNG]++;
    else if( Spannung_Plus > 11.2 )                      CP_Status[PLUS_12_V]++;
    else if( Spannung_Plus > 8.2 && Spannung_Plus < 9.8 ) CP_Status[PLUS_9_V]++;
    else if( Spannung_Plus > 5.2 && Spannung_Plus < 6.8 ) CP_Status[PLUS_6_V]++;
    else if( Spannung_Plus > 2.2 && Spannung_Plus < 3.8 ) CP_Status[PLUS_3_V]++;
    else if( Spannung_Plus < 0.1 )                   CP_Status[NICHT_POSITIV]++;
    else                                          CP_Status[PLUS_UNDEFINIERT]++;
    
    // Auswertung der negativen Spannung:
    if     ( Spannung_Minus > 12.5 ) CP_Status[ZU_HOHE_SPANNUNG]++;
    else if( Spannung_Minus > 11.2 )       CP_Status[MINUS_12_V]++;
    else if( Spannung_Minus < 0.1 )     CP_Status[NICHT_NEGATIV]++;
    else                            CP_Status[MINUS_UNDEFINIERT]++;
  }
  debug("\nAnzahl Werte pro Bereich: ");
  for(byte i = 0; i < 10; i++) debug( String( CP_Status[i] ) + ", " );
  debug("\n");

  // Falls zu viele Messwerte betragsmäßig über 12,5 V liegen, beende den Ladevorgang:
  if( CP_Status[ZU_HOHE_SPANNUNG] > 5 ) Fehler( F_CP_SPANNUNG );
  // Falls zu viele Messwerte betragsmäßig unter 0,1 V liegen, wird vermutet, dass die Spannung bei 0 V liegt. Beende den Ladevorgang:
  if( CP_Status[NICHT_POSITIV] + CP_Status[NICHT_NEGATIV] > 170 ) Fehler( F_CP_KURZSCHLUSS );
  
  byte Ergebnis;
  bool Ergebnis_korrekt = true;
  // Ermittle vorläufiges Ergebnis der Messung: Welcher Wert wurde am häufigsten gemessen?
  if( Pulsweite == 0 ) Ergebnis = MINUS_12_V;
  else if( CP_Status[PLUS_12_V] > CP_Status[PLUS_9_V]  && CP_Status[PLUS_12_V] > CP_Status[PLUS_6_V] && CP_Status[PLUS_12_V] > CP_Status[PLUS_3_V] ) Ergebnis = PLUS_12_V;
  else if(  CP_Status[PLUS_9_V] > CP_Status[PLUS_12_V] &&  CP_Status[PLUS_9_V] > CP_Status[PLUS_6_V] &&  CP_Status[PLUS_9_V] > CP_Status[PLUS_3_V] ) Ergebnis = PLUS_9_V;
  else if(  CP_Status[PLUS_6_V] > CP_Status[PLUS_12_V] &&  CP_Status[PLUS_6_V] > CP_Status[PLUS_9_V] &&  CP_Status[PLUS_6_V] > CP_Status[PLUS_3_V] ) Ergebnis = PLUS_6_V;
  else if(  CP_Status[PLUS_3_V] > CP_Status[PLUS_12_V] &&  CP_Status[PLUS_3_V] > CP_Status[PLUS_9_V] &&  CP_Status[PLUS_3_V] > CP_Status[PLUS_6_V] ) Ergebnis = PLUS_3_V;
  else Ergebnis = PLUS_UNDEFINIERT;

  debug ( "Vorlaeufiges Ergebnis: " + String( Ergebnis ) + ". Korrekt: " );

  // Kein Messwert darf höher als das Ergebnis sein:
  Ergebnis_korrekt &= ( CP_Status[ZU_HOHE_SPANNUNG] == 0 );
  Ergebnis_korrekt &= ( CP_Status[PLUS_12_V] == 0 || Ergebnis == PLUS_12_V );
  Ergebnis_korrekt &= ( CP_Status[PLUS_9_V]  == 0 || Ergebnis == PLUS_9_V || Ergebnis == PLUS_12_V || Ergebnis == PLUS_UNDEFINIERT );
  Ergebnis_korrekt &= ( CP_Status[PLUS_6_V]  == 0 || ( Ergebnis != PLUS_3_V && Ergebnis != MINUS_12_V ) );
  Ergebnis_korrekt &= ( CP_Status[PLUS_3_V]  == 0 || Ergebnis != MINUS_12_V );
  Ergebnis_korrekt &= ( CP_Status[PLUS_UNDEFINIERT] == 0 || Ergebnis != MINUS_12_V );
  debug( String( Ergebnis_korrekt ) + ", " );

  // Ermittle anhand einer Formel, wie viele Messwerte vom ermittelten Status es mindestens geben muss, damit das Ergebnis akzeptiert werden kann:
  byte Mindestanzahl_Werte_Plus = ( (float)Pulsweite * (float)Pulsweite / 1000.0 ) + ( (float)Pulsweite / 10.0 ) ;

  Ergebnis_korrekt &= ( CP_Status[NICHT_NEGATIV] >= Mindestanzahl_Werte_Plus );
  debug( String( Ergebnis_korrekt ) + ", " );
  
  Ergebnis_korrekt &= ( CP_Status[Ergebnis]      >= Mindestanzahl_Werte_Plus );
  debug( String( Ergebnis_korrekt ) + ", " );

  // Ermittle anhand einer Formel, wie viele Messwerte von -12 V es mindestens geben muss, damit das Ergebnis akzeptiert werden kann:
  byte Pulsweite_N = 255 - Pulsweite;
  byte Mindestanzahl_Werte_Minus = ( (float)Pulsweite_N * (float)Pulsweite_N / 1000.0 ) + ( (float)Pulsweite_N / 10.0 ) ;
  
  Ergebnis_korrekt &= ( CP_Status[NICHT_POSITIV] >= Mindestanzahl_Werte_Minus );
  debug( String( Ergebnis_korrekt ) + ", " );
  
  if( CP_Status[MINUS_12_V] < Mindestanzahl_Werte_Minus ) {
    // Falls die negativen Messwerte zwischen 0,1 V und -11,2 V liegen, wird ein Diodenfehler vermutet (und der Ladevorgang abgebrochen):
    if( Ergebnis_korrekt && CP_Status[MINUS_UNDEFINIERT] >= Mindestanzahl_Werte_Minus ) Fehler( F_CP_DIODE );
    else Ergebnis_korrekt = false;
  } 
  debug( String( Ergebnis_korrekt ) + "\n" );
  
  Millisekunden = millis();  // Rufe die vergangene Zeit seit Programmstart ab.

  if( Ergebnis_korrekt ) {
    if( Ergebnis == PLUS_UNDEFINIERT ) Fehler( F_CP_UNDEFINIERT );  // Falls die gemessene Spannung nicht innerhalb eines der definierten Bereiche liegt, beende den Ladevorgang.
    else {
      debug( "Fahrzeug-Status ermittelt: " + String(Ergebnis) + "\n" );
      Status_Fahrzeug = Ergebnis;  // Speichere das Ergebnis der Messung.
      // Falls ein Fahrzeug angeschlossen ist, aber kein PP-Widerstand ermittelt wurde, breche den Ladevorgang ab:
      if( Status_Fahrzeug != PLUS_12_V && Status_Fahrzeug != MINUS_12_V && Ladekabel_max == 255 ) Fehler( F_PP_FEHLT );
      letzte_Messung = Millisekunden;  // Speichere den aktuellen Zeitpunkt.
    }
  } 
  else if( FEHLER_IGNORIEREN && Ergebnis != PLUS_UNDEFINIERT ) Status_Fahrzeug = Ergebnis;  // Speichere das Ergebnis der Messung.

  // Falls innerhalb einer festgelegten Zeit der Status des E-Autos nicht ermittelt werden konnte, beende den Ladevorgang:
  if( Millisekunden > letzte_Messung + CP_TIMEOUT ) {
    Fehler( F_CP_TIMEOUT );
    letzte_Messung = Millisekunden;  // Variable setzen, als wäre eine korrekte Messung erfolgt, damit anschließend weitere Fehler erkannt werden können.
  }
  
  // Falls während des Betriebs der Schalter umgestellt wurde (was eigentlich unmöglich ist), unterbreche den Ladevorgang:
  if( Schalterstellung != digitalRead(I_SCHALTER) ) Fehler( F_SCHALTER );

  Taster_auswerten( &Starttaster );  Taster_auswerten( &Stromtaster );  // Ermittle, ob Taster gedrückt oder losgelassen wurden.

  // Speichere, ob die Ladesteckdose verriegelt ist:
  debug( "Ladedose " );
  if( digitalRead( I_VERRIEGELUNG ) == VERRIEGELT ) verriegelt = true;
  else {
    verriegelt = false;
    debug( "nicht ");
  }
  debug( "verriegelt.\n" );

  if( Betriebsphase == 0 ) {  // Betriebsphase 0: Überprüfung, ob noch ein Fahrzeug vom letzten Ladevorgang angeschlossen ist, welches weitergeladen werden kann.
    // Lasse die Warten-LED blinken:
    if( (Millisekunden%1024) / 512 ) digitalWrite( O_LED_WARTEN, AN );
    else digitalWrite( O_LED_WARTEN, !AN );
    
    if( Ladekabel_max != Ladekabel_max_gespeichert || verriegelt == false ) Betriebsphase_1();
    else {
      switch( Status_Fahrzeug ) {
        case PLUS_12_V: // Wenn kein Fahrzeug angeschlossen ist, soll noch ein paar Sekunden gewartet werden. Dann wird in Betriebsphase 1 gewechselt:
        if( Verriegelungscounter == 30000 && Millisekunden > gespeicherte_Zeit ) Betriebsphase_1();
        break;
        case PLUS_9_V: // Wenn ein Elektroauto angeschlossen ist, gehe in Betriebsphase 2:
        CP_Signal_starten();
        break;
        case PLUS_6_V:
        if( ADAPTERKOMPATIBILITAET ) CP_Signal_starten();
        else Betriebsphase_1();
        break;
        case PLUS_3_V:
        if( ADAPTERKOMPATIBILITAET && BELUEFTUNG ) CP_Signal_starten();
        else Betriebsphase_1();
        break;
      }
    }
  }
    
  else if( Betriebsphase == 1 ) {  // Betriebsphase 1: Auswahl der Ladestromstärke durch den Benutzer.
    
    if( Stromtaster.status == 1 ) {  // Wenn der Strom-Taster gedrückt wurde, wird die Stromstärke geändert:
      Stromtaster.status = 2;
      Stromstaerke++;
      if( Stromstaerke > 4 ) Stromstaerke = 0;  // Wenn die höchste Stromstärke erreicht ist, beginne wieder bei der niedrigsten.
      // Bei einphasigem Anschluss können höhere Stromstärken evtl. nicht ausgewählt werden:
      else if( PULSWEITE[Stromstaerke] > MAX_PULSWEITE_EINPHASIG && Schalterstellung != DREIPHASIG ) Stromstaerke = 0;
    }
    // Es können nur Stromstärken ausgewählt werden, welche das Ladekabel verkraftet:
    if( PULSWEITE[Stromstaerke] > Ladekabel_max ) {
      Stromstaerke = 0;  // Beginne wieder bei der niedrigsten Stromstärke.
      Blinkstatus_Auto_LED = 6; // Lasse die Auto-LED dreimal kurz blinken, um dem Benutzer anzuzeigen, dass keine höhere Stromstärke eingestellt werden kann.
    }
    // Prüfe anhand des Status des Fahrzeugs, ob ein Ladevorgang gestartet werden kann:
    byte Auto_angeschlossen = 0;  // 0 -> kein Auto angeschlossen, 1 -> Auto angeschlossen, Ladung möglich, 2 -> Auto angeschlossen, aber keine Ladung möglich.
    switch( Status_Fahrzeug ) {
      case PLUS_9_V:
      Auto_angeschlossen = 1;
      break;
      case PLUS_6_V:
      if( ADAPTERKOMPATIBILITAET ) Auto_angeschlossen = 1;
      else Auto_angeschlossen = 2;
      break;
      case PLUS_3_V:
      if( ADAPTERKOMPATIBILITAET && BELUEFTUNG ) Auto_angeschlossen = 1;
      else Auto_angeschlossen = 2;
      break;
    }
    if( Blinkstatus_Auto_LED > 0 ) {  // Lasse die Auto-LED kurz und schnell blinken, um den Benutzer zu informieren:
      if( Millisekunden > gespeicherte_Zeit || Blinkstatus_Auto_LED == 6 ) {
        digitalWrite( O_LED_AUTO, !digitalRead( O_LED_AUTO ) );
        Blinkstatus_Auto_LED--;
        gespeicherte_Zeit = Millisekunden + 128;
      }
    }
    else if( Auto_angeschlossen == 2 ) { // Falls keine Ladung möglich ist, lasse die Auto-LED langsam blinken:
      if( (Millisekunden%1024) / 512 ) digitalWrite( O_LED_AUTO, AN );
      else digitalWrite( O_LED_AUTO, !AN );
    }
    else digitalWrite( O_LED_AUTO, (!AN)^Auto_angeschlossen ); // Schalte die Auto-LED aus, wenn kein Auto angeschlossen ist, und ein, wenn eine Ladung gestartet werden kann.
    
    if( Starttaster.status == 1 ) { // Wenn der Start-Taster gedrückt wurde, wird ein Ladevorgang gestartet (bzw. vorbereitet):
      Starttaster.status = 2;  
      if( Auto_angeschlossen == 1 ) CP_Signal_starten(); // Wenn ein Fahrzeug angeschlossen ist, gehe in Betriebsphase 2.
      else if ( Auto_angeschlossen == 0 ) Blinkstatus_Auto_LED = 6; // Lasse die Auto-LED dreimal kurz blinken, um dem Benutzer anzuzeigen, dass erst ein Auto angeschlossen werden muss.
    }
  }
    
  else if( Betriebsphase == 2 ) {  // Betriebsphase 2: Warte auf Bereitschaft des E-Autos.
    // Lasse die Warten-LED blinken:
    if( (Millisekunden%1024) / 512 ) digitalWrite( O_LED_WARTEN, AN );
    else digitalWrite( O_LED_WARTEN, !AN );
    switch( Status_Fahrzeug ) {
      case PLUS_12_V:  // Wenn das Auto nicht mehr angeschlossen ist, gehe zurück zur Ladestrom-Einstellung.
      Betriebsphase_1();
      break;
      case PLUS_9_V:
      if( Millisekunden > gespeicherte_Zeit ) Betriebsphase_1(); // Wenn das E-Auto nach einer gewissen Zeit nicht laden will, gehe zurück zur Ladestrom-Einstellung.
      else Verriegeln( true );  // Falls die Verriegelung der Ladedose noch nicht erfolgreich war, versuche es immer wieder.
      break;
      case PLUS_6_V:
      Ladevorgang_starten();
      break;
      case PLUS_3_V:
      if( BELUEFTUNG ) Ladevorgang_starten();
      else {  // Wenn keine Belüftung erlaubt ist, gehe zurück zur Ladestrom-Einstellung und lasse die Auto-LED dreimal kurz blinken:
        Betriebsphase_1();
        Blinkstatus_Auto_LED = 6;
      }
      break;
    }
  }
    
  else if( Betriebsphase == 3 ) {  // Betriebsphase 3: Ladevorgang.
    // Bestimme 3 LEDs, welche als Lauflicht im Kreis wandern:
    byte led1 = (Millisekunden%1024) / 128;
    byte led2 = led1 + 1; if( led2 == 8 ) led2 = 0;
    byte led3 = led2 + 1; if( led3 == 8 ) led3 = 0;
    for(byte i = 0; i < 8; i++) {
      if( i == led1 || i == led2 || i == led3 ) digitalWrite( O_LED[i], AN );  // Schalte die gewählten LEDs an.
      else digitalWrite( O_LED[i], !AN );  // Schalte die übrigen LEDs aus.
    }
    switch( Status_Fahrzeug ) {
      case PLUS_12_V: // Elektroauto ist plötzlich nicht mehr angeschlossen.
      Fehler( F_NOTABBRUCH );
      break;
      case PLUS_9_V:  // Elektroauto hat fertig geladen oder Benutzer hat Ladevorgang beendet.
      digitalWrite( O_LADUNG, LOW );  // Schalte die Stromzufuhr zum E-Auto ab.
      Betriebsphase = 4;  // Gehe in Betriebsphase 4.
      alle_LEDs( AN );
      break;
      case PLUS_3_V:  // Wenn das Elektroauto eine Belüftung anfordert und diese nicht erlaubt ist, beende den Ladevorgang:
      if( !BELUEFTUNG ) Fehler( F_BELUEFTUNG );
      break;
    }
  }
    
  else if( Betriebsphase == 4 ) {  // Betriebsphase 4: Fertig.
    switch( Status_Fahrzeug ) {
      case PLUS_12_V:  // Wenn das Elektroauto nicht mehr angeschlossen ist, gehe zurück zur Ladestrom-Einstellung:
      Betriebsphase_1();
      break;
      case PLUS_6_V:
      Ladevorgang_starten();
      break;
      case PLUS_3_V:
      if( BELUEFTUNG ) Ladevorgang_starten();
      else Fehler( F_BELUEFTUNG );
      break;
    }
  }
  
  else {  // Betriebsphase 5+: Fehler.
    // Lasse die Fehler-LED blinken, um den Fehlercode anzuzeigen:
    if( Millisekunden >= gespeicherte_Zeit ) {
      if( Betriebsphase%2 == 0 && Betriebsphase-4 <= Fehlercode*2 ) {
        digitalWrite( O_LED_FEHLER, AN );
        gespeicherte_Zeit += 128;
      }
      else {
        digitalWrite( O_LED_FEHLER, !AN );
        gespeicherte_Zeit += 256;
      }
      if( Betriebsphase > Fehlercode*2 + 6) Betriebsphase = 5;
      else Betriebsphase++;
    }
    // Falls die Verriegelung nicht funktioniert hat, probiere alle 30 Sekunden erneut, die Ladedose zu verriegeln:
    if( Fehlercode == F_VERRIEGELUNG ) {
      Verriegeln( true );
      if( verriegelt ) {  // Falls die Verriegelung irgendwann erfolgreich war, starte den Ladevorgang:
        Fehlercode = 0;
        Betriebsphase_0();  // Gehe in Betriebsphase 0, um zu prüfen, ob alle Bedingungen erfüllt sind.
      }
    }
  }

  if( Betriebsphase < 3 ) {  // Folgendes wird in Betriebsphase 0, 1 und 2 ausgeführt:
    for(byte i = 0; i < 5; i++) {
      if( i == Stromstaerke ) digitalWrite( O_LED_STROM[i], AN );  // Schalte die Strom-LED, welche für die ausgewählte Stromstärke steht, ein.
      else digitalWrite( O_LED_STROM[i], !AN );  // Schalte alle anderen Strom-LEDs aus.
    }
  } 
  if( Betriebsphase > 1 && Betriebsphase < 5 ) {  // Folgendes wird in Betriebsphase 2, 3 und 4 ausgeführt:
    if( Ladekabel_max != Ladekabel_max_gespeichert ) Fehler( F_PP_UNDEFINIERT );  // Wenn sich der Widerstand des Ladekabels plötzlich verändert hat, breche den Ladevorgang ab.
  }

  // Wenn kein Fahrzeug angeschlossen ist und die Initialisierung abgeschlossen, entriegele die Ladedose:
  if( Status_Fahrzeug == PLUS_12_V && Betriebsphase > 0 ) Verriegeln( false );
  
  // Inzwischen hat sich die Spannung des internen Temperatursensors stabilisiert und kann gemessen werden:
  ADCSRA |= (1<<ADSC);  // Starte den ADC.
  while ( bit_is_set(ADCSRA, ADSC) ); // Warte, bis die Messung abgeschlossen ist.
  uint16_t messwert = ADCW;  // Lese Register (ADCH und ADCL kombiniert).
  
  int Temperatur = ( (float)messwert - TEMP_OFFSET ) / TEMP_GAIN; // Umrechnung in Grad Celsius.
  debug( "Temperatur des ATmega: " + String(Temperatur) + " " + String( (char)223 ) + "C\n" );
  if( Temperatur > MAX_TEMPERATUR ) Fehler( F_TEMP_MAX );  // Falls die Temperatur zu hoch ist, unterbreche den Ladevorgang.
  if( Temperatur < MIN_TEMPERATUR ) Fehler( F_TEMP_MIN );  // Falls die Temperatur zu niedrig ist, unterbreche den Ladevorgang.
}


/*
 *  ##### #   #  #   #  #  # ##### ###  ###  #   #  ##### #   #
 *  #     #   #  ##  #  # #    #    #  #   # ##  #  #     ##  #
 *  ###   #   #  # # #  ##     #    #  #   # # # #  ###   # # #
 *  #     #   #  #  ##  # #    #    #  #   # #  ##  #     #  ##
 *  #      ###   #   #  #  #   #   ###  ###  #   #  ##### #   #
 */

// Interrupt-Funktion wird jede Millisekunde aufgerufen, hier wird die Zeit bis zur Abschaltung der Steckerverriegelung heruntergezählt:
SIGNAL(TIMER0_COMPA_vect) {
  if( Verriegelungscounter < 30000 ) {
    Verriegelungscounter++;
    if( Verriegelungscounter == 180 ) { // Schalte 180 ms nach Aktivierung des Verriegelungsaktuators diesen wieder aus (Kontakte A und B auf +12 V).
      digitalWrite(O_VERRIEGELUNG_A, LOW); digitalWrite(O_VERRIEGELUNG_B, LOW);
    }
  }
}

// Überträgt Ausgaben über die serielle Schnittstelle, falls DEBUG aktiviert ist:
void debug( String ausgabe ) {
  if( DEBUG ) Serial.print(ausgabe);
}

void Verriegeln( bool verriegeln ) {
  // Die Verriegelung bzw. Entriegelung startet nur, wenn die Ladedose nicht bereits verriegelt bzw. entriegelt ist und wenn 
  // seit der letzten Aktivierung mindestens 30 Sekunden vergangen sind (Schutz vor Überhitzung des Elektromagneten).
  if( verriegelt != verriegeln && Verriegelungscounter == 30000 ) {
    if( verriegeln ) {
      digitalWrite(O_VERRIEGELUNG_B, HIGH); // Starte Verriegelung (Relais schaltet Kontakt B auf Minus, Kontakt A bleibt auf +12 V).
    } else {
      digitalWrite(O_VERRIEGELUNG_A, HIGH); // Starte Entriegelung (Relais schaltet Kontakt A auf Minus, Kontakt B bleibt auf +12 V).
    }
    Verriegelungscounter = 0; // schalte 180 ms später den Verriegelungsaktuator wieder aus. 
  }
}

void Betriebsphase_0() {
  debug( "Überprüfe, ob Ladevorgang gestartet werden kann...\n" );
  Betriebsphase = 0;
  setze_CP_Signal( 255 );  // Setze den CP-Pin auf +12 V.
  alle_LEDs( !AN );  // Schalte alle LEDs aus.
  gespeicherte_Zeit = Millisekunden + 10000; // In den nächsten 10 Sekunden soll eine eventuell bestehende Verriegelung nicht gelöst werden.
}

void Betriebsphase_1() {
  debug( "Einstellung Ladestrom...\n" );
  if( Betriebsphase == 0 ) {
    if( Schalterstellung == DREIPHASIG ) Stromstaerke = START_STROMSTAERKE_DREIPHASIG;
    else Stromstaerke = START_STROMSTAERKE_EINPHASIG;
  }
  Betriebsphase = 1;
  setze_CP_Signal( 255 );  // Setze den CP-Pin auf +12 V.
  alle_LEDs( !AN );  // Schalte alle LEDs aus.
  Blinkstatus_Auto_LED = 0;
}

void CP_Signal_starten() {
  debug( "Teile E-Auto Stromstaerke mit...\n" );
  Betriebsphase = 2;
  digitalWrite( O_LED_AUTO, AN );
  Ladekabel_max_gespeichert = Ladekabel_max;  // Speichere die aktuelle Ladekabel-Belastbarkeit, um bei einer Änderung den Ladevorgang abbrechen zu können.
  gespeicherte_Zeit = Millisekunden + 60000;  // Innerhalb der nächsten 60 Sekunden muss das E-Auto reagieren.
  setze_CP_Signal( PULSWEITE[Stromstaerke] );  // Beginne, dem Elektrofahrzeug die erlaubte Stromstärke mitzuteilen.
  Verriegeln( true ); // Verriegele die Ladedose.
}

void Ladevorgang_starten() {
  if( verriegelt ) { // Um den Ladevorgang starten zu können, muss die Ladedose verriegelt sein.
    // Überprüfe sicherheitshalber nochmal, ob alle Bedingungen erfüllt sind, und starte dann den Ladevorgang:
    if( Pulsweite <= Ladekabel_max && ( Pulsweite <= MAX_PULSWEITE_EINPHASIG || Schalterstellung == DREIPHASIG ) ) {
      debug( "Starte Ladevorgang...\n" );
      Betriebsphase = 3;
      for( byte i = 0; i < 8; i++ ) {  // Speichere im EEPROM die Parameter dieses Ladevorgangs, um bei einer Unterbrechung der Stromzufuhr diesen anschließend fortführen zu können:
        EEPROM.update( EEPROM_STROMSTAERKE[i], Stromstaerke );
        EEPROM.update( EEPROM_WAHLSCHALTER[i], Schalterstellung );
        EEPROM.update( EEPROM_LADEKABEL[i], Ladekabel_max_gespeichert );
      }
      digitalWrite( O_LADUNG, HIGH );  // Schalte die Stromzufuhr zum Elektrofahrzeug ein.
    }
  } else if( Verriegelungscounter > 1000 ) {
    Fehler( F_VERRIEGELUNG ); // Wenn eine Sekunde nach Start der Verriegelung die Ladedose nicht verriegelt ist, wird in den Fehler-Status gewechselt.
  }
}

// Unterbricht einen Ladevorgang und startet Betriebsphase 5+, sodass anschließend die Fehler-LED blinkt:
void Fehler( byte fehlercode ) {
  debug( "FEHLER! Code: " + String(fehlercode) + "\n" );
  if( Fehlercode != 0 || FEHLER_IGNORIEREN ) {
    debug( "Ignoriere Fehler.\n" );  // Wenn vorher bereits ein Fehler erkannt wurde oder der Benutzer es so will, wird der Fehler ignoriert.
  }
  else {
    digitalWrite( O_LADUNG, LOW );  // Schalte die Stromzufuhr zum E-Auto ab.
    setze_CP_Signal( 0 );  // Setze den CP-Pin auf -12 V.
    alle_LEDs( !AN ); // Schalte alle LEDs aus.
    Fehlercode = fehlercode; // Speichere den Fehlercode, damit anschließend die Fehler-LED entsprechend blinken kann.
    Betriebsphase = 5;
    gespeicherte_Zeit = Millisekunden + 256;
  }
}

// Schaltet alle LEDs gleichzeitig an oder aus:
void alle_LEDs( bool wert ) {
  for (byte i = 0; i < 8; i++) digitalWrite( O_LED[i], wert );
}

// Setzt die Pulsweite des CP-Signals und speichert diese in der Variable Pulsweite:
void setze_CP_Signal( byte pulsweite ) {
  if( pulsweite == 0 || pulsweite == 255 ) digitalWrite( O_CP_SIGNAL, pulsweite );
  else analogWrite( O_CP_SIGNAL, pulsweite );
  Pulsweite = pulsweite;
  debug( "Pulsweite auf " + String( (float)pulsweite/2.55, 1 ) + " % gesetzt.\n" );
}

// Überprüft, ob der übergebene Taster gedrückt oder losgelassen wurde:
void Taster_auswerten( Taster* taster ) {
  if( taster->status == 1 ) taster->status = 2;  // Falls ein Tastendruck seit dem letzten Funktionsaufruf nicht berücksichtigt wurde, wird dieser ignoriert.
  
  bool Status = digitalRead(taster->pin);  // Lese den Taster aus.
  
  // Überprüfe, ob der Taster gedrückt wurde:
  if( Status == LOW && taster->status == 0 && Millisekunden >= taster->zeit ) {
    taster->status = 1;  // Taster wurde gedrückt.
    taster->zeit = Millisekunden + 30;  // Speichere Zeit, ab dem das Loslassen des Tasters geprüft wird, um ein Prellen des Tasters zu ignorieren.
    debug( taster->name + "-Taster wurde gedrueckt.\n" );
  }
  // Überprüfe, ob der Start-Taster losgelassen wurde:
  if( Status == HIGH && taster->status == 2 && Millisekunden >= taster->zeit ) {
    taster->status = 0;  // Taster nicht mehr gedrückt.
    taster->zeit = Millisekunden + 30;  // Speichere Zeit, ab dem ein erneuter Tastendruck registriert werden kann, damit ein Prellen des Tasters ignoriert wird.
    debug( taster->name + "-Taster wurde losgelassen.\n" );
  }
}
