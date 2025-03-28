{ Type =
    { name: Text
    , summary : Text
    , image : Optional Text
    , url : Optional Text
    , jobTitle : Optional Text
    , phone : Optional Text
    , email : Optional Text
    , github : Optional Text
    , matrix : Optional Text
    }
  , default =
    {
        name = ""
        , summary = ""
        , image = None Text
        , url = None Text
        , jobTitle = None Text
        , phone = None Text
        , email = None Text
        , github = None Text
        , matrix = None Text
    }
}