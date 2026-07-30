import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure PhaseDiagramPackage where
  temperatureRange : Type u
  compositionRange : Type v
  phaseBoundaries : Prop
  invariantReactions : Prop
  solidSolubility : Prop
  eutecticTemperature : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  phaseBoundariesClosed : P.phaseBoundaries
  invariantReactionsClosed : P.invariantReactions
  solidSolubilityClosed : P.solidSolubility
  eutecticTemperatureClosed : P.eutecticTemperature

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.phaseBoundaries ∧ P.invariantReactions ∧ P.solidSolubility ∧ P.eutecticTemperature

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage) (E : PhaseDiagramEvidence P) :
    PhaseDiagramClosed P := by
  exact And.intro E.phaseBoundariesClosed
    (And.intro E.invariantReactionsClosed
      (And.intro E.solidSolubilityClosed E.eutecticTemperatureClosed))

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse
