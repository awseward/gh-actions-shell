let gh-actions-dhall =
      https://raw.githubusercontent.com/awseward/gh-actions-dhall/0.4/package.dhall

let gh-actions-shell =
      https://raw.githubusercontent.com/awseward/gh-actions-shell/0.1/package.dhall

let dhall-misc =
        env:DHALL_MISC
      ? https://raw.githubusercontent.com/awseward/dhall-misc/20210618093657/package.dhall
          sha256:401dd621799f1481244580856c2fd18f7c0ba9323c7b5b3a309b4e3017c9c57b

in  dhall-misc.{ GHA, job-templates } ⫽ { gh-actions-dhall, gh-actions-shell }
