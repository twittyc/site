let site = ../types/package.dhall

let Link = site.Link

let Location = site.Location

let Job = site.Job

let Buzzword = site.Buzzword

let RoleTaggedHighlight = site.RoleTaggedHighlight

let Role = site.Role

let Variant = site.Variant

let Prelude = ../Prelude.dhall

let cory = ../data/cory.dhall

let master = ../data/masterResume.dhall

let boolNot = \(value : Bool) -> if value then False else True

let any =
    \(a : Type) ->
    \(predicate : a -> Bool) ->
    \(items : List a) ->
      List/fold
        a
        items
        Bool
        (\(item : a) -> \(acc : Bool) -> predicate item || acc)
        False

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

let sameRole =
    \(left : Role.Type) ->
    \(right : Role.Type) ->
      merge
        { SRE =
            merge
              { SRE = True
              , PlatformEngineer = False
              , CloudDevops = False
              }
              right
        , PlatformEngineer =
            merge
              { SRE = False
              , PlatformEngineer = True
              , CloudDevops = False
              }
              right
        , CloudDevops =
            merge
              { SRE = False
              , PlatformEngineer = False
              , CloudDevops = True
              }
              right
        }
        left

let containsRole =
    \(needle : Role.Type) ->
    \(haystack : List Role.Type) ->
      any
        Role.Type
        (\(candidate : Role.Type) -> sameRole candidate needle)
        haystack

let hasOverlap =
    \(left : List Role.Type) ->
    \(right : List Role.Type) ->
      any Role.Type (\(leftItem : Role.Type) -> containsRole leftItem right) left

let includeForVariant =
    \(variant : Variant.Type) ->
    \(itemRoleTags : List Role.Type) ->
      variant.includeAll
      || listIsEmpty Role.Type itemRoleTags
      || hasOverlap itemRoleTags variant.roleTags

let resolveOptionalText =
    \(fallback : Text) ->
    \(candidate : Optional Text) ->
      merge
        { Some = \(value : Text) -> value
        , None = fallback
        }
        candidate

let effectiveRoleTaggedHighlights =
    \(job : Job.Type) ->
      if listIsEmpty RoleTaggedHighlight.Type job.roleTaggedHighlights
      then mapList
        Text
        RoleTaggedHighlight.Type
        (\(highlightText : Text) -> RoleTaggedHighlight::{ text = highlightText })
        job.highlights
      else job.roleTaggedHighlights

let roleTaggedHighlightTexts =
    \(items : List RoleTaggedHighlight.Type) ->
      mapList
        RoleTaggedHighlight.Type
        Text
        (\(highlight : RoleTaggedHighlight.Type) -> highlight.text)
        items

let selectedBuzzwords =
    \(variant : Variant.Type) ->
      filterList
        Buzzword.Type
        (\(buzzword : Buzzword.Type) ->
          includeForVariant variant buzzword.roleTags)
        master.buzzwords

let selectedHighlights =
    \(variant : Variant.Type) ->
    \(highlights : List RoleTaggedHighlight.Type) ->
      filterList
        RoleTaggedHighlight.Type
        (\(highlight : RoleTaggedHighlight.Type) ->
          includeForVariant variant highlight.roleTags)
        highlights

let selectedJobs =
    \(variant : Variant.Type) ->
      let visibleJobs =
            filterList
              Job.Type
              (\(job : Job.Type) ->
                includeForVariant variant job.roleTags
                && boolNot job.hideFromResume)
              master.jobs

      in  mapList
            Job.Type
            Job.Type
            (\(job : Job.Type) ->
              let filteredHighlights =
                    selectedHighlights variant (effectiveRoleTaggedHighlights job)

              in  job
                    // { roleTaggedHighlights = filteredHighlights
                       , highlights = roleTaggedHighlightTexts filteredHighlights
                       }
            )
            visibleJobs

let escapeLatex =
    \(text : Text) ->
      let replace = Prelude.Text.replace

      in  replace "#" "\\#"
            (replace "_" "\\_"
            (replace "&" "\\&"
            (replace "%" "\\%"
            (replace "$" "\\$"
            (replace "{" "\\{"
            (replace "}" "\\}"
            text))))))

let renderBuzzwords =
    \(skills : List Buzzword.Type) ->
      let doer =
            \(skill : Buzzword.Type) ->
              "\\baritem{${escapeLatex skill.name}}{${Natural/show skill.rating}}"

      in  Prelude.Text.concatMapSep "\n" Buzzword.Type doer skills

let renderJobHistory =
    \(jobs : List Job.Type) ->
      let showDate =
            \(job : Job.Type) ->
              let endDate =
                    merge
                      { Some = \(value : Text) -> value, None = "current" }
                      job.endDate

              in  "${job.startDate} - ${endDate}"

      let showLoc =
            \(location : Location.Type) ->
              "${location.city}, ${location.stateOrProvince} ${location.country}"

      let workedLocs =
            \(job : Job.Type) ->
              if listIsEmpty Location.Type job.locations
              then ""
              else ''
                   (${Prelude.Text.concatMapSep ", " Location.Type showLoc job.locations})
                   ''

      let summary =
            \(job : Job.Type) ->
              "\\par ${escapeLatex job.summary}"

      let highlights =
            \(job : Job.Type) ->
              let doer =
                    \(highlight : RoleTaggedHighlight.Type) ->
                      "\\item ${escapeLatex highlight.text}"

              in  Prelude.Text.concatMapSep
                    "\n"
                    RoleTaggedHighlight.Type
                    doer
                    job.roleTaggedHighlights

      let renderedHighlights =
            \(job : Job.Type) ->
              if listIsEmpty RoleTaggedHighlight.Type job.roleTaggedHighlights
              then ""
              else ''
                   \begin{itemize}
                   ${highlights job}
                   \end{itemize}
                   ''

      let doer =
            \(job : Job.Type) ->
              ''
              \entry{${showDate job}}{${job.company.name}${workedLocs job}}{${job.title}}{
              ${summary job}
              ${renderedHighlights job}
              }
              ''

      in  Prelude.Text.concatMapSep "\n" Job.Type doer jobs

let renderContributions =
    let doer =
          \(link : Link.Type) ->
            ''
            \entry{}{${escapeLatex link.title}}{}{\begin{itemize}
                \item ${escapeLatex link.description}
                \item[] \textcolor{blue}{\faIcon{external-link-alt} \url{${link.url}}}
            \end{itemize}}
            ''

    in  Prelude.Text.concatMapSep
          "\n"
          Link.Type
          doer
          master.notableContributions

let processedData =
    { jobtitle =
        Prelude.Optional.default Text "job title" cory.jobTitle
    , website =
        merge
          { Some = \(link : Link.Type) -> link
          , None = Link.default
          }
          cory.website
    , email =
        merge
          { Some = \(link : Link.Type) -> link
          , None = Link.default
          }
          cory.email
    , github =
        merge
          { Some = \(link : Link.Type) -> link
          , None = Link.default
          }
          cory.github
    , matrix =
        merge
          { Some =
              \(link : Link.Type) ->
                link // { url = escapeLatex link.url }
          , None = Link.default
          }
          cory.matrix
    , linkedin =
        merge
          { Some = \(link : Link.Type) -> link
          , None = Link.default
          }
          cory.linkedin
    }

in  \(variant : Variant.Type) ->
      let resumeTagline = resolveOptionalText master.tagline variant.tagline

      let resumeSummary = resolveOptionalText master.summary variant.summary

      let buzzwords = renderBuzzwords (selectedBuzzwords variant)

      let jobHistory = renderJobHistory (selectedJobs variant)

      let contributions = renderContributions

      in  ''
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
          % Developer CV
          % LaTeX Template
          % Version 1.1 (February 24, 2025)
          %
          % This template originates from:
          % https://www.LaTeXTemplates.com
          %
          % Authors:
          % Jan Vorisek (jan@vorisek.me)
          % Based on a template by Jan Kuster (info@jankuester.com)
          % Modified for LaTeX Templates by Vel (vel@LaTeXTemplates.com)
          %
          % License:
          % The MIT License (see included LICENSE file)
          %
          %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

          \documentclass[9pt]{developercv}

          \begin{document}

          \begin{minipage}[t]{0.45\textwidth}
              \vspace{-\baselineskip}

              \colorbox{black}{{\HUGE\textcolor{white}{\textbf{\MakeUppercase{${master.name}}}}}}

              \vspace{6pt}

              {\huge ${resumeTagline}}
          \end{minipage}
          \hfill
          \begin{minipage}[t]{0.27\textwidth}
              \vspace{-\baselineskip}

              \icon{MapMarker}{12}{${master.location.city}, ${master.location.stateOrProvince}}\\
              \icon{At}{12}{\href{${processedData.email.url}}{${processedData.email.title}}}\\
              \icon{Comment}{12}{\href{${processedData.matrix.url}}{${processedData.matrix.title}}}\\
          \end{minipage}
          \hfill
          \begin{minipage}[t]{0.27\textwidth}
              \vspace{-\baselineskip}

              \icon{Globe}{12}{\href{${processedData.website.url}}{${processedData.website.title}}}\\
              \icon{Github}{12}{\href{${processedData.github.url}}{${processedData.github.title}}}\\
              \icon{Linkedin}{12}{\href{${processedData.linkedin.url}}{${processedData.linkedin.title}}}\\
          \end{minipage}

          \vspace{0.5cm}

          \cvsect{Who Am I?}

          \begin{minipage}[t]{0.4\textwidth}
              \vspace{-\baselineskip}

              ${resumeSummary}
          \end{minipage}
          \hfill
          \begin{minipage}[t]{0.5\textwidth}
              \vspace{-\baselineskip}

              \begin{barchart}{5.5}
                  ${buzzwords}
              \end{barchart}
          \end{minipage}

          \begin{entrylist}
              \cvsect{Experience}
              ${jobHistory}
          \end{entrylist}

          \cvsect{Notable Contributions}

          \begin{entrylist}
              ${contributions}
          \end{entrylist}

          \end{document}
          ''
