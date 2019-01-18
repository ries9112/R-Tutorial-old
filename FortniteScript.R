library(tidyverse)
library(rvest)
library(stringr)
library(DBI)
library(RMySQL)
library(ggplot2)
library(plotly)


#Collect data (for live data pull)
urlJ <- "https://fortnitetracker.com/profile/psn/super_smil"
urlM <- "https://fortnitetracker.com/profile/psn/super_smik"

urlJ %>%
  read_html() %>%
  html_nodes('.trn-percentilebar__fill') %>%
  html_text() %>%
  str_trim() %>%
  unlist()




urlJ %>%
  read_html() %>%
  html_nodes(xpath="//div[@class='trn-defstat__value'][contains(text(),'Score')]") %>%
  html_text() %>%
  str_trim() %>%
  unlist()



#Alternative Website: https://www.stormshield.one/pvp/stats/super_smik

#Another alternative: https://www.fortnitescout.com/playstation/super_smik


#Michele Data
urlM <- "https://www.fortnitescout.com/playstation/super_smik"

kd_pct <- urlM %>%
  read_html() %>%
  html_nodes('.statLine:nth-child(1) .textWhite') %>%
  html_text() %>%
  str_trim() %>%
  unlist()

win_pct <- urlM %>%
  read_html() %>%
  html_nodes('.statLine:nth-child(2) .textWhite') %>%
  html_text() %>%
  str_trim() %>%
  unlist()


matches <- urlM %>%
  read_html() %>%
  html_nodes('.statSubLine:nth-child(2)') %>%
  html_text() %>%
  str_trim() %>%
  unlist()

winsR <- urlM %>%
  read_html() %>%
  html_nodes('.matchPlacementWinsColor') %>%
  html_text() %>%
  str_trim() %>%
  unlist()
wins <- winsR[1]
solo_wins <- winsR[2]
duo_wins <- winsR[3]
squad_wins <- winsR[4]



top10pctR <- urlM %>%
  read_html() %>%
  html_nodes('.matchPlacementTop10Color') %>%
  html_text() %>%
  str_trim() %>%
  unlist()
top10pct <- top10pctR[1]
solo_top10pct <- top10pctR[2]
duo_top10pct <- top10pctR[3]
squad_top10pct <- top10pctR[4]


top25pctR <- urlM %>%
  read_html() %>%
  html_nodes('.matchPlacementTop25Color') %>%
  html_text() %>%
  str_trim() %>%
  unlist()
top25pct <- top25pctR[1]
solo_top25pct <- top25pctR[2]
duo_top25pct <- top25pctR[3]
squad_top25pct <- top25pctR[4]


Michele <- data.frame(kd_pct,win_pct,matches, wins, solo_wins, duo_wins, squad_wins, top10pct, 
                      solo_top10pct, duo_top10pct, squad_top10pct, top25pct, solo_top25pct,
                   duo_top25pct,squad_top25pct)

#Jacopo Data
urlJ <- "https://www.fortnitescout.com/playstation/super_smil"

kd_pctJ <- urlJ %>%
  read_html() %>%
  html_nodes('.statLine:nth-child(1) .textWhite') %>%
  html_text() %>%
  str_trim() %>%
  unlist()

win_pctJ <- urlJ %>%
  read_html() %>%
  html_nodes('.statLine:nth-child(2) .textWhite') %>%
  html_text() %>%
  str_trim() %>%
  unlist()


matchesJ <- urlJ %>%
  read_html() %>%
  html_nodes('.statSubLine:nth-child(2)') %>%
  html_text() %>%
  str_trim() %>%
  unlist()

winsRJ <- urlJ %>%
  read_html() %>%
  html_nodes('.matchPlacementWinsColor') %>%
  html_text() %>%
  str_trim() %>%
  unlist()
winsJ <- winsRJ[1]
solo_winsJ <- winsRJ[2]
duo_winsJ <- winsRJ[3]
squad_winsJ <- winsRJ[4]



top10pctRJ <- urlJ %>%
  read_html() %>%
  html_nodes('.matchPlacementTop10Color') %>%
  html_text() %>%
  str_trim() %>%
  unlist()
top10pctJ <- top10pctRJ[1]
solo_top10pctJ <- top10pctRJ[2]
duo_top10pctJ <- top10pctRJ[3]
squad_top10pctJ <- top10pctRJ[4]


top25pctRJ <- urlJ %>%
  read_html() %>%
  html_nodes('.matchPlacementTop25Color') %>%
  html_text() %>%
  str_trim() %>%
  unlist()
top25pctJ <- top25pctRJ[1]
solo_top25pctJ <- top25pctRJ[2]
duo_top25pctJ <- top25pctRJ[3]
squad_top25pctJ <- top25pctRJ[4]


Jacopo <- data.frame(kd_pctJ,win_pctJ,matchesJ, winsJ, solo_winsJ, duo_winsJ, squad_winsJ, top10pctJ, 
                     solo_top10pctJ, duo_top10pctJ, squad_top10pctJ, top25pctJ, solo_top25pctJ,
                     duo_top25pctJ,squad_top25pctJ)

#Now Ninja
#Ninja Data
urlN <- "https://www.fortnitescout.com/pc/ninja"

kd_pctN <- urlN %>%
  read_html() %>%
  html_nodes('.statLine:nth-child(1) .textWhite') %>%
  html_text() %>%
  str_trim() %>%
  unlist()

