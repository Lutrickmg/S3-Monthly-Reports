GetEligibilityDatePatientsTable <- function(patients) {
  dates <- unique(patients$Eligibility.Date)
  dates.count <- c()
  for(date in dates) {
      dates.count <- c(dates.count, nrow(patients[patients[,'Eligibility.Date'] == date,]))
  }
  CountTable <- data.frame(dates, dates.count)
}
