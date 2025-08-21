Instance: 035761c3-8934-499f-bf34-3963979afb56
InstanceOf: KBV-PR-MIO-LAB-Observation-Laboratory-Study-Open
* meta
  * versionId = "1"
  * lastUpdated = "2023-05-03T11:15:00+01:00"
* text
  * status = #extensions
  * div = "<div xmlns='http://www.w3.org/1999/xhtml'>Laboruntersuchung</div>"
* status = #final
* code = $loinc-2.80#98981-4 "Urate [Mass/volume] in Blood"
* subject = Reference(Patient/b65dfcca-c6ce-4dac-8742-8da00c192c7d)
  * identifier
    * type = $identifier-type-de-basis#KVZ10 "Krankenversichertennummer"
    * system = $sid-identifier-kvid-10
    * value = "K123456789"
* effectiveDateTime = "2021-11-15T11:30:00+01:00"
* issued = "2021-11-15T11:30:00+01:00"
* performer = Reference(PractitionerRole/a424d6c6-de52-443e-a9b2-5240d3b9401a)
* valueQuantity = 6.5 $ucum#mg/dL "mg/dL"
* note.text = "**Name**"
* specimen = Reference(Specimen/4f47fe9c-d92e-46f4-ad6d-85740aaa467b)
* device = Reference(Device/18a30aa6-3b2d-4738-9ca9-125a452d14e0)
* component
  * extension[value-r5].valueAttachment
    * contentType = #application/pdf
    * data = "dGVzdA=="
    * title = "Anhang"
  