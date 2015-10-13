GetContactSleepCoachTable <- function(contacts) {
  coaches <- unique(contacts$Sleep.Coach)
  coaches.count <- c()
  for(coach in coaches) {
    coaches.count <- c(coaches.count, nrow(contacts[contacts[,'Sleep.Coach'] == coach,]))
  }
  CountTable <- data.frame(coaches, coaches.count)
  names(CountTable) <- c("Sleep Coach", "Contacts Made")
  return(CountTable)
}
