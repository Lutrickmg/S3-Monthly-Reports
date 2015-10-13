GetOrderSleepCoachTable <- function(orders) {
  coaches <- levels(unique(orders$Sleep.Coach))
  coaches.count <- c()
  for(coach in coaches) {
    coaches.count <- c(coaches.count, nrow(orders[orders$Sleep.Coach == coach,]))
  }
  CountTable <- data.frame(coaches, coaches.count)
  names(CountTable) <- c("Sleep Coach", "Orders Created")
  return(CountTable)
}
