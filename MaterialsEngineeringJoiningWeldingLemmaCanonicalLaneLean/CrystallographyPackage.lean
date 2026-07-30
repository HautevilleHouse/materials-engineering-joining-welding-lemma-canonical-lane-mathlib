import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure CrystallographyPackage where
  baseCrystalStructure : Prop
  weldPoolSolidification : Prop
  epitaxialGrowth : Prop
  grainStructureEvolution : Prop
  orientationRelations : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  baseCrystalStructureClosed : C.baseCrystalStructure
  weldPoolSolidificationClosed : C.weldPoolSolidification
  epitaxialGrowthClosed : C.epitaxialGrowth
  grainStructureEvolutionClosed : C.grainStructureEvolution
  orientationRelationsClosed : C.orientationRelations

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.baseCrystalStructure ∧ C.weldPoolSolidification ∧
  C.epitaxialGrowth ∧ C.grainStructureEvolution ∧ C.orientationRelations

theorem crystallography_closed_from_evidence (C : CrystallographyPackage)
    (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.baseCrystalStructureClosed
    (And.intro E.weldPoolSolidificationClosed
      (And.intro E.epitaxialGrowthClosed
        (And.intro E.grainStructureEvolutionClosed E.orientationRelationsClosed)))

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse