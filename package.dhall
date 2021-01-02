let imports =
      { GHA =
          https://raw.githubusercontent.com/awseward/dhall-misc/5cd89bd529926b2e06e04731c87c02e07b3423b8/GHA/package.dhall sha256:c646e22542997a419218871938b9c902aeb9ed134116ad0e5ca06bd119d2c663
      , Map =
          https://raw.githubusercontent.com/dhall-lang/dhall-lang/v20.0.0/Prelude/Map/package.dhall sha256:c6602939eb75ddaf43e75a37e1f27ace97e03685ceb9d77605b4372547f7cfa8
      }

let GHA = imports.GHA

let name = "awseward/gh-actions-shell"

let version = "0.1.3"

let Inputs = { Type = {}, default = {=} }

let mkStep =
      λ(common : GHA.Step.Common.Type) →
      λ(inputs : Inputs.Type) →
        GHA.Step.mkUses
          common
          GHA.Step.Uses::{
          , uses = "${name}@${version}"
          , `with` = toMap inputs : imports.Map.Type Text Text
          }

in  { mkStep, Inputs } ⫽ GHA.Step.{ Common }
