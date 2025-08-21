Profile: KBV_PR_MIO_LAB_Observation_Laboratory_Study_Open
Parent: Observation
Id: KBV-PR-MIO-LAB-Observation-Laboratory-Study-Open
Title: "KBV_PR_MIO_LAB_Observation_Laboratory_Study_Open"
Description: "Dieses Profil bildet eine Laboruntersuchung ab."
* ^url = "https://fhir.kbv.de/StructureDefinition/KBV_PR_MIO_LAB_Observation_Laboratory_Study_Open"
* . ^definition = "Dieses Profil bildet eine Laboruntersuchung ab."
* . ^comment = "Vorgabe\n
                Die Verpflichtung zur Angabe der Probe ist vom Anwendungsfall abhängig:

                Bei einer messenden Laboruntersuchung muss eine Probe (Element specimen) zugeordnet sein.
                Falls eine Berechnung vorliegt, so wird hier keine Probe angegeben. Stattdessen können die Berechnungsgrundlagen (Element derivedFrom) referenziert werden."
* insert MIOProfileMeta
* extension MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "url"
  * ^slicing.rules = #open
* extension contains
  KBV_EX_MIO_LAB_External_Service named externalService 0..1 MS and
  KBV_EX_MIO_LAB_Association_Service named associationService 0..1 MS and
  KBV_EX_MIO_LAB_Accredited_Service named accreditedService 0..1 MS and
  KBV_EX_MIO_LAB_zlog named zlogValue 0..1 MS
* extension[externalService] ^definition = "Dieses Kennzeichen wird gesetzt, wenn die Laboruntersuchung von einem anderen Labor durchgeführt wird."
  * value[x] MS
  * valueBoolean MS
* extension[associationService] ^definition = "Dieses Kennzeichen wird gesetzt, wenn die \"Fremdleistung\" von einem anderen Labor aus dem eigenen Verbund durchgeführt wird und diese Information aus administrativen Gründen zusätzlich benötigt wird."
  * value[x] MS
  * valueBoolean MS
* extension[accreditedService] ^definition = "Diese Angabe betrifft akkreditierte Labore. Basierend auf der Akkreditierung ist gefordert, dass nicht akkreditierte Leistungen gekennzeichnet werden, auch im Laborbefund."
  * value[x] MS
  * valueBoolean MS
* extension[zlogValue] ^definition = "Der zlog-Wert ist ein Relativwert, der auf einer logarithmischen Skala angibt, um wie viele Standardabweichungen ein Messwert vom Mittelwert des Referenzkollektivs abweicht."
  * value[x] MS
  * valueDecimal MS
* identifier 0..2 MS
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "type"
  * ^slicing.rules = #open
* identifier contains resultID 0..1 MS and GTIN 0..1 MS
* identifier[resultID]
  * ^definition = "Eindeutige ID zur Identifizierung der jeweiligen einzelnen Laboruntersuchung. Sie wird durch das auftragnehmende Laboratorium generiert."
  * type = $v2-0203|2.9#OBI "Observation Instance Identifier"
  * type
    * coding 1..1
      * version 1..1
* insert Identifier(identifier[resultID])
* identifier[GTIN] MS
  * ^definition = "Mit der GTIN (kurz für Global Trade Item Number) kann jeder Artikel, jedes Produkt oder jede Produktvariante weltweit überschneidungsfrei identifiziert werden. Sie fungiert als Zugriffsschlüssel auf in Datenbanken hinterlegte Produktinformationen."
  * type = $v2-0203#UDI "Universal Device Identifier"
  * type
    * ^patternCodeableConcept.coding.version = "2.9"
    * coding 1..1
      * version 1..1
* insert Identifier(identifier[GTIN])
* status 1..1 MS
  * ^definition = "Bearbeitungs-Status der einzelnen Laboruntersuchung."
* category 1..3 MS
  * ^definition = "Gruppenbezogene fachliche Bezeichner, abgeleitet aus der zugehörigen Untersuchungsgruppe."
  * ^comment = "Vorgabe\nDie Inhalte für die Kategorie der Einzeluntersuchung müssen identisch sein mit Untersuchungsgruppe\\Fachliches Gruppierungsmerkmal der jeweiligen zugehörigen Untersuchungsgruppe und leiten sich daraus ab."
  * ^slicing.discriminator.type = #value
  * ^slicing.discriminator.path = "extension.value"
  * ^slicing.rules = #closed
* category contains
  laboratory 1..1 MS and
  laboratorySpecialty 0..1 MS and
  testPanel 0..1 MS
* category[laboratory] = $observation-category#laboratory
  * extension MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "url"
    * ^slicing.rules = #closed
  * extension contains KBV_EX_MIO_LAB_Diskriminator named laboratory 1..1
  * extension[laboratory] MS
    * valueString MS
    * valueString = "laboratory"
  * insert Coding(coding)
  * text MS
* category[laboratorySpecialty]
  * ^definition = "Hier kann die fachspezifische Eingrenzung innerhalb der Laboratoriumsmedizin anhand entsprechender Kategorie-Codes angegeben werden."
  * extension MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "url"
    * ^slicing.rules = #closed
  * extension contains KBV_EX_MIO_LAB_Diskriminator named laboratorySpecialty 1..1
  * extension[laboratorySpecialty] MS
    * valueString MS
    * valueString = "laboratorySpecialty"
  * coding MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains loinc 0..1 MS
  * coding[loinc] from https://fhir.kbv.de/ValueSet/KBV_VS_MIO_LAB_Laboratory_Specialties_LOINC|1.0.0-update (example)
  * insert Coding(coding[loinc])
  * coding[loinc]
    * ^patternCoding.system  = "http://loinc.org"
    * version 1..1
  * text MS
* category[testPanel]
  * ^definition = "Test-Kategorien oder Panele für fachliche Gruppierung. Test-Panele (z.B. LOINC® Panels) gruppieren Laboruntersuchungen nach medizinischen Kategorien unterschiedlicher Differenzierungstiefe."
  * extension MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "url"
    * ^slicing.rules = #closed
  * extension contains KBV_EX_MIO_LAB_Diskriminator named testPanel 1..1
  * extension[testPanel] MS
    * valueString MS
    * valueString = "testPanel"
  * coding MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains loinc 0..1 MS
  * coding[loinc] from https://fhir.kbv.de/ValueSet/KBV_VS_MIO_LAB_Test_Panel_LOINC|1.0.0-update (example)
  * insert Coding(coding[loinc])
  * coding[loinc]
    * ^patternCoding.system = "http://loinc.org"
    * version 1..1
  * text MS
* code MS
  * ^definition = "Jeder Laborleistung/Laboruntersuchung ist ein LOINC®-Code verbindlich zugeordnet.\n
Der LOINC-Katalog wurde noch nicht vollständig ins Deutsche übersetzt. Wir empfehlen als Anzeigenamen, sofern vorhanden, den deutschen Anzeigenamen aus der LOINC® Linguistic Variants DE (enthalten in den Accesory-Files der LOINC®-Version) zu verwenden. Ansonsten ist die Befüllung durch den Long Common Name (LONG_COMMON_NAME) aus der allgemeinen LOINC®-Datenbank zu verwenden."
  * coding
    * ^comment = "Vorgabe\nDas BfArM hat einen Anwendungsleitfaden für die Kodierung der Labordaten in der ePA veröffentlicht (Quelle: https://www.bfarm.de/DE/Kodiersysteme/News/LOINC_Publikation_Anwendungsleitfaden_1_0_0.html). 
Zu beachten sind die enthaltenen Regeln und Hinweise zur Auswahl von LOINC®-Termen, um eine einheitliche Verwendung von LOINC® zu unterstützen.
Als Anzeigename soll der Long Common Name (LCN) des LOINC®-Codes mitgegeben werden."
    * ^patternCoding.system = "http://loinc.org"
  * coding 1..1 MS
    * version 1..1
  * text MS
* insert Coding(code.coding)
* insert Subject(subject)
* effective[x] 1..1 MS
* effectiveDateTime MS
  * ^comment = "Vorgabe\nEine Laboruntersuchung bezieht sich eindeutig auf ein Probenmaterial, zu dem der (1.) Entnahmezeitpunkt bekannt sein sollte/kann und (2.) der Laboreingangszeitpunkt bekannt sein muss. Verbindliche Regel zur Ableitung des klinischen Bezugszeitpunkts:
                                WENN der Entnahmezeitpunkt des Probenmaterials angeben ist, so gilt der Entnahmezeitpunkt;WENN der Sammelzeitraum, bis angegeben ist, so gilt der bis-Zeitpunkt; SONST gilt der Zeitpunkt des Eingangs der Probe im Labor (Probeneingangszeitpunkt)."
* issued 1..1 MS
  * ^definition = "Zeitstempel oder Zeitangabe zur Dokumentation der einzelnen Laboruntersuchung."
* insert Performer
* performer
  * ^short = "Durchführendes Labor in Fremdleistung"
  * ^definition = "Wenn das auftragnehmende Labor die Laborleistung nicht in Eigenleistung erbringt sondern an an ein Speziallabor weiterleitet, kann dieses hier benannt werden."
* value[x] MS
  * ^definition = "Messergebnisse können quantitativ oder qualitativ sein."
  * ^comment = "Vorgabe\nDie Angabe eines Messergebnisses ist gefordert (\"required\"). Wenn kein Messergebnis zur Verfügung steht, muss in der FHIR Struktur ein \"data absend reason\" angegeben werden."
* valueQuantity MS
  * ^patternQuantity.system = "http://unitsofmeasure.org"
  * value 1.. MS
  * comparator MS
  * unit 1.. MS
  * system 1.. MS
  * code 1.. MS
* valueCodeableConcept MS
  * ^definition = "Qualitative Messergebnisse sind - je nach Messgröße oder Skalierung:\n
  
  Ordinal, d.h. numerische, in der Regel ganzzahlige Ordnungswerte, die den Vergleich (z. B. kleiner als, größer als) ermöglichen oder zur Vergabe einer Punktebewertung (\"Benotung\") herangezogen werden, beispielsweise
  - eine Schmerzskala (z.B. von 1 bis 10)
  
  Nominal, d.h. Festwerte ohne Rangordnung, beispielsweise in der Mikrobiologie:
  - Krankheitserreger (z.B. Escherichia Coli; Staphylococcus aureus als Bezeichner oder als Code.)
  - Angabe zum Nachweis (z.B. vorhanden / nicht vorhanden)"
  * coding MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains snomed 0..1 MS
  * coding[snomed] from https://fhir.kbv.de/ValueSet/KBV_VS_MIO_LAB_Presence_Ordinal_SNOMED_CT|1.0.0-update (example)
  * coding[snomed]
    * ^patternCoding.system = "http://snomed.info/sct"
    * version 1..1
  * text MS
* insert Coding(valueCodeableConcept.coding[snomed]) 
* valueRatio MS
  * obeys ratio-1
  * ^definition = "Eine bisher gebräuchliche Ergebnisdarstellung von Antikörper-Bestimmungen ist der Verdünnungstiter, bei welchem die Antikörper noch nachweisbar sind. Umgangssprachlich häufig nur als \"Titer\" bezeichnet. Die Titerangabe setzt sich aus zwei ins Verhältnis gesetzten Quantitäten (Zähler, Nenner) zusammen. Wenn zur Ergebnisdarstellung ein Komparator benötigt wird, dann gelten die mathematischen Regeln, beispielsweise ist 1:32 ein kleinerer Wert als 1:16."
  * numerator 1.. MS
    * value 1.. MS
    * comparator MS
    * unit MS
    * system MS
    * code MS
  * denominator 1.. MS
    * value 1.. MS
    * comparator
    * unit MS
    * system MS
    * code MS
* valueRange MS
  * obeys range-1
  * low 1.. MS
    * ^patternQuantity.system = "http://unitsofmeasure.org"
    * value 1.. MS
    * unit 1.. MS
    * system 1.. MS
    * code 1.. MS
  * high 1.. MS
    * ^patternQuantity.system = "http://unitsofmeasure.org"
    * value 1.. MS
    * unit 1.. MS
    * system 1.. MS
    * code 1.. MS
* dataAbsentReason MS
  * ^definition = "Begründung für die Nicht-Verfügbarkeit eines Messergebnisses"
  * coding 1..1 MS
* insert Coding(dataAbsentReason.coding)
* interpretation MS
  * ^definition = "Medizinisch relevante Bewertung zur Laboruntersuchung. Die Interpretation kann als Code und/oder Text vorliegen."
  * coding MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "$this"
    * ^slicing.rules = #open
  * coding contains hl7Interpretation 0..1 MS and snomed 0..1 MS
  * coding[hl7Interpretation] from http://hl7.org/fhir/ValueSet/observation-interpretation (extensible)
  * coding[hl7Interpretation]
    * ^patternCoding.system = "http://terminology.hl7.org/CodeSystem/v3-ObservationInterpretation"
    * ^patternCoding.version = "4.0.1"
  * insert Coding(coding[hl7Interpretation])
  * coding[snomed] from https://fhir.kbv.de/ValueSet/KBV_VS_MIO_LAB_Result_Interpretation_SNOMED_CT|1.0.0-update (example)
  * insert Coding(coding[snomed])
  * coding[snomed]
    * ^patternCoding.system = "http://snomed.info/sct"
    * version 1..1
  * text MS
* note ..1 MS
  * ^definition = "Die ergänzende Angabe bezieht sich genau auf diese Untersuchung. Dieses Feld ermöglicht zusätzliche Freitext-Angaben zur Laboruntersuchung, die in der vorgegebenen Datenstruktur nicht erfasst werden können. 
  Dieses Feld ist auch für - über die rein medizinische Interpretation hinausgehende - Kommentierungen gedacht, z.B. um Empfehlungen bezüglich Folgeaktivitäten zu notieren."
  * text MS
* method MS
  * ^definition = "Der LOINC®-Code impliziert über die LOINC®-Achse METHOD bereits eine Untersuchungsmethode, unter der Voraussetzung, dass der Part-METHOD einen Wert beinhaltet. Die ergänzende Spezifizierung der Methode kann in Bezug auf die LOINC®-spezifizierte Laboruntersuchung ergänzt werden, falls der Wert für die LOINC®-Achse METHOD nicht ausreichend spezifisch ist oder gar nicht vorhanden ist. Es kommt vor, dass eine LOINC®-Codierung die Methode nicht ausreichend feingranular differenziert. Einige gebräuchliche chemische und hämatologische Tests werden (LOINC®)codiert, ohne dass damit eine Methode definiert ist."
  * ^comment = "Vorgabe\nDas BfArM hat einen Anwendungsleitfaden für die Kodierung der Labordaten in der ePA veröffentlicht (Quelle: https://www.bfarm.de/DE/Kodiersysteme/News/LOINC_Publikation_Anwendungsleitfaden_1_0_0.html). 
Zu beachten sind die enthaltenen Regeln und Hinweise zur Verwendung von ergänzenden Angaben zur Untersuchungsmethode.
Die übergeordnete Beschreibung der Untersuchungsmethode ist als Teil eines LOINC®-Terms darstellbar (LOINC®-Achse METHOD)
Die ergänzende Angabe der Untersuchungsmethode mittels SNOMED CT® Code wird angestrebt, wenn die LOINC®-Achse METHOD gar keine Information enthält oder aber die LOINC®-Angabe nicht genau genug ist."
  * coding MS
  * text MS
* insert Coding(method.coding)
* specimen MS
  * ^definition = "Eine Laboruntersuchung kann auf einer Primärprobe oder einer weiter verarbeiteten Probe (Sekundärprobe) basieren. Die Zuordnung einer Sekundärprobe zu einer Laboruntersuchung ist dann empfehlenswert, wenn durch die Probenvorbereitung im Labor eine relevante Veränderung des Untersuchungsmaterials erfolgt (z.B. Abtrennung Plasma).
  
  Ein Beispiel für die Unterscheidung zwischen Primärprobe und Sekundärprobe: als Primärprobe erreicht eine Probenart = Vollblut das Labor. Durch Zentrifugieren im Labor entsteht eine Sekundärprobe mit Probenart = Serum. Die zu analysierende Substanz wird im Serum gemessen."
* insert Reference(specimen)
//* specimen only Reference(https://fhir.kbv.de/StructureDefinition/KBV_PR_MIO_LAB_Specimen|1.0.0-update)
* device ..1 MS
  * ^definition = "Hier wird das Gerät bzw. Medizinprodukt referenziert, mit dem die Laboruntersuchung durchgeführt wird."
* insert Reference(device)
//* device only Reference(https://fhir.kbv.de/StructureDefinition/KBV_PR_MIO_LAB_Device|1.0.0-update)
* referenceRange MS
  * obeys ref-range-1
  * ^definition = "Richtgrenzen oder Bewertungsgrenzen zu einer Laboruntersuchung.\n 
  Nicht immer werden Richtgrenzen mit Einheiten angegeben. Ein typisches Bespiel hierfür: zum Immunitätsnachweis aus einer Probe werden Verdünnungsreihen von 1:2, 1:4, 1:8, 1:16, 1:32 usw. hergestellt. 
  Die Verdünnungen gibt man auf Zellkulturen, die dann mit einem Virus infiziert werden. Die höchste Verdünnungsstufe, bei der noch eine Infektion der Zellen vollständig verhindert wird, 
  also noch ausreichend Antikörper vorhanden sind, wird als Titer angegeben. Dieser Titer wird ohne Einheiten angeben."
  * ^comment = "Vorgabe\nEs muss mindestens eine obere oder eine untere Referenzgrenze angegeben werden."
  * extension MS
    * ^slicing.discriminator.type = #value
    * ^slicing.discriminator.path = "url"
    * ^slicing.rules = #closed
  * extension contains KBV_EX_MIO_LAB_Source_Reference_Range named sourceReferenceRange 0..1 MS and KBV_EX_MIO_LAB_No_Linear_Reference_Range named noLinearReferenceRange 0..1 MS
  * extension[noLinearReferenceRange] MS
    * value[x] MS
    * valueBoolean MS
  * extension[sourceReferenceRange] MS
    * value[x] MS
    * valueCodeableConcept MS
      * coding MS
        * system MS
        * version MS
        * code MS
        * display MS
      * text MS
  * low MS
    * value 1.. MS
    * unit MS
    * system MS
    * code MS
  * high MS
    * value 1.. MS
    * unit MS
    * system MS
    * code MS
  * type 1.. MS
    * coding MS
    * text MS
  * insert Coding(type.coding)
  * appliesTo ..1 MS
    * ^definition = "Die Ermittlung von 'Normwerten' basiert üblicherweise auf 95% eines gesunden Erwachsenen-Kollektivs. Normwerte sind Grenzwerte, die sich auf ein 'Normalkollektiv' beziehen. 
Als Normalkollektiv wird definiert: 'gesunde' PatientInnen ohne erhöhtes Risiko. Es kann spezifische Richtgrenzen für andere Kollektive geben. Mögliche Unterscheidungen sind:\n
* nach Alter
* nach Geschlecht (divers, männlich, weiblich)
* Dritter Listenpunkt
* nach Konstitution/Merkmal
* nach körperlichem Zustand
    
Es gibt unvollständige Standardisierungsansätze für die Eingrenzung von Kollektiven (nachzulesen z.B. bei XeHealth ID 5.3 WP5 Draft V0.7 oder HL7 FHIR oder LDT3). 
Bisher sind aber keine ausgereiften Standards zur Bezeichnung oder Strukturierung von Kollektiven verfügbar. Aus diesem Grund wird hier ein Freitextfeld ohne Restriktionen angeboten. Beispiele für Inhalte sind:\n
* Erwachsene, männlich, 30-50 Jahre
* Raucher
* Dritter Listenpunkt
* Kind (Beginn des 4. bis zum vollendeten 12. Lebensjahr)
* Weiblich, postmenopausal

Zusätzlich zur Freitextangabe einer LDT-Information ist in FHIR auch die Codierung möglich (optional)"
    * text 1.. MS
      * ^definition = "In der Freitextangabe zum Kollektiv können mehrere Angaben kombiniert aufgeführt werden."
  * text MS
* derivedFrom MS
  * ^definition = "Laboruntersuchungen, die als Berechnung erstellt werden, können auf Laboruntersuchungen beruhen, die hier referenziert werden können."
* insert Reference(derivedFrom)
//* derivedFrom only Reference(KBV_PR_MIO_LAB_Observation_Laboratory_Study|1.0.0-update)
* component MS
  * ^definition = "Ein Untersuchungsbild-Anhang wird in einer Component abgebildet."
  * extension MS
  * extension contains $extension-Observation.value named value-r5 0..1
  * extension[value-r5] MS
    * ^short = "Only for result of type attachment"
    * value[x] only Attachment
    * valueAttachment 1..1 MS
      * contentType 1..1 MS
      * contentType from https://fhir.kbv.de/ValueSet/KBV_VS_MIO_LAB_MIME_Types|1.0.0-update (required)
      * language ..0
      * data 1..1 MS
      * url ..0
      * size ..0
      * hash ..0
      * title 1..1 MS
      * creation ..0
  * code.coding.version 1..1
  * code = $KBV_CS_MIO_LAB_mio42|1.0.0-update#bild-anhang "Bild-Anhang"
  * dataAbsentReason = $cs-data-absent-reason#not-permitted "Not Permitted"
