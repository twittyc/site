let site = ../types/package.dhall

let Site = site.Site

let Link = site.Link

let Job = site.Job

let RoleTaggedHighlight = site.RoleTaggedHighlight

let master = ./masterResume.dhall

let author = ./cory.dhall

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

let listIsEmpty =
    \(a : Type) ->
    \(items : List a) ->
      List/fold
        a
        items
        Bool
        (\(item : a) -> \(acc : Bool) -> False)
        True

let filterList =
    \(a : Type) ->
    \(predicate : a -> Bool) ->
    \(items : List a) ->
      List/fold
        a
        items
        (List a)
        (\(item : a) ->
          \(acc : List a) ->
            if predicate item
            then [ item ] # acc
            else acc)
        ([] : List a)

let highlightsFromRoleTagged =
    \(items : List RoleTaggedHighlight.Type) ->
      mapList
        RoleTaggedHighlight.Type
        Text
        (\(highlight : RoleTaggedHighlight.Type) -> highlight.text)
        items

let visibleJobs =
    mapList
      Job.Type
      Job.Type
      (\(job : Job.Type) ->
        let highlights =
              if listIsEmpty RoleTaggedHighlight.Type job.roleTaggedHighlights
              then job.highlights
              else highlightsFromRoleTagged job.roleTaggedHighlights

        in  job // { highlights = highlights }
      )
      (filterList Job.Type (\(job : Job.Type) -> if job.hideFromResume then False else True) master.jobs)

let optionalTextWithFallback =
    \(fallback : Text) ->
    \(candidate : Optional Text) ->
      merge
        { Some = \(value : Text) -> value
        , None = fallback
        }
        candidate

let optionalLinkToOptionalUrl =
    \(candidate : Optional Link.Type) ->
      merge
        { Some = \(value : Link.Type) -> Some value.url
        , None = None Text
        }
        candidate

let locationText =
    "${master.location.city}, ${master.location.stateOrProvince}"

in  Site::{
    , name = master.name
    , title = master.tagline
    , headshot = optionalTextWithFallback "https://avatars.githubusercontent.com/u/17092044?v=4" author.image
    , summary = master.summary
    , location = master.location
    , jobs = visibleJobs
    , buzzwords = master.buzzwords
    , notableContributions = master.notableContributions
    , contact =
        { email =
            merge
              { Some = \(value : Link.Type) -> value.title
              , None = "cory@twitty.codes"
              }
              author.email
        , location = locationText
        , social =
            { github = optionalLinkToOptionalUrl author.github
            , linkedin = optionalLinkToOptionalUrl author.linkedin
            , twitter = None Text
            }
        }
    }
