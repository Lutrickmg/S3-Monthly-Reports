OrdersByCount <- function(Patient.By.count) { 
  Number.Of.Orders <- c(0,1,2,3,4,5,6,7,8,9)
  Number.Of.Patients <- c()
  for(c in Number.Of.Orders){
    Number.Of.Patients <- c(Number.Of.Patients, nrow(table[table[,'count'] == c,]))
  }
  data.frame(Number.Of.Orders, Number.Of.Patients)
} 