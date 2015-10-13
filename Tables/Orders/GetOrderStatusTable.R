GetOrderStatusTable <- function(orders) {
  statuses <- unique(orders$Status)
  statuses.count <- c()
  for(status in levels(statuses)) {
    statuses.count <- c(statuses.count, nrow(orders[orders$Status == status,]))
  }
  CountTable <- data.frame(levels(statuses), statuses.count)
  names(CountTable) <- c("Order Status", "Orders Count")
  return(CountTable)
}
