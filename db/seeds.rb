# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Facility.create(name: 'Blue Alps Ski Camp emergency facility')

p = Patient.create(first_name: 'Thomas', last_name: 'Schudel', mr: '30997', dob: Time.zone.now - 20.years, gender: 'male', facility: Facility.first )

a = Admission.create(moment: Time.zone.now, patient: p)

AdmissionDiagnosis.create(description: 'a fracture of upper end of the right tibia', coding_system: 'S82.101', patient: Patient.first, admission: Admission.first)

MedicalDiagnosis.create(description: 'a closed fracture in the right tibia', coding_system: 'S82.101', code: 'A', patient: p)

s = Symptom.create(description: 'severe pain', admission: Admission.first)

s = Symptom.create(description: 'swelling', admission: Admission.first)

s = Symptom.create(description: 'limited bending of the joint', admission: Admission.first)

Observation.create(description: 'No soft tissues were damaged', moment: Time.zone.now, admission: a)

Allergy.create(description: 'hypersensitivity to aspirin or NSAIDs', patient: p)

Allergy.create(description: 'gluten intolerance', patient: p)

ChronicCondition.create(description: 'Asthma', coding_system: 'J45', patient: p)

MedicationOrder.create(name: 'Acetaminophen', dosage: 500, route: 0, necessity: 'relieve pain', patient: p)

MedicationOrder.create(name: 'Naproxen', dosage: 500, route: 0, necessity: 'relieve sweling', patient: p)

OrderFrequency.create(value: '4', medication_order: MedicationOrder.first)

OrderFrequency.create(value: '6', medication_order: MedicationOrder.last)

DiagnosticProcedure.create(description: 'an exploratory radiography', patient: p, moment: Time.zone.now)

Treatment.create(description: 'temporary bracing the right leg', necessity: 'restrict the motion', patient: p)
