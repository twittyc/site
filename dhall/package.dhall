let site = ./types/package.dhall

let Config = site.Config

let Link = site.Link

in  Config::{
    , jobHistory = ./jobHistory.dhall
    , notableContributions =
      [ Link:: {
          , url = "https://github.com/hashicorp/terraform/pull/31318"
          , title = "Terraform Source Contributor"
          , description = "Contributed to the Terraform source code"
        }
      ]
    , contactLinks =
      [ Link::{ url = "https://github.com/twittyc", title = "GitHub" }
      , Link::{
        , url = "https://www.linkedin.com/in/cory-twitty-58b24969/"
        , title = "LinkedIn"
        }
      , Link::{
        , url = "https://matrix.to/#/@twittyc:matrix.org"
        , title = "Matrix"
        }
      ]
    , resume = ./resume.dhall
    }