library(RSelenium)
library(here)

# IN suggestion they use paste0
url = "https://baseballsavant.mlb.com/leaderboard/custom?year=2026&type=batter&filter=&min=q&selections=xslg%2Cxwoba%2Cxobp%2Cavg_swing_speed%2Cavg_swing_length&chart=false&x=xslg&y=xslg&r=no&chartType=beeswarm&sort=1&sortDir=desc"

button_id <- "#btnCSV"

filename = "project.csv"
download_location = "C:/Users/hanke/Downloads/test.csv"

# Keep getting to here and getting an error
driver <- rsDriver(
  browser = "chrome",
  chromever = "113.0.5672.63",
  phantomver = NULL
)
server <- driver$server
browser <- driver$client

buttons <- list()
browser$navigate(url)
while (length(buttons) == 0) {
  buttons <- browser$findElements(button_id, using = "id")
}
buttons[[1]]$clickElement()

while (!file.exists(file.path(download_location, filename))) {
  Sys.sleep(0.1)
}
file.rename(file.path(download_location, filename), here(filename))

browser$close()
server$stop()