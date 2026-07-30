import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure FractureMechanicsPackage where
  stressIntensityFactor : Prop
  crackGrowthCriterion : Prop
  fatigueCycleModel : Prop
  toughnessTransitionCurve : Prop
  failureAssessmentDiagram : Prop

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  stressIntensityFactorClosed : F.stressIntensityFactor
  crackGrowthCriterionClosed : F.crackGrowthCriterion
  fatigueCycleModelClosed : F.fatigueCycleModel
  toughnessTransitionCurveClosed : F.toughnessTransitionCurve
  failureAssessmentDiagramClosed : F.failureAssessmentDiagram

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.stressIntensityFactor ∧ F.crackGrowthCriterion ∧
  F.fatigueCycleModel ∧ F.toughnessTransitionCurve ∧
  F.failureAssessmentDiagram

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage)
    (E : FractureMechanicsEvidence F) : FractureMechanicsClosed F :=
  And.intro E.stressIntensityFactorClosed
    (And.intro E.crackGrowthCriterionClosed
      (And.intro E.fatigueCycleModelClosed
        (And.intro E.toughnessTransitionCurveClosed
          E.failureAssessmentDiagramClosed)))

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse
