let Inputs = ./inputs.dhall

let imports =
      { GHA =
          https://raw.githubusercontent.com/awseward/dhall-misc/20210119042727/GHA/package.dhall
            sha256:66dab3b3366cd30bedb43d34003bba451767d1634fefa15acef519ed9f0908ad
      }

let GHA = imports.GHA

let mkStep/next = GHA.actions.mkStep/next Inputs.Type Inputs.{ toJSON }

let mkStep = mkStep/next "awseward/gh-actions-shell" "0.1.7"

in  { mkStep, mkStep/next, Inputs } ⫽ GHA.Step.{ Common }
