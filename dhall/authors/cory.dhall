let Author = ../types/Author.dhall
let Link = ../types/Link.dhall

in Author::{
    , name = "Cory Twitty"
    , summary = "I am an experienced Cloud Engineer, Architect, and Systems Engineer with a pragmatic, problem-solving mindset and a strong belief in using the right tool for the job—whether in software, infrastructure, or process design. I have strong opinions but hold them weakly, always open to new ideas and better ways of doing things. I believe that most problems stem from miscommunication rather than pure engineering challenges, and I prioritize clarity and collaboration to prevent that. My experience spans cloud architecture, infrastructure automation, and low-level systems engineering. I enjoy building reliable, scalable systems and refining workflows to enhance efficiency. Learning is a lifelong pursuit of mine—I thrive on exploring new technologies, understanding how things work under the hood, and continuously improving both my craft and the environments I work in."
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