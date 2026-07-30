import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure PhaseDiagramPackage where
  temperatureCompositionMap : Prop
  phaseBoundaryDefined : Prop
  eutecticPoint : Prop
  equilibriumConditions : Prop
  leverRuleApplicable : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  temperatureCompositionMapClosed : P.temperatureCompositionMap
  phaseBoundaryDefinedClosed : P.phaseBoundaryDefined
  eutecticPointClosed : P.eutecticPoint
  equilibriumConditionsClosed : P.equilibriumConditions
  leverRuleApplicableClosed : P.leverRuleApplicable

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.temperatureCompositionMap ∧ P.phaseBoundaryDefined ∧ P.eutecticPoint ∧
  P.equilibriumConditions ∧ P.leverRuleApplicable

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  exact And.intro E.temperatureCompositionMapClosed
    (And.intro E.phaseBoundaryDefinedClosed
      (And.intro E.eutecticPointClosed
        (And.intro E.equilibriumConditionsClosed E.leverRuleApplicableClosed)))

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse
