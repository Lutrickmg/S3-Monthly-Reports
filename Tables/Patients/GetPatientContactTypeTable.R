GetPatientContactTypeTable <- function(Patients) {
  types <- unique(Patients$Contact)
  types.count <- c()
  for(type in levels(types)) {
    types.count <- c(types.count, nrow(Patients[Patients[,'Contact'] == type,]))
  }
  CountTable <- data.frame(levels(types), types.count)
  names(CountTable) <- c("Contact Method", "Number of Patients")
  return(CountTable)
}
