let Role = ./Role.dhall

in  { Type =
        { text : Text
        , roleTags : List Role.Type
        }
    , default =
        { text = ""
        , roleTags = [] : List Role.Type
        }
    }
