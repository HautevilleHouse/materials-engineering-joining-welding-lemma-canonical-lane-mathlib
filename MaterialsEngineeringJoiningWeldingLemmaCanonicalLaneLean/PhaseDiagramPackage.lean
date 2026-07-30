import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure PhaseDiagramPackage where
  solidusLiquidusBoundaries : Prop
  phaseStabilityRegions : Prop
  diffusionControlledTransformations : Prop
  microsegregationModel : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  solidusLiquidusBoundariesClosed : P.solidusLiquidusBoundaries
  phaseStabilityRegionsClosed : P.phaseStabilityRegions
  diffusionControlledTransformationsClosed : P.diffusionControlledTransformations
  microsegregationModelClosed : P.microsegregationModel

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.solidusLiquidusBoundaries ∧ P.phaseStabilityRegions ∧
  P.diffusionControlledTransformations ∧ P.microsegregationModel

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage)
    (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.solidusLiquidusBoundariesClosed
    (And.intro E.phaseStabilityRegionsClosed
      (And.intro E.diffusionControlledTransformationsClosed E.microsegregationModelClosed))

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse