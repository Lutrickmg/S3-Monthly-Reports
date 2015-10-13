library(ggplot2)

source('~/Dropbox/R/Quarterly Reports/Output/Source_File.R')

patients        <- read.csv("/Users/mattlutrick/Downloads/company-patient-report-1444146841.csv")
orders          <- read.csv("/Users/mattlutrick/Downloads/Company\ Order\ Report\ Export-1444146841.csv")
contacts        <- read.csv("/Users/mattlutrick/Downloads/Company\ Contact\ Report\ Export-1444063057.csv")

Company <- "Mystic Medical"

patients <- patients[patients$Active == 'true',]
patients[patients$Insurance == "Private Inurance", c("Insurance")] <- c("Private Insurance")
#patients <- patients[patients$Eligibility.Date != '',]
#patients <- patients[! patients$Sleep.Coach %in%  c("","Sleep Coach","Tim Warren","",'inactive/duplicated  patients'),]
patients$Sleep.Coach <- factor(patients$Sleep.Coach)

#orders <- orders[! orders$Sleep.Coach %in%  c("","Sleep Coach","Tim Warren","",'inactive/duplicated  patients'),]
#orders$Sleep.Coach <- factor(orders$Sleep.Coach)

contacts <- contacts[! contacts$Sleep.Coach %in% c("","Sleep Coach","Tim Warren","",'inactive/duplicated  patients'),]
contacts$Sleep.Coach <- factor(contacts$Sleep.Coach)

new.patients <- patients[as.Date(patients$Date.Added) >= (Sys.Date() - 30),]

# new.patients charts
new.patients.sleep.coach.bar.chart <- PatientSleepCoachBarChart(new.patients)
new.patients.eligibility.dates.chart <- PatientEligibilityDatesChart(new.patients)
new.patients.contact.type.chart <- PatientContactTypeChart(new.patients)
new.patients.insurance.chart <- PatientInsuranceChart(new.patients)
new.patients.insurance.type.table <- GetInsuranceTypeTable(new.patients)
new.patients.contact.type.table <- GetPatientContactTypeTable(new.patients)
new.patients.sleep.coach.table <- GetSleepCoachTable(new.patients)

# patients charts
patients.sleep.coach.bar.chart <- PatientSleepCoachBarChart(patients)
patients.eligibility.dates.chart <- PatientEligibilityDatesChart(patients)
patients.contact.type.chart <- PatientContactTypeChart(patients)
patients.insurance.chart <- PatientInsuranceChart(patients)
patients.insurance.type.table <- GetInsuranceTypeTable(patients)
patients.contact.type.table <- GetPatientContactTypeTable(patients)
patients.sleep.coach.table <- GetSleepCoachTable(patients)

# contacts charts
contacts.type.table <- GetContactTypeTable(contacts)
contacts.dates.chart <- ContactDatesChart(contacts)
contacts.types.chart <- ContactTypesChart(contacts)
contacts.sleep.coach.chart <- ContactSleepCoachBarChart(contacts)
contacts.sleep.coach.table <- GetContactSleepCoachTable(contacts)
contacts.table <- ContactTable(contacts, (Sys.Date() - 90), Sys.Date())

# orders charts
orders.status.chart <- OrderStatusChart(orders)
orders.sleep.coach.chart <- OrderSleepCoachChart(orders)
orders.status.table <- GetOrderStatusTable(orders)
orders.sleep.coach.table <- GetOrderSleepCoachTable(orders)
orders.items.table <- GetItemsOrderTable(orders)
orders.order.date.chart <- OrdersByDateChart(orders)
orders.revenue.date.chart <- OrdersRevenueByDateChart(orders)
orders.revenue.date.table <- OrdersRevenueByDateTable(orders)
orders.status.table.expanded <- OrdersByStatus(orders)

# walk in orders charts
# walk.in.orders.date.chart <- WalkInOrdersByDateChart(walk.in.orders)
