import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure CrystallographyPackage where
  latticeStructure : Type u
  grainBoundary : Prop
  orientationRelationship : Prop
  misorientationAngle : Prop
  phaseTransformation : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  latticeStructureClosed : C.latticeStructure
  grainBoundaryClosed : C.grainBoundary
  orientationRelationshipClosed : C.orientationRelationship
  misorientationAngleClosed : C.misorientationAngle
  phaseTransformationClosed : C.phaseTransformation

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.latticeStructure ∧ C.grainBoundary ∧ C.orientationRelationship ∧ C.misorientationAngle ∧ C.phaseTransformation

theorem crystallography_closed_from_evidence (C : CrystallographyPackage) (E : CrystallographyEvidence C) :
    CrystallographyClosed C := by
  exact And.intro E.latticeStructureClosed
    (And.intro E.grainBoundaryClosed
      (And.intro E.orientationRelationshipClosed
        (And.intro E.misorientationAngleClosed E.phaseTransformationClosed)))

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse
