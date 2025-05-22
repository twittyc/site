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
    , startDate = "2024-01"
    , endDate = Some "Present"
    , leaveReason = Some "Company Closure"
    , locations = [ sd ]
    , highlights = 
        [ "Designed and implemented a ratio-based alerting system integrated with Prometheus and Grafana, enabling adaptive SLO-based monitoring that scaled with system growth and reduced false positives."
        , "Led zero-trust architecture rollout across global deployments, including automation of ephemeral certificate rotation and inter-service authentication."
        , "Established a standardized monitoring and observability framework adopted across 15+ services, ensuring consistent telemetry and enabling faster MTTR."
        , "Championed reproducible dev environments using Nix, significantly reducing onboarding friction and config drift."
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
        [  "Led internal chaos engineering initiatives by dogfooding our own product, conducting regular game days against production to uncover reliability gaps and validate failure handling."
        , "Designed and implemented cgroup v2 support for Gremlin machine agents, improving resource isolation and ensuring compatibility with modern Linux distributions. (Rust)"
        , "Developed and implemented internal SLOs and SLIs to measure system reliability, enabling data-driven incident response and service improvement tracking."
        , "Redesigned a high-throughput and spikey DynamoDB table, reducing write costs by 30–45% for some customers, improving performance and lowering operational expenses."
        , "Separated staging and production environments into isolated AWS accounts with no downtime, aligning with AWS Well-Architected best practices and enhancing security."
        , "Migrated CloudFormation stacks into Terraform without redeploying resources, simplifying infrastructure as code and improving maintainability."
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
    , summary = "At Onica, I served as a trusted advisor and mentor to client engineering teams, guiding them through complex challenges in Istio integration, observability strategy, and large-scale Kubernetes cluster management. I developed custom Python plugins to streamline Istio service mesh deployment, simplifying service integration and reducing manual effort. I designed and tested CloudFormation templates using Troposphere, ensuring scalable and consistent infrastructure provisioning. I also contributed to the Troposphere OSS project, improving automation reliability, and containerized development environments with Docker to enhance reproducibility and accelerate developer onboarding."
  }
  , Job::{
    , company = rival
    , title = "Software Engineer"
    , contract = False
    , startDate = "2019-09"
    , endDate = Some "2020-06"
    , leaveReason = Some "Company Closure"
    , locations = [ la ]
    , summary = "At Rival Labs, I collaborated with application owners to define Service Level Objectives (SLOs) and Service Level Indicators (SLIs), improving visibility into service reliability. I developed SLO dashboards to track uptime and performance, integrated Datadog event logging, and implemented proactive monitoring and alerting to enhance system observability. I also advocated for continuous delivery and feature flag adoption, enabling safer and faster deployments. Additionally, I contributed to Terraform infrastructure, patching upstream provider bugs, improving internal modules, and automating cloud deployments."
  }
  , Job::{
    , company = swa
    , title = "Software Engineer"
    , contract = False
    , startDate = "2018-10"
    , endDate = Some "2019-09"
    , leaveReason = Some "New opportunity"
    , locations = [ dal ]
    , summary = "At Southwest Airlines, I acted as Kubernetes SME during a major infrastructure modernization effort; mentored dev teams on containerzation best practices and led knowledge sharing during EKS rollout across 9 environments. In addition, I introduced SLO-based monitoring and instituted a postmortem culture, enhancing incident learnign and service accountability."
  }
  , Job::{
    , company = cern
    , title = "Site Reliability Engineer"
    , contract = False
    , startDate = "2016-02"
    , endDate = Some "2018-10"
    , leaveReason = Some "New Opportunity"
    , locations = [ kc ]
    , summary = "At Cerner, I led the charge toward modern cloud deployment practices, introducing Kubernetes to the organization and authoring internal documentation to support its adoption. I drove CI/CD best practices, helping teams transition from manual deployments to automated pipelines, and conducted training sessions on Git workflows and infrastructure automation with Ansible. I deployed high-availability HashiCorp Vault clusters on Kubernetes backed by Consul, automated etcd backups to S3, and implemented autoscaling groups with CloudWatch triggers to dynamically scale infrastructure. My efforts in streamlining bare metal server provisioning reduced deployment times from weeks to minutes, dramatically increasing operational efficiency."
  }
]