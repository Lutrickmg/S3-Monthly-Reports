GetItemsOrderTable <- function(orders) {
  items <- c("Masks","Seals","Tubing","Filters","Chinstraps","Water.Chambers")
  items.count <- c(
    sum(orders$Masks),
    sum(orders$Seals),
    sum(orders$Tubing),
    sum(orders$Filters),
    sum(orders$Chinstraps),
    sum(orders$Water.Chambers)
  )
  CountTable <- data.frame(items, items.count)
  names(CountTable) <- c("Inventory Item Type", "Number Of Item Type Ordered")
  return(CountTable)
}
