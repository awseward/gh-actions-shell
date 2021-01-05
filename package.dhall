let imports =
      { GHA =
          https://raw.githubusercontent.com/awseward/dhall-misc/296ced2694cf01b087a690feaddbb18e7b562f1d/GHA/package.dhall sha256:895094e0c18a06217f82e6cf87fa543e555c93827386f72a22645c0046cfc796
      , Map =
          https://raw.githubusercontent.com/dhall-lang/dhall-lang/v20.0.0/Prelude/Map/package.dhall sha256:c6602939eb75ddaf43e75a37e1f27ace97e03685ceb9d77605b4372547f7cfa8
      }

let GHA = imports.GHA

let name = "awseward/gh-actions-shell"

let version = "0.1.3"

let Inputs = { Type = {}, default = {=} }

let mkStep =
      GHA.actions.mkStep
        name
        version
        Inputs.Type
        (λ(inputs : Inputs.Type) → toMap inputs : imports.Map.Type Text Text)

in  { mkStep, Inputs } ⫽ GHA.Step.{ Common }
