let site = ../types/package.dhall

let Resume = site.Resume

let Link = site.Link

let Buzzword = site.Buzzword

let jobHistory = ./jobHistory.dhall

let Location = ../types/Location.dhall

in Resume::{
  , name = "Cory Twitty"
  , tagline = "Senior Site Reliability Engineer"
  , location = Location::{
    , city = "Denver"
    , stateOrProvince = "CO"
    , country = "US"
  }
  , buzzwords = [
        , Buzzword::{ name = "Rust", rating = 65 }
        , Buzzword::{ name = "PostgreSQL", rating = 65 }
        , Buzzword::{ name = "TypeScript", rating = 70 }
        , Buzzword::{ name = "Go", rating = 70 }
        , Buzzword::{ name = "Python", rating = 70 }
        , Buzzword::{ name = "Git", rating = 80 }
        , Buzzword::{ name = "Dhall", rating = 80 }
        , Buzzword::{ name = "Nix", rating = 80 }
        , Buzzword::{ name = "Cloud", rating = 90 }
        , Buzzword::{ name = "Kubernetes", rating = 90 }
        , Buzzword::{ name = "CI/CD", rating = 100 }
        , Buzzword::{ name = "Terraform", rating = 100 }
        , Buzzword::{ name = "Prometheus", rating = 100 }
        , Buzzword::{ name = "Grafana", rating = 100 }
        , Buzzword::{ name = "DevOps", rating = 100 }
        , Buzzword::{ name = "Continuous Integration", rating = 100 }
        , Buzzword::{ name = "Continuous Delivery", rating = 100 }
  ]
  , jobs = jobHistory
  , notableContributions = [
      Link:: {
          , url = "https://github.com/hashicorp/terraform/pull/31318"
          , title = "Github/hashicorp/terraform"
          , description = "Contributed to the Terraform source code"
      }
      , Link:: {
        , url = "https://github.com/williamkray/maubot-gifme/pull/13/files"
        , title = "Github/williamkray/maubot-gifme"
        , description = "Contributed to a popular maubot gif plugin for matrix"
      }
  ]
}