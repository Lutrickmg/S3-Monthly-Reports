GetCreationDatePatientsTable <- function(patients) {
  dates <- unique(patients$Date.Added)
  dates.count <- c()
  for(date in dates) {
    dates.count <- c(dates.count, nrow(patients[patients[,'Date.Added'] == date,]))
  }
  CountTable <- data.frame(dates, dates.count)
}
