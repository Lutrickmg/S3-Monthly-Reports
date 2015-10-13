GetContactTypeTable <- function(contacts) {
  types <- unique(contacts$Type)
  contacts.count <- c()
  for(type in types) {
    contacts.count <- c(contacts.count, nrow(contacts[contacts$Type == type,]))
  }
  CountTable <- data.frame(types, contacts.count)
  names(CountTable) <- c("Contact Type", "Contacts Made")
  return(CountTable)
}
