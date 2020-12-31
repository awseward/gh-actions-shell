let action_templates =
      https://raw.githubusercontent.com/awseward/dhall-misc/expose-Env-and-With/action_templates/package.dhall

let GHA = action_templates.gha/jobs

let Inputs = { Type = {}, default = {=} }

let mkJobV =
      λ(uses : Text) →
      λ(inputs : Inputs.Type) →
        GHA.Step.uses GHA.Uses::{ uses, `with` = toMap inputs : GHA.With.Type }

let mkJob = mkJobV "awseward/gh-actions-shell@0.1.1"

in  { mkJob, mkJobV, Inputs }
