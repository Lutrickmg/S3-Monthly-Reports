GetWalkInOrders <- function(dbhost, user, pass, database){
  library(rmongodb)
#  mongo <- mongo.create(host= dbhost, username= user, password= pass, db= database)
  mongo <- mongo.create()
  mongo.is.connected(mongo)
  return(mongo)
}