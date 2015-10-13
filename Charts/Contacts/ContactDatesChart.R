ContactDatesChart <- function(contacts) {
  contacts <- GetDateContactTable(contacts)
  g <- ggplot(contacts, aes(dates, dates.count))
  g <- g+geom_point(color = "#4281A6")
  g <- g+theme(panel.background = element_rect(fill = '#FFFFFF'),
               panel.grid.major = element_line(colour = "#60FBDC"),
               panel.grid.minor = element_line(colour = "#60FBDC"))
  g <- g+labs(x='', y='')
  g <- g+theme(axis.text.x=element_text(angle=310, size=10, vjust=0.5))
  g <- g+ggtitle('Contacts by Date')
  if(nrow(contacts) > 35) {
    g <- g+theme(axis.text.x = element_blank())
  }
  return(g)
}
