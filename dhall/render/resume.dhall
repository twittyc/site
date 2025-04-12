let site = ../types/package.dhall

let Link = site.Link

let Location = site.Location

let Job = site.Job

let Prelude = ../Prelude.dhall

let cory = ../data/cory.dhall

let resume = ../data/resume.dhall

let Buzzword = ../types/Buzzword.dhall

let escapeLatex =
    \(text: Text) ->
        let replace = Prelude.Text.replace

        -- Escape special LaTeX characters
        in replace "#" "\\#"
            (replace "_" "\\_"
            (replace "&" "\\&"
            (replace "%" "\\%"
            (replace "$" "\\$"
            (replace "{" "\\{"
            (replace "}" "\\}"
            text))))))

let buzzwords =
    let doer =
        \(skill : Buzzword.Type) ->
            "\\baritem{${skill.name}}{${Natural/show skill.rating}}"

    in  Prelude.Text.concatMapSep "\n" Buzzword.Type doer resume.buzzwords

let jobHistory =
    let showDate =
        \(job : Job.Type) ->
            let endDate =
                merge
                    { Some = \(t : Text) -> t, None = "current" }
                    job.endDate

            in  "${job.startDate} - ${endDate}"

    let showLoc =
        \(l : Location.Type) ->
            "${l.city}, ${l.stateOrProvince} ${l.country}"

    let workedLocs =
        \(j : Job.Type) ->
            let doer = \(l : Location.Type) -> "\\item ${showLoc l}"

            in  Prelude.Text.concatMapSep "\n" Location.Type doer j.locations

    let summary = 
        \(job : Job.Type) -> 
            "\\par ${escapeLatex job.summary}"

    let highlights =
        \(j : Job.Type) ->
            let doer = \(t : Text) -> "\\item ${t}"

            in  Prelude.Text.concatMapSep "\n" Text doer j.highlights

    let renderedHighlights =
          \(job : Job.Type) ->
            let body = highlights job
            in ''
               \begin{itemize}
               ${body}
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

    in  Prelude.Text.concatMapSep "\n" Job.Type doer resume.jobs

let contributions =
    let doer =
        \(link : Link.Type) ->
            ''
            \entry{}{${link.title}}{}{\begin{itemize}
                \item \href{${link.url}}{${link.description}}
            \end{itemize}}
            ''

    in  Prelude.Text.concatMapSep
        "\n"
        Link.Type
        doer
        resume.notableContributions

-- Unwrap the option values
let processedData =
    { jobtitle =
        Prelude.Optional.default Text "job title" cory.jobTitle
    , website = merge
                    { Some = \(link : Link.Type) -> link 
                    , None = Link.default
                    }
                    cory.website
    , email = merge
                { Some = \(link : Link.Type) -> link
                , None = Link.default
                }
                cory.email
    , github = merge
                { Some = \(link : Link.Type) -> link
                , None = Link.default
                }
                cory.github
    , matrix = 
            merge
                { Some = \(link : Link.Type) -> 
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
    % Based on a template by Jan Küster (info@jankuester.com)
    % Modified for LaTeX Templates by Vel (vel@LaTeXTemplates.com)
    %
    % License:
    % The MIT License (see included LICENSE file)
    %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    %----------------------------------------------------------------------------------------
    %	PACKAGES AND OTHER DOCUMENT CONFIGURATIONS
    %----------------------------------------------------------------------------------------

    \documentclass[9pt]{developercv}

    %----------------------------------------------------------------------------------------

    \begin{document}

    %----------------------------------------------------------------------------------------
    %	TITLE AND CONTACT INFORMATION
    %----------------------------------------------------------------------------------------

    \begin{minipage}[t]{0.45\textwidth}
    	\vspace{-\baselineskip}
    	
    	\colorbox{black}{{\HUGE\textcolor{white}{\textbf{\MakeUppercase{${resume.name}}}}}} 
    	
    	\vspace{6pt}
    	
    	{\huge ${resume.tagline}}
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.27\textwidth}
    	\vspace{-\baselineskip}
    	
        \icon{MapMarker}{12}{${resume.location.city}, ${resume.location.stateOrProvince}}\\
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

    %----------------------------------------------------------------------------------------
    %	INTRODUCTION, SKILLS AND TECHNOLOGIES
    %----------------------------------------------------------------------------------------

    \cvsect{Who Am I?}

    \begin{minipage}[t]{0.4\textwidth}
    	\vspace{-\baselineskip}
    	
    	${cory.summary}
    \end{minipage}
    \hfill
    \begin{minipage}[t]{0.5\textwidth}
    	\vspace{-\baselineskip}
    	
    	\begin{barchart}{5.5}
    		${buzzwords}
    	\end{barchart}
    \end{minipage}

    %----------------------------------------------------------------------------------------
    %	EXPERIENCE
    %----------------------------------------------------------------------------------------

    \cvsect{Experience}

    \begin{entrylist}
    	${jobHistory}
    \end{entrylist}

    %----------------------------------------------------------------------------------------
    %	NOTABLE CONTRIBUTIONS
    %----------------------------------------------------------------------------------------

    \cvsect{Notable Contributions}

    \begin{entrylist}
    	${contributions}
    \end{entrylist}

    %----------------------------------------------------------------------------------------

    \end{document}


    ''
