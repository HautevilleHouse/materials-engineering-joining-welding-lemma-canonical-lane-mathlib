import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  WeldingWitnessClosed A.object.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.propertySatisfied

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse
