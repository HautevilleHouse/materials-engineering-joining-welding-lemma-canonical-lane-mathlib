import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure HeatAffectedZonePackage where
  thermalCycle : Prop
  microstructuralGradient : Prop
  hardnessProfile : Prop
  residualStress : Prop
  propertyDegradation : Prop

structure HeatAffectedZoneEvidence (H : HeatAffectedZonePackage) where
  thermalCycleClosed : H.thermalCycle
  microstructuralGradientClosed : H.microstructuralGradient
  hardnessProfileClosed : H.hardnessProfile
  residualStressClosed : H.residualStress
  propertyDegradationClosed : H.propertyDegradation

def HeatAffectedZoneClosed (H : HeatAffectedZonePackage) : Prop :=
  H.thermalCycle ∧ H.microstructuralGradient ∧ H.hardnessProfile ∧
  H.residualStress ∧ H.propertyDegradation

theorem heat_affected_zone_closed_from_evidence (H : HeatAffectedZonePackage) (E : HeatAffectedZoneEvidence H) :
    HeatAffectedZoneClosed H := by
  exact And.intro E.thermalCycleClosed
    (And.intro E.microstructuralGradientClosed
      (And.intro E.hardnessProfileClosed
        (And.intro E.residualStressClosed E.propertyDegradationClosed)))

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse
