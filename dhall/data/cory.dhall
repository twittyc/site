let Author = ../types/Author.dhall
let Link = ../types/Link.dhall

in Author::{
    , name = "Cory Twitty"
    , summary = "I am an experienced Cloud and Site Reliability Engineer with a pragmatic, problem-solving mindset and a passion for building reliable, observable, and scalable systems. I’ve led infrastructure modernization efforts, designed ratio-based alerting strategies, and implemented SLO/SLI frameworks that evolve with system scale. My experience spans zero-trust security, developer enablement, and production chaos testing. I thrive in roles that combine hands-on engineering with technical mentorship, often acting as a subject matter expert for Kubernetes, CI/CD, and reliability practices. Whether mentoring teams during migrations, conducting incident reviews, or dogfooding chaos engineering tools in production, I bring clarity, ownership, and a systems-level perspective. Learning is a lifelong pursuit—I stay current with trends in observability, cloud-native infrastructure, and reliability culture to continuously raise the bar for myself and my teams."
    , image = Some "https://avatars.githubusercontent.com/u/17092044?v=4"
    , jobTitle = Some "Senior SRE"
    , website = Some Link::{
        , url = "https://twitty.codes"
        , title = "twitty.codes"
    }
    , email = Some Link::{
      , url = "mailto:cory@twitty.codes"
      , title = "cory@twitty.codes"
      , description = "cory@twitty.codes"
    }
    , github = Some Link::{
      , url = "https://github.com/twittyc"
      , title = "@twittyc"
      , description = "Personal projects"
    }
    , matrix = Some Link::{
        , url = "https://matrix.to/#/@twittyc:matrix.org"
        , title = "Matrix"
    }
    , linkedin = Some Link::{
        , url = "https://www.linkedin.com/in/cory-twitty-58b24969/"
        , title = "Linkedin"
    }
}