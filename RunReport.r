RunPatientReport <- function(Patient.File.Path, FulfillmentFilePath, Company, Days) { 
  patients <- CleanPatientCsv(Patient.File.Path)
  fulfillment <- CleanFulfillmentCsv(FulfillmentFilePath)
  
  company.patients <- CompanyPatientSplit(patients, Company)
  company.fulfillment <- CompanyFulfillmentSplit(fulfillment, Company)
  
  company.fulfillment <- company.fulfillment[as.Date(company.fulfillment[,'Order.Date']) >= (Sys.Date() - Days),]
  
  company.patients <- company.patients[company.patients[,'Eligibility.Date'] != "",]
  company.patients <- company.patients[as.Date(company.patients[,'Eligibility.Date']) >= Sys.Date(),]
  company.patients <- company.patients[as.Date(company.patients[,'Eligibility.Date']) <= (Sys.Date() + Days),]
  
  GetPatientCountTable(company.patients, company.fulfillment)
} 

RunCoachReport <- function(Patient.File.Path, FulfillmentFilePath, Company, Days) { 
  patients <- CleanPatientCsv(Patient.File.Path)
  fulfillment <- CleanFulfillmentCsv(FulfillmentFilePath)
  
  company.patients <- CompanyPatientSplit(patients, Company)
  company.fulfillment <- CompanyFulfillmentSplit(fulfillment, Company)
  
  company.fulfillment <- company.fulfillment[as.Date(company.fulfillment[,'Order.Date']) >= (Sys.Date() - Days),]
  
  company.patients <- company.patients[company.patients[,'Eligibility.Date'] != "",]
  company.patients <- company.patients[as.Date(company.patients[,'Eligibility.Date']) >= Sys.Date(),]
  company.patients <- company.patients[as.Date(company.patients[,'Eligibility.Date']) <= (Sys.Date() + Days),]
  
  GetCoachCountTable(company.patients, company.fulfillment)
} 

RunContactReport <- function(Patient.File.Path, FulfillmentFilePath, Company, Days) { 
  patients <- CleanPatientCsv(Patient.File.Path)
  fulfillment <- CleanFulfillmentCsv(FulfillmentFilePath)
  
  company.patients <- CompanyPatientSplit(patients, Company)
  company.fulfillment <- CompanyFulfillmentSplit(fulfillment, Company)
  
  company.fulfillment <- company.fulfillment[as.Date(company.fulfillment[,'Order.Date']) >= (Sys.Date() - Days),]
  
  company.patients <- company.patients[company.patients[,'Eligibility.Date'] != "",]
  company.patients <- company.patients[as.Date(company.patients[,'Eligibility.Date']) >= Sys.Date(),]
  company.patients <- company.patients[as.Date(company.patients[,'Eligibility.Date']) <= (Sys.Date() + Days),]
  
  GetContactCountTable(company.patients, company.fulfillment)
} 

CleanPatientCsv <- function(Patients.File.Path) { 
  patients    <- read.csv(Patients.File.Path)
  return(unique(patients))
} 

CleanFulfillmentCsv <- function(Fulfillment.File.Path) { 
  fulfillment <- read.csv(Fulfillment.File.Path)
  return(unique(fulfillment)) 
} 

CompanyFulfillmentSplit <- function(Fulfillment.Set, Company.Name) { 
  return(Fulfillment.Set[Fulfillment.Set[,'Company'] == Company.Name,])
} 

CompanyPatientSplit <- function(Patient.Set, Company.Name) { 
  return(Patient.Set[Patient.Set[,'Company'] == Company.Name,])
} 

GetPatientCountTable <- function(Patients, Orders) { 
  ids <- Patients$Patient.ID
  order.count <- c()
  for(id in ids) {
    order.count <- c(order.count, nrow(Orders[Orders[,'Patient.ID'] == id, ]))
  }
  CountTable <- data.frame(ids, order.count)
} 

GetCoachCountTable <- function(Patients) {
  coaches <- unique(Patients$Sleep.Coach)
  patient.count <- c()
  for(coach in coaches) {
    patient.count <- c(patient.count, nrow(Patients[Patients[,'Sleep.Coach'] == coach,]))
  }
  CountTable <- data.frame(coaches, patient.count)
}

GetContactCountTable <- function(Patients, Fulfillment) {
  contact.methods <- unique(Patients$Contact)
  patient.count <- c()
  for(contact.method in contact.methods) {
    patient.count <- c(patient.count, nrow(Patients[Patients$Contact == contact.method,]))
  }
  CountTable <- data.frame(contact.methods, patient.count)
}

OrdersByCount <- function(Patient.By.Count) { 
  Number.Of.Orders <- c(0,1,2,3,4,5,6,7,8,9)
  Number.Of.Patients <- c()
  for(c in Number.Of.Orders){
    Number.Of.Patients <- c(Number.Of.Patients, nrow(Patient.By.Count[Patient.By.Count[,'order.count'] == c,]))
  }
  data.frame(Number.Of.Orders, Number.Of.Patients)
} 

ReorderPercentage <- function(Count.Table) {
  sum(Count.Table$order.count)/nrow(Count.Table) * 100
}