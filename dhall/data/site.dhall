let Site = ./../types/Site.dhall
let Job = ./../types/Job.dhall
let jobs = ./jobHistory.dhall
let author = ./cory.dhall

in { name = author.name
    , title = author.jobTitle
    , headshot = author.image
    , summary = author.summary
    , jobHistory = jobs
}