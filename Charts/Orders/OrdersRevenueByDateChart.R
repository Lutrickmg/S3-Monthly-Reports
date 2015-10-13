OrdersRevenueByDateChart <- function(orders) {
  orders <- OrdersRevenueByDateTable(orders)
  g <- ggplot(orders, aes(dates, revenue))
  g <- g+geom_point(color = "#4281A6")
  g <- g+theme(panel.background = element_rect(fill = '#FFFFFF'),
               panel.grid.major = element_line(colour = "#60FBDC"),
               panel.grid.minor = element_line(colour = "#60FBDC"))
  g <- g+labs(x='', y='')
  g <- g+theme(axis.text.x=element_text(angle=270, size=10, vjust=0.5))
  g <- g+ggtitle('Order Revenue by Order Date')
  if(nrow(orders) > 35) {
    g <- g+theme(axis.text.x = element_blank())
  }
  return(g)
}
