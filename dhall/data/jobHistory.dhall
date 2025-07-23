let site = ../types/package.dhall

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

let sa =
    Location::{
    , city = "San Antonio"
    , stateOrProvince = "TX"
    , country = "USA"
    , remote = True
    }

let la =
    Location::{
    , city = "Los Angeles"
    , stateOrProvince = "CA"
    , country = "USA"
    , remote = True
    }

let dal =
    Location::{
    , city = "Dallas"
    , stateOrProvince = "TX"
    , country = "USA"
    , remote = False
    }

let kc =
    Location::{
    , city = "Kansas City"
    , stateOrProvince = "MO"
    , country = "USA"
    , remote = False
    }

let virgosvs = 
    Company::{
    , name = "Virgo Surgical Video Solutions"
    , url = Some "https://virgosvs.com"
    , location = sd
    , defunct = False
    , image = Some "https://raw.githubusercontent.com/twittyc/site/main/public/images/companies/virgosvs.webp"
    }

let gremlin =
    Company::{
    , name = "Gremlin"
    , url = Some "https://gremlin.com"
    , location = sf
    , defunct = False
    , image = Some "https://raw.githubusercontent.com/twittyc/site/main/public/images/companies/gremlin.png"
    }

let onica =
    Company::{
    , name = "Onica, a Rackspace company"
    , url = Some "https://www.rackspace.com"
    , location = sa
    , defunct = True
    , image = Some "https://raw.githubusercontent.com/twittyc/site/main/public/images/companies/onica.webp"
    }

let rival =
    Company::{
    , name = "Rival labs, inc."
    , location = la
    , defunct = True
    , image = Some "https://raw.githubusercontent.com/twittyc/site/main/public/images/companies/rival.webp"
    }

let swa =
    Company::{
    , name = "Southwest Airlines"
    , url = Some "https://www.southwest.com"
    , location = dal
    , defunct = False
    , image = Some "https://raw.githubusercontent.com/twittyc/site/main/public/images/companies/swa.webp"
    }

let cern =
    Company::{
    , name = "Cerner Corporation"
    , url = Some "https://www.oracle.com/health/"
    , location = kc
    , defunct = True
    , image = Some "https://raw.githubusercontent.com/twittyc/site/main/public/images/companies/cern.png"
    }

in [ Job::{
    , company = virgosvs
    , title = "Senior DevOps Engineer"
    , contract = False
    , startDate = "2023-01"
    , endDate = Some "Present"
    , leaveReason = Some "Company Closure"
    , locations = [ sd ]
    , highlights =  
        [ "Fully automated the CI/CD pipeline for all 15 service repositories and our Terraform infrastructure, reducing deployment time and minimizing production deployment risks."
        , "Built bespoke certificate management service to create a secured, centralized authority for inter-service and field device certificate management; reducing cost, configuration and deployment complexity. (Python, Golang)"
        , "Updated service code to implement zero-trust security best practices, strengthening authentication and access control, which reduced security vulnerabilities and enhanced compliance readiness. (Python, Golang)"
        , "Led zero-trust rollout across multi-region GKE clusters, automating ephemeral certificate rotation, improving inter-service auth security posture."
        , "Deployed production services across multiple global regions, reducing latency and improving application availability for international users while also ensuring compliance with country-specific data residency and regulatory requirements."
        , "Led engineering and platform initiatives for SOC 2 compliance, remediating CVEs across all production workloads and maintaining continuous security posture via automated scanning and alerting."
        , "Rolled out Pub/Sub integration for the endoml.ai service, enabling decoupled service communication and scalable async processing; throughput increased by 35 percent under peak load."
        , "Developed robust monitoring for Pub/Sub service using Prometheus, tracking key metrics such as: backlog growth rate, message processing latency, and publish volume."
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
        , "Reduced AWS DynamoDB write costs by ~45 percent by redesigning spike-heavy tables to better accommodate high-throughput workloads."
        , "Hardened IaC practices by migrating from CloudFormation to Terraform with zero downtime, improving deployment maintainability."
        , "Separated staging and production environments into isolated AWS accounts with no downtime, aligning with AWS Well-Architected best practices and enhancing security."
        ]
    }
  , Job::{
    , company = onica
    , title = "Senior Cloud Engineer"
    , contract = False
    , startDate = "2020-06"
    , endDate = Some "2021-03"
    , leaveReason = Some "Misalignment"
    , locations = [ sa ]
    , highlights =
        [ "Guided enterprise Kubernetes rollouts with Istio service mesh integration."
        , "Standardized infrastructure deployment using Troposphere-tested CloudFormation templates, increasing reproducibility and deployment confidence by 70 percent."
        , "Containerized dev environments with Docker, accelerating team onboarding and reducing setup-related support tickets by 60 percent."
        , "Designed a 1000+ node Kubernetes cluster upgrade rollout during a 3 hour downtime window."
        ]
  }
  , Job::{
    , company = rival
    , title = "Software Engineer"
    , contract = False
    , startDate = "2019-09"
    , endDate = Some "2020-06"
    , leaveReason = Some "Company Closure"
    , locations = [ la ]
    , highlights = 
        [ "Implemented Datadog-based SLO dashboards and alerting for Kinesis-backed pipelines, reducing incident detection time by 40 percent."
        , "Advocated for and implemented progressive delivery with feature flags, reducing production rollback frequency by 10 percent."
        , "Optimized Terraform modules and patched upstream provider bugs, improving module reliability and CI pipeline pass rate by 25 percent."
        ]
  }
  , Job::{
    , company = swa
    , title = "Software Engineer"
    , contract = False
    , startDate = "2018-10"
    , endDate = Some "2019-09"
    , leaveReason = Some "New opportunity"
    , locations = [ dal ]
    , highlights = 
        [ "Spearheaded EKS adoption across 9 environments, mentoring 10+ dev teams."
        , "Embedded SLO-driven monitoring and postmortem culture across teams, leading to faster incident response."
        , "Architected and maintained robust CI/CD pipelines across multiple orgs (Jenkins, GitHub Actions), incorporating automated tests, integration validation, user acceptance via Cypress, and inline security scanning; improved deployment frequency by 3x while maintaining reliability."
        , "Standardized Docker build pipelines using multi-stage builds and image factories; reduced image sizes by 40 percent and improved build caching, cutting CI cycle times by 30 percent."
        ]
  }
  , Job::{
    , company = cern
    , title = "Site Reliability Engineer"
    , contract = False
    , startDate = "2016-02"
    , endDate = Some "2018-10"
    , leaveReason = Some "New Opportunity"
    , locations = [ kc ]
    , highlights = 
        [ "Reduced bare-metal provisioning time from weeks to minutes via PXE boot and Ansible automation."
        , "Deployed HA Vault clusters and automated etcd backups to S3, increasing secrets durability and disaster recovery readiness by 3x."
        , "Transitioned teams from manual deployments to CI/CD pipelines, improving deployment frequency by 4x."
        , "Designed and deployed hybrid Kubernetes federation between on-prem and Azure-based clusters to support regional failover and compliance-driven data locality."
        ]
  }
]
