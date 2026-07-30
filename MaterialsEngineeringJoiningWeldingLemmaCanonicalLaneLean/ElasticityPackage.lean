import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure ElasticityPackage where
  youngsModulus : Prop
  poissonRatio : Prop
  thermalExpansionCoefficient : Prop
  stressStrainConstitutiveLaw : Prop
  lamesParameters : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  youngsModulusClosed : E.youngsModulus
  poissonRatioClosed : E.poissonRatio
  thermalExpansionCoefficientClosed : E.thermalExpansionCoefficient
  stressStrainConstitutiveLawClosed : E.stressStrainConstitutiveLaw
  lamesParametersClosed : E.lamesParameters

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.youngsModulus ∧ E.poissonRatio ∧
  E.thermalExpansionCoefficient ∧ E.stressStrainConstitutiveLaw ∧
  E.lamesParameters

theorem elasticity_closed_from_evidence (E : ElasticityPackage)
    (Ev : ElasticityEvidence E) : ElasticityClosed E :=
  And.intro Ev.youngsModulusClosed
    (And.intro Ev.poissonRatioClosed
      (And.intro Ev.thermalExpansionCoefficientClosed
        (And.intro Ev.stressStrainConstitutiveLawClosed
          Ev.lamesParametersClosed)))

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse
