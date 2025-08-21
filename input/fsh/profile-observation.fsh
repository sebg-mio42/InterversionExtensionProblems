Profile: KBV_PR_MIO_LAB_Observation_Laboratory_Study_Open
Parent: Observation
Id: KBV-PR-MIO-LAB-Observation-Laboratory-Study-Open
Title: "KBV_PR_MIO_LAB_Observation_Laboratory_Study_Open"
Description: "Dieses Profil bildet eine Laboruntersuchung ab."
* component MS
  * ^definition = "Ein Untersuchungsbild-Anhang wird in einer Component abgebildet."
  * extension MS
  * extension contains $extension-Observation.value[x] named value-r5 0..1
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
