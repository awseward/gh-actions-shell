let action_templates =
      https://raw.githubusercontent.com/awseward/dhall-misc/ebfc1cc2e7ffe6d43c5c6d0deff00af0e9e1c06a/action_templates/package.dhall sha256:fbf8db57938f18a00d1de610bba510e70a30f8e3ed9fd293158433de1b4655f9

let GHA = action_templates.gha/jobs

let Inputs = { Type = {}, default = {=} }

let mkJobV =
      λ(uses : Text) →
      λ(inputs : Inputs.Type) →
        GHA.Step.uses GHA.Uses::{ uses, `with` = toMap inputs : GHA.With.Type }

let mkJob = mkJobV "awseward/gh-actions-shell@0.1.2"

in  { mkJob, mkJobV, Inputs }
