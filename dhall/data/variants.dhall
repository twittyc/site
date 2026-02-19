let site = ../types/package.dhall

let Variant = site.Variant

let Role = site.Role

let sre = Role.Type.SRE

let platformEngineer = Role.Type.PlatformEngineer

let cloudDevops = Role.Type.CloudDevops

in  { master = Variant::{
      , key = "master"
      , title = "Master Resume"
      , tagline = Some "Senior Site Reliability Engineer"
      , includeAll = True
      }
    , sre = Variant::{
      , key = "sre"
      , title = "SRE Resume"
      , tagline = Some "Site Reliability Engineer"
      , roleTags = [ sre ]
      , includeAll = False
      }
    , platformEngineer = Variant::{
      , key = "platform-engineer"
      , title = "Platform Engineer Resume"
      , tagline = Some "Platform Engineer"
      , roleTags = [ platformEngineer ]
      , includeAll = False
      }
    , cloudDevops = Variant::{
      , key = "cloud-devops"
      , title = "Cloud Engineer / DevOps Resume"
      , tagline = Some "Cloud Engineer / DevOps"
      , roleTags = [ cloudDevops ]
      , includeAll = False
      }
    }
