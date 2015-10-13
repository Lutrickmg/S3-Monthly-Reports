ContactTable <- function(contacts, start.date, end.date) {
  contacts <- contacts[(as.Date(contacts[,'Contacted.At'], "%m/%d/%y") < end.date) && (as.Date(contacts[,'Contacted.At'], "%m/%d/%y") > start.date), c('Patient','Type','Sleep.Coach','Status')]
  return(contacts)
}
