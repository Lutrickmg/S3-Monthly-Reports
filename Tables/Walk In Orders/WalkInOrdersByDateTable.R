WalkInOrdersByDateTable <- function(walk.in.orders) {
  dates <- unique(as.Date(walk.in.orders$Date))
  dates.count <- c()
  for(date in dates) {
    dates.count <- c(dates.count, nrow(walk.in.orders[as.Date(walk.in.orders[,'Date']) == date,]))
  }
  CountTable <- data.frame(dates, dates.count)
}
