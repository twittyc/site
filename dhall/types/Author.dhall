let Link = ./Link.dhall

in { Type =
    { name: Text
    , summary : Text
    , image : Optional Text
    , jobTitle : Optional Text
    , website : Optional Link.Type
    , email: Optional Link.Type
    , github: Optional Link.Type
    , matrix : Optional Link.Type
    , linkedin: Optional Link.Type
    }
  , default =
    {
        name = ""
        , summary = ""
        , image = None Text
        , jobTitle = None Text
        , website = None Link.Type
        , email = None Link.Type
        , github = None Link.Type
        , matrix = None Link.Type
        , linkedin = None Link.Type
    }
}