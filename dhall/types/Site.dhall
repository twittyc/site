let Job = ./Job.dhall

in { Type = {name : Text
, title : Text
, headshot: Text
, summary: Text
, jobHistory : List Job.Type
}
, default =
    { name = "Author Name"
    , headshot = "https://example.com/headshot.webp"
    , summary = "Summary of author's history"
    , jobHistory = [] : List Job.Type
    }
}