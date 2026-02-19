let Location = ./Location.dhall

let Link = ./Link.dhall

let Job = ./Job.dhall

let Buzzword = ./Buzzword.dhall

in  { Type =
        { name : Text
        , tagline : Text
        , summary : Text
        , location : Location.Type
        , buzzwords : List Buzzword.Type
        , notableContributions : List Link.Type
        , jobs : List Job.Type
        }
    , default =
      { name = "Cory Twitty"
      , tagline = "Senior DevOps Engineer"
      , summary = ""
      , location = Location::{
        , city = "Denver"
        , stateOrProvince = "CO"
        , country = "USA"
        }
      , buzzwords = [] : List Buzzword.Type
      , notableContributions = [] : List Link.Type
      , jobs = [] : List Job.Type
      }
    }
