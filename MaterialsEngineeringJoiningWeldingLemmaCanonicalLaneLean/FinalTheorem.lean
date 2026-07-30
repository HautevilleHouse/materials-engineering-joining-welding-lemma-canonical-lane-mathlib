import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean.PhaseDiagram
import HautevilleHouse.MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean.ElasticityFracture
import HautevilleHouse.MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean.Crystallography
import HautevilleHouse.MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean.WeldingHeatTransfer

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

structure AdmittedObject where
  phaseDiagram : PhaseDiagramPackage
  phaseDiagramEvidence : PhaseDiagramEvidence phaseDiagram
  elasticityFracture : ElasticityFracturePackage
  elasticityFractureEvidence : ElasticityFractureEvidence elasticityFracture
  crystallography : CrystallographyPackage
  crystallographyEvidence : CrystallographyEvidence crystallography
  weldingHeatTransfer : WeldingHeatTransferPackage
  weldingHeatTransferEvidence : WeldingHeatTransferEvidence weldingHeatTransfer

def bridgeClosed (A : AdmissibleClass) : Prop :=
  PhaseDiagramClosed A.object.phaseDiagram ∧
  ElasticityFractureClosed A.object.elasticityFracture ∧
  CrystallographyClosed A.object.crystallography ∧
  WeldingHeatTransferClosed A.object.weldingHeatTransfer

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  let O := A.object
  have h1 : PhaseDiagramClosed O.phaseDiagram :=
    phase_diagram_closed_from_evidence O.phaseDiagram O.phaseDiagramEvidence
  have h2 : ElasticityFractureClosed O.elasticityFracture :=
    elasticity_fracture_closed_from_evidence O.elasticityFracture O.elasticityFractureEvidence
  have h3 : CrystallographyClosed O.crystallography :=
    crystallography_closed_from_evidence O.crystallography O.crystallographyEvidence
  have h4 : WeldingHeatTransferClosed O.weldingHeatTransfer :=
    welding_heat_transfer_closed_from_evidence O.weldingHeatTransfer O.weldingHeatTransferEvidence
  exact And.intro h1 (And.intro h2 (And.intro h3 h4))

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

def ConstrainedMaterialsEngineeringJoiningWeldingClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_materials_engineering_joining_welding_endgame (A : AdmissibleClass) :
    ConstrainedMaterialsEngineeringJoiningWeldingClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse
