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

let sf =
    Location::{
    , city = "San Francisco"
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

let gremlin =
    Company::{
    , name = "Gremlin"
    , url = Some "https://gremlin.com"
    , location = sf
    , defunct = False
    }

in [ Job::{
    , company = virgosvs
    , title = "Senior DevOps Engineer"
    , contract = False
    , startDate = "2024-01"
    , endDate = Some "2024-01"
    , leaveReason = Some "Mass Layoffs"
    , locations = [ sd ]
    , highlights = 
        [ "Fully automated the CI/CD pipeline for all 15 service repositories and our Terraform infrastructure, reducing deployment time and minimizing production deployment risks."
        , "Updated service code to implement zero-trust security best practices, strengthening authentication and access control, which reduced security vulnerabilities and enhanced compliance readiness. (Python, Golang)"
        , "Deployed production services across multiple global regions, reducing latency and improving application availability for international users while also ensuring compliance with country-specific data residency and regulatory requirements."
        , "Automated certificate rotation and introduced ephemeral certificates, strengthening security and reducing manual intervention, lowering the risk of expired or compromised credentials."
        , "Leveraged Nix to standardize developer environments, cutting onboarding time allowing new engineers to contribute faster and reducing setup inconsistencies."
        ]
    }
  , Job::{
    , company = gremlin
    , title = "Senior Platform & Backend Engineer"
    , contract = False
    , startDate = "2021-03"
    , endDate = Some "2023-01"
    , leaveReason = Some "Mass Layoffs"
    , locations = [ sf ]
    , highlights = 
        [ "Designed and implemented cgroup v2 support for Gremlin machine agents improving resource isolation and ensuring compatibility with modern Linux distributions. (Rust)"
        , "Redesigned a high-throughput and spikey DynamoDB table, reducing write costs by 30-45% for some customers, improving performance and lowering operational expenses."
        , "Separated staging and production environments into isolated AWS accounts with no downtime, aligning with AWS Well-Architected best practices and enhancing security."
        , "Migrated CloudFormation stacks into Terraform without redeploying resources, simplifying infrastructure as code and improving maintainability."
        ]
    }
]