let site = ./types/package.dhall

let Job = site.Job

let Company = site.Company

let Location = site.Location

let sd =
    Location::{
    , city = "San Diego"
    , stateOrProvince = "CA"
    , country = "USA"
    , remote = True
    }

let virgosvs = 
    Company::{
    , name = "Virgo Surgical Video Solutions"
    , url = Some "https://virgosvs.com"
    , location = sd
    , defunct = False
    }

in [ Job::{
    , company = virgosvs
    , title = "Senior DevOps Engineer"
    , contract = False
    , startDate = "2024-01-01"
    , endDate = Some "2024-01-01"
    , leaveReason = Some "Mass Layoffs"
    , locations = [ sd ]
    , highlights = 
        [ "Developed and maintained a CI/CD pipeline for a microservices architecture"
        , "Implemented monitoring and alerting for the application"
        , "Managed the deployment of the application to multiple environments"
        , "Developed and maintained a CI/CD pipeline for a microservices architecture"
        , "Implemented monitoring and alerting for the application"
        , "Managed the deployment of the application to multiple environments"
        ]
    }
]