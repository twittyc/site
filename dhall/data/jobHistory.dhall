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
    , endDate = Some "2024-01"
    , leaveReason = Some "Company Closure"
    , locations = [ sd ]
    , highlights = 
        [ "Fully automated the CI/CD pipeline for all 15 service repositories and our Terraform infrastructure, reducing deployment time and minimizing production deployment risks."
        , "Built bespoke certificate management service to create a secured, centralized authority for inter-service and field device certificate management; reducing cost, configuration and deployment complexity. (Python, Golang)"
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
        , "Redesigned a high-throughput and spikey DynamoDB table, reducing write costs by 30-45 percent for some customers, improving performance and lowering operational expenses."
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
    , summary = "At Onica, I developed custom Python plugins to streamline Istio service mesh deployment, simplifying service integration and reducing manual effort. I designed and tested CloudFormation templates using Troposphere, ensuring scalable and consistent infrastructure provisioning. Additionally, I contributed to the Troposphere OSS project, improving automation reliability, and containerized development environments with Docker to enhance reproducibility and accelerate developer onboarding."
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
    , summary = "At Southwest Airlines, I managed and deployed EKS clusters across nine environments, serving as the Kubernetes subject matter expert and educating teams on best practices. I redesigned the logging architecture to dynamically scale with demand, handling peak bursts of 13GB/s of logs. I implemented Prometheus monitoring and alerting, enabling teams to self-service observability, and exposed custom Prometheus metrics to Kubernetes for HPA-based autoscaling. Additionally, I developed an automated recovery pipeline using AWS Lambda, reducing downtime by triggering corrective actions before escalation. To enhance reliability, I introduced post-mortems and SLO-based monitoring, fostering a proactive approach to incident management and service quality."
  }
  , Job::{
    , company = cern
    , title = "Site Reliability Engineer"
    , contract = False
    , startDate = "2016-02"
    , endDate = Some "2018-10"
    , leaveReason = Some "New Opportunity"
    , locations = [ kc ]
    , summary = "At Cerner, I designed and deployed a globally available Artifactory repository across hybrid AWS and on-prem environments, leveraging Ansible automation for consistent builds and deployments. I implemented auto-scaling groups in AWS, integrating with CloudWatch monitoring to dynamically scale EC2 instances based on demand. To enhance security and reliability, I deployed high-availability HashiCorp Vault instances with a Consul backend on Kubernetes and automated etcd backups to S3. Additionally, I introduced CI/CD best practices, authored Kubernetes and containerization documentation, and conducted training sessions on Ansible automation and Git flow. I also streamlined bare metal server provisioning, reducing deployment time from three weeks to just 30 minutes through automation."
  }
]