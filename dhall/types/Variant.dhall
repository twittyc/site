let Role = ./Role.dhall

in  { Type =
        { key : Text
        , title : Text
        , tagline : Optional Text
        , summary : Optional Text
        , roleTags : List Role.Type
        , includeAll : Bool
        }
    , default =
        { key = "master"
        , title = "Master Resume"
        , tagline = None Text
        , summary = None Text
        , roleTags = [] : List Role.Type
        , includeAll = True
        }
    }
