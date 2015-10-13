GetRevenueOrderTable <- function(orders) {
  revenue.brackets <- c("0-99", "100-149", "150-199", "200-249", "250-299", "300-349", "350-399", "400+")
  orders$Potential.Revenue <- orders$Potential.Revenue / 100
  bracket.count <- c(
      nrow(orders[orders$Potential.Revenue < 100,]),
      nrow(orders[orders$Potential.Revenue >= 100 && orders$Potential.Revenue < 150 ,]),
      nrow(orders[orders$Potential.Revenue >= 150 && orders$Potential.Revenue < 200 ,]),
      nrow(orders[orders$Potential.Revenue >= 200 && orders$Potential.Revenue < 250 ,]),
      nrow(orders[orders$Potential.Revenue >= 250 && orders$Potential.Revenue < 300 ,]),
      nrow(orders[orders$Potential.Revenue >= 300 && orders$Potential.Revenue < 350 ,]),
      nrow(orders[orders$Potential.Revenue >= 350 && orders$Potential.Revenue < 400 ,]),
      nrow(orders[orders$Potential.Revenue >= 400,])
    )
  return(data.frame(revenue.brackets, bracket.count))
}
