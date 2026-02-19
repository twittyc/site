let Role = ./Role.dhall

in  { Type =
        { name : Text
        , rating : Natural  -- Using Natural ensures we get a non-negative integer
        , roleTags : List Role.Type
        }
    , default =
        { name = ""
        , rating = 50  -- Default middle rating (assuming 0-100 scale)
        , roleTags = [] : List Role.Type
        }
    }
