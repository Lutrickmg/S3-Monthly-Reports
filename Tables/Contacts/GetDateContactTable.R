GetDateContactTable <- function(contacts) {
  dates <- unique(contacts$Contacted.At)
  dates.count <- c()
  for(date in dates) {
    dates.count <- c(dates.count, nrow(contacts[contacts[,'Contacted.At'] == date,]))
  }
  CountTable <- data.frame(dates, dates.count)
}
