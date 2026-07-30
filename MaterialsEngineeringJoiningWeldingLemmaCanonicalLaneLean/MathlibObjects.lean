import MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure WeldingSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure WeldingAdmittedObject where
  space : WeldingSpace
  threeDimensionalSolid : Prop
  weldJointGeometry : Prop
  joinedConfiguration : Type
  joinerTopology : TopologicalSpace joinedConfiguration
  weldJointFormed : Prop
  conclusion : weldJointFormed

structure WeldingEndgameState where
  object : WeldingAdmittedObject

def WeldingWitnessClosed (O : WeldingAdmittedObject) : Prop :=
  O.weldJointFormed

end MaterialsEngineeringJoiningWeldingLemmaCanonicalLaneLean
end HautevilleHouse