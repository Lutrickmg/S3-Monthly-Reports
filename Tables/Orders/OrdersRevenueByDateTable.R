OrdersRevenueByDateTable <- function(orders) {
  dates <- unique(as.Date(orders$Order.Date))
  revenue <- c()
  for(date in dates) {
    revenue <- c(revenue, sum(orders[as.Date(orders[,'Order.Date']) == date,'Potential.Revenue'])/100)
  }
  CountTable <- data.frame(dates, revenue)
  return(CountTable)
}
