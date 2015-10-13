OrdersByStatus <- function(orders) {
  statuses <- unique(orders$Status)
  statuses.count <- c()
  statuses.revenue <- c()
  for(status in levels(statuses)) {
    statuses.count <- c(statuses.count, nrow(orders[orders$Status == status,]))
    statuses.revenue <- c(statuses.revenue, paste ('$', specify_decimal(sum(orders[orders$Status == status, 'Potential.Revenue'])/100, 2), sep=""))
  }
  CountTable <- data.frame(levels(statuses), statuses.count, statuses.revenue)
  names(CountTable) <- c("Order Status", "Orders Count", "Orders Revenue")
  return(CountTable)
}

specify_decimal <- function(x, k) format(round(x, k), nsmall=k)
