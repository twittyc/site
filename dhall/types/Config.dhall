
let Author = ./Author.dhall

let Company = ./Company.dhall

let Job = ./Job.dhall

let Link = ./Link.dhall

let Location = ./Location.dhall

let Resume = ./Resume.dhall

let Buzzword = ./Buzzword.dhall

in { Type = 
        {  jobHistory : List Job.Type
        ,  notableContributions : List Link.Type
        ,  contactLinks : List Link.Type
        ,  resume : Resume.Type
        }
    , default =
        {  jobHistory = [] : List Job.Type
        ,  notableContributions = [] : List Link.Type
        ,  contactLinks = [] : List Link.Type
        ,  resume = Resume::{=}
        }
}