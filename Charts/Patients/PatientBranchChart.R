PatientBranchChart <- function(Patients) {
  g <- ggplot(patients, aes(patients$Branch))
  g <- g+geom_bar(width = .5, fill='#4281A6')
  g <- g+theme(panel.background = element_rect(fill = '#60FBDC'))
  g <- g+labs(x='', y='')
  g <- g+ggtitle('Patients by Branch')
  return(g)
}