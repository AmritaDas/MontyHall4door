doors <- c("A", "B", "C", "D")
xdata <- c()
sims <- 3500

for(i in 1:sims){
  prize <- sample(doors)[1]
  pick <- sample(doors)[1]
  open <- sample(doors[which(doors!=prize & doors!=pick)])[1]
  switchyes <- sample(doors[which(doors!=pick & doors!=open)])[1]
  
  if(pick == prize){
    xdata <- c(xdata, "noswitchwin")
  }
  if(switchyes == prize){
    xdata <- c(xdata, "switchwin")
  }
  if(prize != pick & prize != switchyes){
    xdata <- c(xdata, "nowin")
  }
}

length(which(xdata == "switchwin"))
length(which(xdata == "noswitchwin"))
length(which(xdata == "nowin"))

print(paste("% wins if switched: ", length(which(xdata == "switchwin"))/sims ))
print(paste("% wins if not switched: ", length(which(xdata == "noswitchwin"))/sims ))
print(paste("% losses, switched or not: ", length(which(xdata == "nowin"))/sims ))