kd_pctN

win_pctN <- urlN %>%
  read_html() %>%
  html_nodes('.statLine:nth-child(2) .textWhite') %>%
  html_text() %>%
  str_trim() %>%
  unlist()


matchesN <- urlN %>%
  read_html() %>%
  html_nodes('.statSubLine:nth-child(2)') %>%
  html_text() %>%
  str_trim() %>%
  unlist()

winsNR <- urlN %>%
  read_html() %>%
  html_nodes('.matchPlacementWinsColor') %>%
  html_text() %>%
  str_trim() %>%
  unlist()
winsN <- winsNR[1]
solo_winsN <- winsNR[2]
duo_winsN <- winsNR[3]
squad_winsN <- winsNR[4]

solo_winsN

top10pctNR <- urlN %>%
  read_html() %>%
  html_nodes('.matchPlacementTop10Color') %>%
  html_text() %>%
  str_trim() %>%
  unlist()
top10pctN <- top10pctNR[1]
solo_top10pctN <- top10pctNR[2]
duo_top10pctN <- top10pctNR[3]
squad_top10pctN <- top10pctNR[4]

top25pctNR <- urlN %>%
  read_html() %>%
  html_nodes('.matchPlacementTop25Color') %>%
  html_text() %>%
  str_trim() %>%
  unlist()
top25pctN <- top25pctNR[1]
solo_top25pctN <- top25pctNR[2]
duo_top25pctN <- top25pctNR[3]
squad_top25pctN <- top25pctNR[4]


Ninja <- data.frame(kd_pctN,win_pctN,matchesN, winsN, solo_winsN, duo_winsN, squad_winsN, top10pctN, 
                    solo_top10pctN, duo_top10pctN, squad_top10pctN, top25pctN, solo_top25pctN,
                    duo_top25pctN,squad_top25pctN)


#######################
#RAINBOW SIX DATA
user <- "superjack128"
rainbow <- tolower(paste("https://r6.tracker.network/profile/psn/",user,"/operators",sep=""))

operators <- rainbow %>%
  read_html() %>%
  html_nodes('.trn-table__row:nth-child(1) span') %>%
  html_text() %>%
  str_trim() %>%
  unlist()

operator_offense_top <- operators[1]
operator_defense_top <- operators[2]
operator_type_top <- operators[3]

#JacopoRainbow <- data.frame(operator_offense_top, operator_defense_top, operator_type_top)


top_operat <- rainbow %>%
  read_html() %>%
  html_nodes('.trn-table__row:nth-child(1) .trn-text--right') %>%
  html_text() %>%
  str_trim() %>%
  unlist()


#JacopoRainbow


getRainbow <- function(dt){
  operators <- rainbow %>%
    read_html() %>%
    html_nodes('.trn-table__row:nth-child(1) span') %>%
    html_text() %>%
    str_trim() %>%
    unlist()
  
  operator_offense_top <- operators[1]
  operator_defense_top <- operators[2]
  operator_type_top <- operators[3]
  
  rainbow <- data.frame(operator_offense_top, operator_defense_top, operator_type_top)
  
  
  rainbow
}
#ADD SKILL BY OPERATION FROM HERE: https://r6.tracker.network/profile/psn/superjack128/seasons

#ADD MORE STATS FROM HERE: https://r6.tracker.network/profile/psn/superjack128



#THIS TRIES TO USE FORTNITE TRACKER API KEY!
# library(httr)
# 
# GET(url="https://api.fortnitetracker.com/v1/profile/account/superjack128/matches", 
#     query = list(api_key = '098b8f7a-005d-4c33-92b5-9fa36156a8f4')
# )




#DEFAUL DELETED OPTIONS
# 
# 
# ## Topic 2
# 
# ### Exercise with Hint
# 
# *Here's an exercise where the chunk is pre-evaulated via the `exercise.eval` option (so the user can see the default output we'd like them to customize). We also add a "hint" to the correct solution via the chunk immediate below labeled `print-limit-hint`.*
#   
#   Modify the following code to limit the number of rows printed to 5:
#   
#   ```{r print-limit, exercise=TRUE, exercise.eval=TRUE}
# mtcars
# ```
# 
# ```{r print-limit-hint}
# head(mtcars)
# ```
# 
# ### Quiz
# 
# *You can include any number of single or multiple choice questions as a quiz. Use the `question` function to define a question and the `quiz` function for grouping multiple questions together.*
#   
#   Some questions to verify that you understand the purposes of various base and recommended R packages:
#   
#   ```{r quiz}
# quiz(
#   question("Which package contains functions for installing other R packages?",
#            answer("base"),
#            answer("tools"),
#            answer("utils", correct = TRUE),
#            answer("codetools")
#   ),
#   question("Which of the R packages listed below are used to create plots?",
#            answer("lattice", correct = TRUE),
#            answer("tools"),
#            answer("stats"),
#            answer("grid", correct = TRUE)
#   )
# )
# ```
# 
# 
# 


#TO ADD CHECKR: https://stackoverflow.com/questions/50782349/how-to-use-the-checkr-package-with-learnr

#COOL IDEA: Any way to add funny feedback? Look at this video (angry teacher): https://www.rstudio.com/resources/videos/adaptive-feedback-for-learnr-tutorials/

















