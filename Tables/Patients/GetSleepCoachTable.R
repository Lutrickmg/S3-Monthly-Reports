GetSleepCoachTable <- function(Patients) {
  coaches <- unique(Patients$Sleep.Coach)
  coaches.count <- c()
  for(coach in levels(coaches)) {
    coaches.count <- c(coaches.count, nrow(Patients[Patients[,'Sleep.Coach'] == coach,]))
  }
  CountTable <- data.frame(levels(coaches), coaches.count)
  names(CountTable) <- c("Sleep Coach", "Number of Patients")
  return(CountTable)
}
