# Functions defined for the parameters

# Function to obtain the discount factors from the RFR curve
Discount <- function(RFR){
  P = length(RFR)
  for(i in 1:P){
    RFR[i] = (1+RFR[i])^(-i)
  }
  return(RFR)
}


# Function defined to solve for the equivalent single discount rate
# This function can be applied for each case: RBNS, IBNR and CBNI, the arguments need to be defined accordingly
f <- function(CF_UNDISC, CF_DISC, D){
  SUM_CF = 0
 P = length(CF_UNDISC)
  for(t in 1:P){
    SUM_CF = SUM_CF + CF_UNDISC[t]*(D)^(t)
  }
 sum(CF_DISC) - SUM_CF
}
