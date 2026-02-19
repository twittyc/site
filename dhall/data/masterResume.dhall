let site = ../types/package.dhall

let Resume = site.Resume

let Job = site.Job

let Buzzword = site.Buzzword

let Role = site.Role

let RoleTaggedHighlight = site.RoleTaggedHighlight

let Company = site.Company

let Link = site.Link

let Location = site.Location

let mapList =
    \(a : Type) ->
    \(b : Type) ->
    \(mapper : a -> b) ->
    \(items : List a) ->
      List/fold
        a
        items
        (List b)
        (\(item : a) -> \(acc : List b) -> [ mapper item ] # acc)
        ([] : List b)

let roleTaggedHighlightTexts =
    \(items : List RoleTaggedHighlight.Type) ->
      mapList
        RoleTaggedHighlight.Type
        Text
        (\(highlight : RoleTaggedHighlight.Type) -> highlight.text)
        items

let withRoleTaggedHighlights =
    \(job : Job.Type) ->
    \(items : List RoleTaggedHighlight.Type) ->
      job
        // { roleTaggedHighlights = items
           , highlights = roleTaggedHighlightTexts items
           }

let sre = Role.Type.SRE

let platformEngineer = Role.Type.PlatformEngineer

let cloudDevops = Role.Type.CloudDevops

let allRoles = [ sre, platformEngineer, cloudDevops ]

let sreAndPlatform = [ sre, platformEngineer ]

let platformAndCloud = [ platformEngineer, cloudDevops ]

let sreAndCloud = [ sre, cloudDevops ]

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

