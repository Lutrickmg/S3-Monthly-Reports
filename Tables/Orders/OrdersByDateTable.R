OrdersByDateTable <- function(orders) {
  dates <- unique(as.Date(orders$Order.Date))
  dates.count <- c()
  for(date in dates) {
    dates.count <- c(dates.count, nrow(orders[as.Date(orders[,'Order.Date']) == date,]))
  }
  CountTable <- data.frame(dates, dates.count)
}
