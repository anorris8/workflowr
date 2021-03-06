% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/wflow_publish.R
\name{wflow_publish}
\alias{wflow_publish}
\title{Publish the site}
\usage{
wflow_publish(files = NULL, message = NULL, all = FALSE, force = FALSE,
  update = FALSE, republish = FALSE, view = FALSE, seed = 12345,
  dry_run = FALSE, project = ".")
}
\arguments{
\item{files}{character (default: NULL). Files to be added and committed with
Git (step 1). Any R Markdown files will also be built (step 2) and their
output HTML and figures will be subsequently committed (step 3). Supports
file \href{https://en.wikipedia.org/wiki/Glob_(programming)}{globbing}.}

\item{message}{character (default: NULL). A commit message.}

\item{all}{logical (default: FALSE). Automatically stage files that have been
modified and deleted. Equivalent to: \code{git commit -a}}

\item{force}{logical (default: FALSE). Allow adding otherwise ignored files.
Equivalent to: \code{git add -f}}

\item{update}{logical (default: FALSE). Build any files that have been
committed more recently than their corresponding HTML files (and do not
have any unstaged or staged changes). This ensures that the commit version
ID inserted into the HTML corresponds to the exact version of the source
file that was used to produce it.}

\item{republish}{logical (default: FALSE). Build all published R Markdown
files. Useful for site-wide changes like updating the theme, navigation
bar, or any other setting in \code{_site.yml}.}

\item{view}{logical (default: FALSE). View the website with
\code{\link{wflow_view}} after publishing files. See
\code{\link{wflow_build}} for more details.}

\item{seed}{numeric (default: 12345). The seed to set before building each
file. Passed to \code{\link{set.seed}}.}

\item{dry_run}{logical (default: FALSE). Preview the proposed action but do
not actually add or commit any files.}

\item{project}{character (default: ".") By default the function assumes the
current working directory is within the project. If this is not true,
you'll need to provide the path to the project directory.}
}
\value{
Returns an object of class \code{wflow_publish}, which is a list with
  the following elements:

  \itemize{

  \item \bold{step1}: An object of class \code{wflow_commit} from the first
  step of committing the analysis files.

  \item \bold{step2}: An object of class \code{wflow_build} from the second
  step of building the HTML files.

  \item \bold{step3}: An object of class \code{wflow_commit} from the third
  step of committing the HTML files.

  }
}
\description{
\code{wflow_publish} is the main workflowr function. Use it when you are
ready to publish an analysis to your site. \code{wflow_publish} performs
three steps: 1) commit the file(s), 2) rebuild the R Markdown file(s), 3)
commit the generated website file(s). These steps ensure that the version of
the HTML file is created by the latest version of the R Markdown file, which
is critical for reproducibility.
}
\examples{
\dontrun{
# single file
wflow_publish("analysis/file.Rmd", "Informative commit message")
# All tracked files that have been edited
wflow_publish(all = TRUE, message = "Informative commit message")
# A new file plus all tracked files that have been edited
wflow_publish("analysis/file.Rmd", "Informative commit message", all = TRUE)
# Multiple files
wflow_publish(c("analysis/file.Rmd", "analysis/another.Rmd"),
              "Informative commit message")
# All R Markdown files that start with the pattern "new_"
wflow_publish("analysis/new_*Rmd", "Informative commit message")
# Republish all published files regardless of whether they have been
# modified. Useful for changing some universal aspect of the site,
# e.g. the theme specifid in _site.yml.
wflow_publish("analysis/_site.yml", "Informative commit message",
              republish = TRUE)

}

}
\seealso{
\code{\link{wflow_commit}}, \code{\link{wflow_build}}
}
