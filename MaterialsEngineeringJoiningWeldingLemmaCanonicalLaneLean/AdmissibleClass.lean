import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure WeldingAdmittedObject where
  object : Type
  propertySatisfied : Prop

structure AdmissibleClass where
  object : WeldingAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  WeldingWitnessClosed A.object.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse
