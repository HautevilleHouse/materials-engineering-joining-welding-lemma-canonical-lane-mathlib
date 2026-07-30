import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure ElasticityFracturePackage where
  stressStrainCurve : Type u
  youngModulus : Prop
  fractureToughness : Prop
  plasticDeformation : Prop
  crackPropagation : Prop

structure ElasticityFractureEvidence (E : ElasticityFracturePackage) where
  youngModulusClosed : E.youngModulus
  fractureToughnessClosed : E.fractureToughness
  plasticDeformationClosed : E.plasticDeformation
  crackPropagationClosed : E.crackPropagation

def ElasticityFractureClosed (E : ElasticityFracturePackage) : Prop :=
  E.youngModulus ∧ E.fractureToughness ∧ E.plasticDeformation ∧ E.crackPropagation

theorem elasticity_fracture_closed_from_evidence (E : ElasticityFracturePackage) (Ev : ElasticityFractureEvidence E) :
    ElasticityFractureClosed E := by
  exact And.intro Ev.youngModulusClosed
    (And.intro Ev.fractureToughnessClosed
      (And.intro Ev.plasticDeformationClosed Ev.crackPropagationClosed))

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse
