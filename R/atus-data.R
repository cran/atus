#' @title ATUS Respondent Information (2003-2016)
#' @name atusresp
#' @description This is a 181,335 by 22 data frame containing information on the respondents, including their employment, household, and the diary day (day on which they were interviewed). The data frame here is taken from the ATUS 2003-2016 Respondent file. Variables containing no more than 90\% values missing were considered for inclusion, especially those found on the ATUS Frequently Used Variables list.
#' @docType data
#' @usage data(atusresp)
#' @format A data frame with 181,335 observations. The following variables (with lower-case original variable name in parentheses, if different from the variable name here, for ease of matching to the official codebook):
#' \describe{
#'  \item{tucaseid}{respondent id}
#'  \item{tuyear}{ATUS year}
#'  \item{diary_mo}{1-12, month of diary day in (derived from 'tudiarydate')}
#'  \item{diary_day}{1-31, day of diary day in (derived from 'tudiarydate')}
#'  \item{holiday}{whether the diary day was a holiday ('trholiday')}
#'  \item{occup_code}{occupation code ('trmjocc1'), see codebook for full unabbreviated list of categories}
#'  \item{ind_code}{industry code ('trmjind1'), see codebook for full unabbreviated list of categories}
#'  \item{labor_status}{labor force status ('telfs')}
#'  \item{student_status}{whether or not the respondent is currently enrolled in a high school, college, or university ('teschenr')}
#'  \item{ptft}{whether the respondent works part-time or full-time ('trdpftpt')}
#'  \item{work_class}{class of work ('teio1cow')}
#'  \item{hourly_wage}{hourly earnings at main job ('trernhly')}
#'  \item{weekly_earn}{weekly earnings at main job ('trernwa')}
#'  \item{work_hrs_week}{number of hours worked per week ('tehruslt')}
#'  \item{mult_jobs}{had more than 1 jobs in 7 days prior to interview ('temjot')}
#'  \item{partner_hh}{presence of respondent's spouse/unmarried partner in the household ('trsppres')}
#'  \item{partner_works}{employment status of spouse/partner ('tespempnot')}
#'  \item{partner_ptft}{whether the spouse/partner works part-time or full-time ('trspftpt')}
#'  \item{hh_size}{number of people living in household ('trnumhou')}
#'  \item{hh_child}{presence of household children aged < 18 ('trhhchild')}
#'  \item{hh_child_youngest_age}{age of youngest household child < 18 ('tryhhchild')}
#'  \item{wt}{ATUS final weight ('tufnwgtp')}
#' }
#' @source ATUS Respondent data file from \url{https://www.bls.gov/tus/datafiles_0316.htm} with code book at \url{https://www.bls.gov/tus/atusintcodebk0316.pdf}. A list of Frequently Used Variables can be found at \url{https://www.bls.gov/tus/freqvariables.pdf}.
#' @keywords datasets
#' @examples
#' data(atusresp)
#'
#' hist(atusresp$weekly_earn, main="Distribution of Weekly Earnings of ATUS Respondents (all years)")
#' boxplot(weekly_earn ~ tuyear, data=atusresp, horizontal=TRUE, las=1,
#'         main="Weekly Earnings by Year", xlab="Year", ylab="Weekly Earnings")
NULL
#' @title ATUS Respondent Daily Activity Summary (2003-2016)
#' @name atusact
#' @description A data frame with 2,094,140 observations on the following variables:
#' @docType data
#' @usage data(atusact)
#' @format A data frame with 2,094,140 observations on the following:
#' \describe{
#'  \item{tucaseid}{respondent id}
#' \item{tiercode}{activity tier code, in the format 'AABBCC', where 'AA' is the tier 1 activity code (1-18), 'BB' is the tier 2 activity code (0-99), and 'CC' is the numeric tier 3 activity code (0-99); see tier codebook}
#' \item{dur}{total duration (in minutes) spent over the course of the day by the respondent in the given tier code}
#' }
#' #' @source Aggregated from ATUS Activity data file from \url{https://www.bls.gov/tus/datafiles_0316.htm} with tier codebook at \url{https://www.bls.gov/tus/lexiconnoex0316.pdf}.
#' @keywords datasets
#' @examples
#' data(atusact)
#' # example activity: sleeping
#' #          tier 1 code = 01 (personal care)
#' #          tier 2 code = 01 (sleeping)
#' #          tier 3 code = all
#'
#' # this is a data frame with all individuals that did some amount of sleeping
#' # on their diary day
#' sleeping <- atusact[atusact$tiercode >= 10100 & atusact$tiercode < 10200,]
#'
#' # how many did not sleep?
#' length(unique(atusact$tucaseid)) - length(unique(sleeping$tucaseid))
#'
#' # example activity: doing homework (for a class towards a degree)
#' #          tier 1 code = 06
#' #          tier 2 code = 03
#' #          tier 3 code = 01
#'
#' hw <- atusact[atusact$tiercode == 60301,]
#' hist(hw$dur)
#' summary(hw$dur)
#'

NULL
#' @title Current Population Survey for ATUS Households (2003-2016)
#' @name atuscps
#' @description This is a 181,335 by 13 data frame containing information collected in the CPS about all individuals who were selected for and responded to the ATUS. The 'tucaseid' variable identifies unique households. Note that the information collected in this dataset was done so 2 to 5 months before the ATUS interview. Variables containing no more than 80\% values missing were considered for inclusion, especially those found on the ATUS Frequently Used Variables list. The original CPS-ATUS file online contains information on all household members selected to participate in the ATUS; for the purpose of minimizing the size of the R package, we removed all non-respondents.
#' @docType data
#' @usage data(atuscps)
#' @format
#' A data frame with 181,335 observations on the following variables:
#' \describe{
#'  \item{tucaseid}{household id}
#'  \item{region}{region of household (definitions are listed in Appendix A of codebook) ('gereg')}
#'  \item{state}{state of household ('gestfips')}
#'  \item{sex}{respondent sex ('pesex')}
#'  \item{age}{respondent age ('prtage'); prior to May 2004, 80 meant age 80+, afterwards, 85 meant age 85+}
#'  \item{edu}{respondent education level, only available for adults ('peeduca')}
#'  \item{race}{respondent race ('ptdtrace')}
#'  \item{hispanic}{respondent identifies as hispanic? ('pehspnon')}
#'  \item{country_born}{respondent's country of birth ('penatvty'), "US" means continental U.S. and "non-US" means otherwise}
#'  \item{citizen}{citizenship status of respondent ('prcitshp')}
#'  \item{marital}{respondent's marital status ('pemaritl')}
#'  \item{home_type}{rent or own home ('hetenure')}
#'  \item{famincome}{income in dollars of all family members aged 15+ in the past 12 months including work earnings, pensions, and dividends ('hefaminc' and 'hufaminc'), see codebook for details about topcoding, which has changed in October 2003}
#' }
#' @source ATUS-CPS data file from \url{https://www.bls.gov/tus/datafiles_0316.htm}  with code book at \url{https://www.bls.gov/tus/atuscpscodebk0316.pdf}. A list of Frequently Used Variables can be found at \url{https://www.bls.gov/tus/freqvariables.pdf}.
#'
#' @keywords datasets
#' @examples
#' data(atuscps)
#'
#' # distribution of households across regions of the U.S.
#' # note that stratified sampling was done
#' barplot(table(atuscps$region))
#'
#' barplot(table(atuscps$race), horiz=TRUE, las=1)
#'
#' hist(atuscps$age)
NULL
