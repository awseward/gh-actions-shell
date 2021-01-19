let Prelude =
      https://prelude.dhall-lang.org/v20.0.0/package.dhall sha256:21754b84b493b98682e73f64d9d57b18e1ca36a118b81b33d0a243de8455814b

let T = {}

in  { Type = T
    , default = {=}
    , toJSON = λ(inputs : T) → Prelude.Map.empty Text Prelude.JSON.Type
    }
