import MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure CrystallographyPhasePackage where
  latticeType : Type u
  unitCell : latticeType → Type v
  phaseBoundary : Prop
  solidificationPath : Prop
  phaseFractionPrediction : Prop

structure CrystallographyPhaseEvidence (C : CrystallographyPhasePackage) where
  latticeTypeClosed : True
  unitCellClosed : True
  phaseBoundaryClosed : C.phaseBoundary
  solidificationPathClosed : C.solidificationPath
  phaseFractionPredictionClosed : C.phaseFractionPrediction

def CrystallographyPhaseClosed (C : CrystallographyPhasePackage) : Prop :=
  C.phaseBoundary ∧ C.solidificationPath ∧ C.phaseFractionPrediction

theorem crystallography_phase_closed_from_evidence (C : CrystallographyPhasePackage) (E : CrystallographyPhaseEvidence C) : CrystallographyPhaseClosed C := by
  exact And.intro E.phaseBoundaryClosed (And.intro E.solidificationPathClosed E.phaseFractionPredictionClosed)

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse