GetInsuranceTypeTable <- function(Patients) {
  types <- unique(Patients$Insurance)
  types.count <- c()
  for(type in levels(types)) {
    types.count <- c(types.count, nrow(Patients[Patients[,'Insurance'] == type,]))
  }
  CountTable <- data.frame(levels(types), types.count)
  names(CountTable) <- c("Insurance Type", "Number of Patients")
  return(CountTable)
}
