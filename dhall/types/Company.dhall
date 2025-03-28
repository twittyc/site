let Location = ./Location.dhall

in  { Type =
        { name : Text
        , url : Optional Text
        , location : Location.Type
        , defunct : Bool
        }
    , default =
      { name = ""
      , url = None Text
      , location = Location::{=}
      , defunct = False
      }
    }