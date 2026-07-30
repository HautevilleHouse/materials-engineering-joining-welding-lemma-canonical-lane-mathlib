import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure HeatAffectedZonePackage where
  peakTemperatureField : Prop
  coolingRateModel : Prop
  grainGrowthKinetics : Prop
  hardnessDistribution : Prop
  residualStressProfile : Prop

structure HeatAffectedZoneEvidence (H : HeatAffectedZonePackage) where
  peakTemperatureFieldClosed : H.peakTemperatureField
  coolingRateModelClosed : H.coolingRateModel
  grainGrowthKineticsClosed : H.grainGrowthKinetics
  hardnessDistributionClosed : H.hardnessDistribution
  residualStressProfileClosed : H.residualStressProfile

def HeatAffectedZoneClosed (H : HeatAffectedZonePackage) : Prop :=
  H.peakTemperatureField ∧ H.coolingRateModel ∧
  H.grainGrowthKinetics ∧ H.hardnessDistribution ∧
  H.residualStressProfile

theorem heat_affected_zone_closed_from_evidence (H : HeatAffectedZonePackage)
    (E : HeatAffectedZoneEvidence H) : HeatAffectedZoneClosed H :=
  And.intro E.peakTemperatureFieldClosed
    (And.intro E.coolingRateModelClosed
      (And.intro E.grainGrowthKineticsClosed
        (And.intro E.hardnessDistributionClosed
          E.residualStressProfileClosed)))

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse
