import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure PhaseDiagramsPackage where
  temperatureRange : Prop
  compositionRange : Prop
  solidusLiquidusDefined : Prop
  eutecticOrPeritecticModeled : Prop
  diffusionZoneProfile : Prop

structure PhaseDiagramsEvidence (P : PhaseDiagramsPackage) where
  temperatureRangeClosed : P.temperatureRange
  compositionRangeClosed : P.compositionRange
  solidusLiquidusDefinedClosed : P.solidusLiquidusDefined
  eutecticOrPeritecticModeledClosed : P.eutecticOrPeritecticModeled
  diffusionZoneProfileClosed : P.diffusionZoneProfile

def PhaseDiagramsClosed (P : PhaseDiagramsPackage) : Prop :=
  P.temperatureRange ∧ P.compositionRange ∧
  P.solidusLiquidusDefined ∧ P.eutecticOrPeritecticModeled ∧
  P.diffusionZoneProfile

theorem phase_diagrams_closed_from_evidence (P : PhaseDiagramsPackage)
    (E : PhaseDiagramsEvidence P) : PhaseDiagramsClosed P :=
  And.intro E.temperatureRangeClosed
    (And.intro E.compositionRangeClosed
      (And.intro E.solidusLiquidusDefinedClosed
        (And.intro E.eutecticOrPeritecticModeledClosed
          E.diffusionZoneProfileClosed)))

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse
