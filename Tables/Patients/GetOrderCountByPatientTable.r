GetCountTable <- function(Patients, Orders) { 
  ids <- Patients[,'Patient.ID']
  count <- c()
  for(id in ids){
    count <- c(count, nrow(Orders[Orders[,'Patient.ID'] == id,]))
  }
  CountTable <- data.frame(ids, count)
} 