in  Resume::{
    , name = "Cory Twitty"
    , tagline = "Senior Site Reliability Engineer"
    , summary = "Experienced reliability and platform engineer focused on resilient cloud infrastructure, delivery systems, and operational excellence."
    , location = Location::{
      , city = "Denver"
      , stateOrProvince = "CO"
      , country = "US"
      }
    , buzzwords =
      [ Buzzword::{ name = "Rust", rating = 65, roleTags = sreAndPlatform }
      , Buzzword::{ name = "PostgreSQL", rating = 65, roleTags = [ platformEngineer ] }
      , Buzzword::{ name = "Go", rating = 70, roleTags = allRoles }
      , Buzzword::{ name = "Python", rating = 70, roleTags = sreAndCloud }
      , Buzzword::{ name = "Git", rating = 80, roleTags = [] : List Role.Type }
      , Buzzword::{ name = "Dhall", rating = 80, roleTags = [ platformEngineer ] }
      , Buzzword::{ name = "Nix", rating = 80, roleTags = platformAndCloud }
      , Buzzword::{ name = "AWS", rating = 90, roleTags = allRoles }
      , Buzzword::{ name = "GCP", rating = 90, roleTags = [ cloudDevops ] }
      , Buzzword::{ name = "Azure", rating = 90, roleTags = [ cloudDevops ] }
      , Buzzword::{ name = "Kubernetes", rating = 100, roleTags = allRoles }
      , Buzzword::{ name = "CI/CD", rating = 100, roleTags = allRoles }
      , Buzzword::{ name = "Terraform", rating = 100, roleTags = allRoles }
      , Buzzword::{ name = "Prometheus", rating = 100, roleTags = sreAndPlatform }
      , Buzzword::{ name = "Grafana", rating = 100, roleTags = sreAndPlatform }
      , Buzzword::{ name = "DevOps", rating = 100, roleTags = sreAndCloud }
      , Buzzword::{ name = "Agile", rating = 100, roleTags = [] : List Role.Type }
      ]
    , jobs =
      [ withRoleTaggedHighlights
          Job::{
          , company = virgosvs
          , title = "Senior DevOps Engineer"
          , startDate = "2023-01"
          , endDate = Some "Present"
          , leaveReason = Some "Company Closure"
          , locations = [ sd ]
          , roleTags = allRoles
          }
          [ RoleTaggedHighlight::{
            , text = "Engineered an end-to-end configuration generation pipeline integrating Terraform outputs, CUE schema validation, and versioned environment locks in GCS; achieving deterministic builds, automated config validation in CI/CD, and zero-drift environment parity across multiple GKE deployments."
            , roleTags = platformAndCloud
            }
          , RoleTaggedHighlight::{
            , text = "Fully automated the CI/CD pipeline for all 30 service repositories and our Terraform infrastructure, reducing deployment time and minimizing production deployment risks."
            , roleTags = allRoles
            }
          , RoleTaggedHighlight::{
            , text = "Built bespoke certificate management service to create a secured, centralized authority for inter-service and field device certificate management; reducing cost, configuration and deployment complexity. (Python, Golang)"
            , roleTags = sreAndCloud
            }
          , RoleTaggedHighlight::{
            , text = "Updated service code to implement zero-trust security best practices, strengthening authentication and access control, which reduced security vulnerabilities and enhanced compliance readiness. (Python, Golang)"
            , roleTags = sreAndCloud
            }
          , RoleTaggedHighlight::{
            , text = "Deployed production services across multiple global regions, reducing latency and improving application availability for international users while also ensuring compliance with country-specific data residency and regulatory requirements."
            , roleTags = sreAndCloud
            }
          , RoleTaggedHighlight::{
            , text = "Led engineering and platform initiatives for SOC 2 compliance, remediating CVEs across all production workloads and maintaining continuous security posture via automated scanning and alerting."
            , roleTags = sreAndCloud
            }
          , RoleTaggedHighlight::{
            , text = "Rolled out Pub/Sub integration for the endoml.ai service, enabling decoupled service communication and scalable async processing; throughput increased by 35 percent under peak load."
            , roleTags = platformAndCloud
            }
          , RoleTaggedHighlight::{
            , text = "Leveraged Nix to standardize developer environments, cutting onboarding time allowing new engineers to contribute faster and reducing setup inconsistencies."
            , roleTags = platformAndCloud
            }
          ]
      , withRoleTaggedHighlights
          Job::{
          , company = gremlin
          , title = "Senior Platform and Backend Engineer"
          , startDate = "2021-03"
          , endDate = Some "2023-01"
          , leaveReason = Some "Mass Layoffs"
          , locations = [ sf ]
          , roleTags = sreAndPlatform
          }
          [ RoleTaggedHighlight::{
            , text = "Designed and implemented cgroup v2 support for Gremlin machine agents improving resource isolation and ensuring compatibility with modern Linux distributions. (Rust)"
            , roleTags = sreAndPlatform
            }
          , RoleTaggedHighlight::{
            , text = "Reduced AWS DynamoDB write costs by approximately 45 percent by redesigning spike-heavy tables to better accommodate high-throughput workloads."
            , roleTags = platformAndCloud
            }
          , RoleTaggedHighlight::{
            , text = "Hardened IaC practices by migrating from CloudFormation to Terraform with zero downtime, improving deployment maintainability."
            , roleTags = platformAndCloud
            }
          , RoleTaggedHighlight::{
            , text = "Separated staging and production environments into isolated AWS accounts with no downtime, aligning with AWS Well-Architected best practices and enhancing security."
            , roleTags = allRoles
            }
          ]
      , withRoleTaggedHighlights
          Job::{
          , company = onica
          , title = "Senior Cloud Engineer"
          , startDate = "2020-06"
          , endDate = Some "2021-03"
          , leaveReason = Some "Misalignment"
          , locations = [ sa ]
          , roleTags = platformAndCloud
          }
          [ RoleTaggedHighlight::{
            , text = "Guided enterprise Kubernetes rollouts with Istio service mesh integration."
            , roleTags = platformAndCloud
            }
          , RoleTaggedHighlight::{
            , text = "Standardized infrastructure deployment using Troposphere-tested CloudFormation templates, increasing reproducibility and deployment confidence by 70 percent."
            , roleTags = [ cloudDevops ]
            }
          , RoleTaggedHighlight::{
            , text = "Containerized dev environments with Docker, accelerating team onboarding and reducing setup-related support tickets by 60 percent."
            , roleTags = platformAndCloud
            }
          , RoleTaggedHighlight::{
            , text = "Designed a 1000+ node Kubernetes cluster upgrade rollout during a 3 hour downtime window."
            , roleTags = allRoles
            }
          ]
      , withRoleTaggedHighlights
          Job::{
          , company = rival
          , title = "Software Engineer"
          , startDate = "2019-09"
          , endDate = Some "2020-06"
          , leaveReason = Some "Company Closure"
          , locations = [ la ]
          , roleTags = platformAndCloud
          }
          [ RoleTaggedHighlight::{
            , text = "Implemented Datadog-based SLO dashboards and alerting for Kinesis-backed pipelines, reducing incident detection time by 40 percent."
            , roleTags = sreAndPlatform
            }
          , RoleTaggedHighlight::{
            , text = "Advocated for and implemented progressive delivery with feature flags, reducing production rollback frequency by 10 percent."
            , roleTags = [ platformEngineer ]
            }
          , RoleTaggedHighlight::{
            , text = "Optimized Terraform modules and patched upstream provider bugs, improving module reliability and CI pipeline pass rate by 25 percent."
            , roleTags = platformAndCloud
            }
          ]
      , withRoleTaggedHighlights
          Job::{
          , company = swa
          , title = "Software Engineer"
          , startDate = "2018-10"
          , endDate = Some "2019-09"
          , leaveReason = Some "New opportunity"
          , locations = [ dal ]
          , roleTags = allRoles
          }
          [ RoleTaggedHighlight::{
            , text = "Spearheaded EKS adoption across 9 environments, mentoring 10+ dev teams."
            , roleTags = allRoles
            }
          , RoleTaggedHighlight::{
            , text = "Embedded SLO-driven monitoring and postmortem culture across teams, leading to faster incident response."
            , roleTags = [ sre ]
            }
          , RoleTaggedHighlight::{
            , text = "Architected and maintained robust CI/CD pipelines across multiple orgs (Jenkins, GitHub Actions), incorporating automated tests, integration validation, user acceptance via Cypress, and inline security scanning; improved deployment frequency by 3x while maintaining reliability."
            , roleTags = platformAndCloud
            }
          , RoleTaggedHighlight::{
            , text = "Standardized Docker build pipelines using multi-stage builds and image factories; reduced image sizes by 40 percent and improved build caching, cutting CI cycle times by 30 percent."
            , roleTags = platformAndCloud
            }
          ]
      , withRoleTaggedHighlights
          Job::{
          , company = cern
          , title = "Site Reliability Engineer"
          , startDate = "2016-02"
          , endDate = Some "2018-10"
          , leaveReason = Some "New Opportunity"
          , locations = [ kc ]
          , roleTags = sreAndCloud
          }
          [ RoleTaggedHighlight::{
            , text = "Reduced bare-metal provisioning time from weeks to minutes via PXE boot and Ansible automation."
            , roleTags = sreAndPlatform
            }
          , RoleTaggedHighlight::{
            , text = "Deployed HA Vault clusters and automated etcd backups to S3, increasing secrets durability and disaster recovery readiness by 3x."
            , roleTags = sreAndCloud
            }
          , RoleTaggedHighlight::{
            , text = "Transitioned teams from manual deployments to CI/CD pipelines, improving deployment frequency by 4x."
            , roleTags = allRoles
            }
          , RoleTaggedHighlight::{
            , text = "Designed and deployed hybrid Kubernetes federation between on-prem and Azure-based clusters to support regional failover and compliance-driven data locality."
            , roleTags = allRoles
            }
          ]
      ]
    , notableContributions =
      [ Link::{
          , url = "https://github.com/hashicorp/terraform/pull/31318"
          , title = "Github/hashicorp/terraform"
          , description = "Contributed to the Terraform source code"
          }
      , Link::{
        , url = "https://github.com/williamkray/maubot-gifme/pull/13/files"
        , title = "Github/williamkray/maubot-gifme"
        , description = "Contributed to a popular maubot gif plugin for matrix"
        }
      ]
    }
