let imports = ../imports.dhall

let GHA = imports.GHA

let On = GHA.On

let OS = GHA.OS.Type

let job-templates = imports.job-templates

let Checkout = job-templates.actions/Checkout

in  GHA.Workflow::{
    , name = "CI"
    , on = On.names [ "push" ]
    , jobs = toMap
        { check-Dockerfile = GHA.Job::{
          , runs-on = [ OS.ubuntu-latest ]
          , steps =
              Checkout.plainDo
                [ let action = job-templates.brpaz/Hadolint

                  in  action.mkStep action.Common::{=} action.Inputs::{=}
                ]
          }
        , check-shell = GHA.Job::{
          , runs-on = [ OS.ubuntu-latest ]
          , steps =
              Checkout.plainDo
                [ let action = imports.gh-actions-shell

                  in  action.mkStep action.Common::{=} action.Inputs::{=}
                ]
          }
        , check-dhall = GHA.Job::{
          , runs-on = [ OS.ubuntu-latest ]
          , steps =
              Checkout.plainDo
                [ let action = imports.gh-actions-dhall

                  in  action.mkStep action.Common::{=} action.Inputs::{=}
                ]
          }
        }
    }
