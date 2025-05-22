let Location = ./Location.dhall

in  { Type =
        { name : Text
        , url : Optional Text
        , location : Location.Type
        , defunct : Bool
        , image : Optional Text
        }
    , default =
      { name = ""
      , url = None Text
      , location = Location::{=}
      , defunct = False
      , image = None Text
      }
    }