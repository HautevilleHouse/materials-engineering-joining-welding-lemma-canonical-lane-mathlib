import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure WeldingMetallurgyPackage where
  heatAffectedZone : Prop
  fusionZoneChemistry : Prop
  solidificationCracking : Prop
  phaseTransformationKinetics : Prop

structure WeldingMetallurgyEvidence (W : WeldingMetallurgyPackage) where
  heatAffectedZoneClosed : W.heatAffectedZone
  fusionZoneChemistryClosed : W.fusionZoneChemistry
  solidificationCrackingClosed : W.solidificationCracking
  phaseTransformationKineticsClosed : W.phaseTransformationKinetics

def WeldingMetallurgyClosed (W : WeldingMetallurgyPackage) : Prop :=
  W.heatAffectedZone ∧ W.fusionZoneChemistry ∧
  W.solidificationCracking ∧ W.phaseTransformationKinetics

theorem welding_metallurgy_closed_from_evidence (W : WeldingMetallurgyPackage)
    (E : WeldingMetallurgyEvidence W) : WeldingMetallurgyClosed W := by
  exact And.intro E.heatAffectedZoneClosed
    (And.intro E.fusionZoneChemistryClosed
      (And.intro E.solidificationCrackingClosed E.phaseTransformationKineticsClosed))

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse