ContactTypesChart <- function(contacts) {
  g <- ggplot(contacts, aes(contacts$Type))
  g <- g+geom_bar(width = .5, fill='#4281A6')
  g <- g+theme(panel.background = element_rect(fill = '#FFFFFF'),
               panel.grid.major = element_line(colour = "#60FBDC"),
               panel.grid.minor = element_line(colour = "#60FBDC"))
  g <- g+labs(x='', y='')
  g <- g+ggtitle('Contacts by Type')
  return(g)
}