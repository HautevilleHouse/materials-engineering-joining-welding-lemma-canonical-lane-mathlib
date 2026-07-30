import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure WeldingHeatTransferPackage where
  heatSourceModel : Type u
  temperatureDistribution : Prop
  coolingRate : Prop
  thermalCycle : Prop
  residualStress : Prop

structure WeldingHeatTransferEvidence (W : WeldingHeatTransferPackage) where
  temperatureDistributionClosed : W.temperatureDistribution
  coolingRateClosed : W.coolingRate
  thermalCycleClosed : W.thermalCycle
  residualStressClosed : W.residualStress

def WeldingHeatTransferClosed (W : WeldingHeatTransferPackage) : Prop :=
  W.temperatureDistribution ∧ W.coolingRate ∧ W.thermalCycle ∧ W.residualStress

theorem welding_heat_transfer_closed_from_evidence (W : WeldingHeatTransferPackage) (E : WeldingHeatTransferEvidence W) :
    WeldingHeatTransferClosed W := by
  exact And.intro E.temperatureDistributionClosed
    (And.intro E.coolingRateClosed
      (And.intro E.thermalCycleClosed E.residualStressClosed))

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse
