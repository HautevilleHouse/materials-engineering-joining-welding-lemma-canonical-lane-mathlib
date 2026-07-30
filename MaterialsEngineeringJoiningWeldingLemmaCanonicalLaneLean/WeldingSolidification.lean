import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure WeldingSolidificationPackage where
  heatInputModel : Prop
  fusionZoneGeometry : Prop
  solidificationCracking : Prop
  weldPoolDynamics : Prop
  coolingRateControl : Prop

structure WeldingSolidificationEvidence (W : WeldingSolidificationPackage) where
  heatInputModelClosed : W.heatInputModel
  fusionZoneGeometryClosed : W.fusionZoneGeometry
  solidificationCrackingClosed : W.solidificationCracking
  weldPoolDynamicsClosed : W.weldPoolDynamics
  coolingRateControlClosed : W.coolingRateControl

def WeldingSolidificationClosed (W : WeldingSolidificationPackage) : Prop :=
  W.heatInputModel ∧ W.fusionZoneGeometry ∧ W.solidificationCracking ∧
  W.weldPoolDynamics ∧ W.coolingRateControl

theorem welding_solidification_closed_from_evidence (W : WeldingSolidificationPackage) (E : WeldingSolidificationEvidence W) :
    WeldingSolidificationClosed W := by
  exact And.intro E.heatInputModelClosed
    (And.intro E.fusionZoneGeometryClosed
      (And.intro E.solidificationCrackingClosed
        (And.intro E.weldPoolDynamicsClosed E.coolingRateControlClosed)))

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse
