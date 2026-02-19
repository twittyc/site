let Job = ./Job.dhall

let Buzzword = ./Buzzword.dhall

let Link = ./Link.dhall

let Location = ./Location.dhall

in  { Type =
        { name : Text
        , title : Text
        , headshot : Text
        , summary : Text
        , location : Location.Type
        , jobs : List Job.Type
        , buzzwords : List Buzzword.Type
        , notableContributions : List Link.Type
        , contact :
            { email : Text
            , location : Text
            , social :
                { github : Optional Text
                , linkedin : Optional Text
                , twitter : Optional Text
                }
            }
        }
    , default =
        { name = "Author Name"
        , title = "Role"
        , headshot = "https://example.com/headshot.webp"
        , summary = "Summary of author's history"
        , location = Location::{=}
        , jobs = [] : List Job.Type
        , buzzwords = [] : List Buzzword.Type
        , notableContributions = [] : List Link.Type
        , contact =
            { email = "author@example.com"
            , location = "City, ST"
            , social =
                { github = None Text
                , linkedin = None Text
                , twitter = None Text
                }
            }
        }
    }
