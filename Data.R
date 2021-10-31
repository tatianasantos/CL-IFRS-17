# Data used for the practical application in the article
# Some commands may need to be adapted according to the format of the input data

# Read the excel file with the data on claims and exposure
Data <- read.xlsx("C:/Users/tmarques011/Documents/Pessoal/Article/ASTIN/Article/Data_MFW.xlsx")
Data <- as.data.frame(Data) #converts to a data frame
is.data.frame(Data) #makes sure it works and this is a data frame

# Determine the moments of the claim severity
# Assess which claims should be used to estimate the severity
# We have excluded claims settled without any payment
# See which years have enough observations and can make sense to select (we have chosen 2012 - 2017)
Plot_A <- Data %>% 
  filter(Include == TRUE, Risk.group == 5, Valuation.year == 2017, Claim.status == "Closed", Paid.claims != 0) %>% 
  select(Paid.claims, Settled.year)

ggplot(data = Plot_A, mapping = aes(Paid.claims))+
  geom_histogram() +
  facet_wrap(~Settled.year)

Plot_A %>% 
  count(Settled.year) 

Plot_B <- Data %>% 
  filter(Include == TRUE, Risk.group == 6, Valuation.year == 2017, Claim.status == "Closed", Paid.claims != 0) %>% 
  select(Paid.claims, Settled.year)

ggplot(data = Plot_B, mapping = aes(Paid.claims))+
  geom_histogram() +
  facet_wrap(~Settled.year)

Plot_B %>% 
  count(Settled.year)


# Observations for each of the settled claims
# Sum the claim severity for the same claim_ID, only for valuation year 2017
X_A <- Data %>% 
  filter(Include == TRUE, Risk.group == 5, Valuation.year == 2017, Settled.year %in% 2012:2017) %>% 
  group_by(Claim_ID) %>% 
  summarize(IndClaim = sum(Paid.claims)) %>% 
  filter(is.na(Claim_ID)==FALSE)

# Same as above but for another risk group
X_B <- Data %>% 
  filter(Include == TRUE, Risk.group == 6, Valuation.year == 2017, Settled.year %in% 2012:2017) %>% 
  group_by(Claim_ID) %>% 
  summarize(IndClaim = sum(Paid.claims)) %>% 
  filter(is.na(Claim_ID) == FALSE)
  
# Determine the moments of the severity distribution
# Different depending on whether we are applying the compound Poisson or the Multinomial / Dirichlet claim payment process models
G_A <- X_A %>% 
  summarise(mean = moment(IndClaim, order=1, central = FALSE),
            rawmom2 = moment(IndClaim, order=2, central = FALSE),
            rawmom3 = moment(IndClaim, order=3, central = FALSE))

G_B <- X_B %>% 
  summarise(mean = moment(IndClaim, order=1, central = FALSE),
            rawmom2 = moment(IndClaim, order=2, central = FALSE),
            rawmom3 = moment(IndClaim, order=3, central = FALSE))

H_A_CP <- X_A %>% 
  summarise(mean = moment(IndClaim, order=1, central = FALSE),
            rawmom2 = moment(IndClaim, order=2, central = TRUE),
            rawmom3 = moment(IndClaim, order=3, central = TRUE))

H_B_CP <- X_B %>% 
  summarise(mean = moment(IndClaim, order=1, central = FALSE),
            rawmom2 = moment(IndClaim, order=2, central = TRUE),
            rawmom3 = moment(IndClaim, order=3, central = TRUE))


# Create exposure vector for each of the risk groups
Pj_A <- Data %>% 
  filter(Include == TRUE, Risk.group == 5, is.na(Claim_ID) == TRUE) %>% 
  group_by(Accident.year) %>% 
  summarize(Exposure = sum(Exposure)) %>% 
  select(Exposure)

Pj_B <- Data %>% 
  filter(Include == TRUE, Risk.group == 6, is.na(Claim_ID) == TRUE) %>% 
  group_by(Accident.year) %>% 
  summarize(Exposure = sum(Exposure)) %>% 
  select(Exposure)


# Create the matrix with the number of reported claims for each of the risk groups
Njd_A <- Data %>% 
  filter(Include == TRUE, Risk.group == 5, is.na(Claim_ID) == FALSE) %>% 
  mutate(Reporting.delay = Reported.year - Accident.year) %>% 
  filter(Number.of.claims == 1, Valuation.year == 2017) %>% 
  count(Accident.year, Reporting.delay) %>% 
  pivot_wider(names_from = Reporting.delay, values_from = n) %>% 
  subset(select=c(-Accident.year)) %>% 
  mutate("10" = c(0,rep(NA,10))) # Need to add a column at the end (specific to this data)
  Njd_A[[2,10]] <- 0 # Need to add this element to get a triangle (specific to this data)
 

Njd_B <- Data %>% 
  filter(Include == TRUE, Risk.group == 6, is.na(Claim_ID) == FALSE) %>% 
  mutate(Reporting.delay = Reported.year - Accident.year) %>% 
  filter(Number.of.claims == 1, Valuation.year == 2017) %>% 
  count(Accident.year, Reporting.delay) %>% 
  pivot_wider(names_from = Reporting.delay, values_from = n) %>% 
  subset(select=c(-Accident.year))

# Estimate the reporting pattern based on the development factors and claim rates
Cum_Njd_A <- incr2cum(Njd_A)
DF_PI_A <- Cum_Njd_A %>% 
  ata() %>% 
  attr("vwtd") %>% 
  append(1,after=0) # Need to add a first element for d=0

Cum_Njd_B <- incr2cum(Njd_B)
DF_PI_B <- Cum_Njd_B %>% 
  ata() %>% 
  attr("vwtd") %>% 
  append(1,after=0) # Need to add a first element for d=0

PId_DF_A <- Pattern_DF(DF_PI_A)
PId_DF_B <- Pattern_DF(DF_PI_B)

PId_CR_A <- Reporting_Pattern_CR(Njd_A,Pj_A)
PId_CR_B <- Reporting_Pattern_CR(Njd_B,Pj_B)


# Create the matrix with the payments for the reported claims: reporting period vs valuation date
Xjdt_A <- Data %>% 
  filter(Include == TRUE, Risk.group == 5, is.na(Claim_ID) == FALSE) %>% 
  mutate(Payment.delay = Valuation.year - Reported.year) %>% 
  select(Reported.year, Payment.delay, Paid.claims) %>% 
  group_by(Reported.year, Payment.delay) %>% 
  summarize(Payments=sum(Paid.claims)) %>% 
  pivot_wider(names_from = Payment.delay, values_from = Payments) %>% 
  subset(select=c(-Reported.year)) %>% 
  as.matrix()

Xjdt_B <- Data %>% 
  filter(Include == TRUE, Risk.group == 6, is.na(Claim_ID) == FALSE) %>% 
  mutate(Payment.delay = Valuation.year - Reported.year) %>% 
  select(Reported.year, Payment.delay, Paid.claims) %>% 
  group_by(Reported.year, Payment.delay) %>% 
  summarize(Payments=sum(Paid.claims)) %>% 
  pivot_wider(names_from = Payment.delay, values_from = Payments) %>% 
  subset(select=c(-Reported.year)) %>%
  as.matrix()


# Estimate the payment pattern based on development factors and claim rates
DF_Vt_A <- Xjdt_A %>% 
  ata() %>% 
  attr("vwtd") %>% 
  append(1,after=0) #need to add a first element for d=0

DF_Vt_B <- Xjdt_B %>% 
  ata() %>% 
  attr("vwtd") %>% 
  append(1,after=0) #need to add a first element for d=0

Vt_DF_A <- Pattern_DF(DF_Vt_A)
Vt_DF_B <- Pattern_DF(DF_Vt_B)

Inc_Xjdt_A <- cum2incr(Xjdt_A)
Inc_Xjdt_B <- cum2incr(Xjdt_B)

Vt_CR_A <- Payment_Pattern_CR(Inc_Xjdt_A,Njd_A)
Vt_CR_B <- Payment_Pattern_CR(Inc_Xjdt_B,Njd_B)


# Exposure for the LRC not obtained based on real data
# We have defined a vector of observations to show the mechanics of the calculation of the percentile for the LRC
PJ_A <- c(350,100,50)
PJ_B <- c(2400, 650, 325)


# Determine the moments of theta
# Risk group A
Prior_Param_MLE_A <- coef(mle(minuslogl=LogLik_A,start=list(alpha=100,beta=100)))
Prior_Param_DV_A <- DeVylder(Cum_Njd_A,Pj_A,PId_DF_A)

Post_Mom_MM_A <- Method_Moments(Cum_Njd_A,Pj_A,PId_DF_A)
Post_Mom_MLE_A <- Posterior_Mom(Prior_Param_MLE_A,Cum_Njd_A,Pj_A,PId_DF_A)
Post_Mom_DV_A <- Posterior_Mom(Prior_Param_DV_A,Cum_Njd_A,Pj_A,PId_DF_A)

Prior_Mom_MLE_A <- Prior_Mom(Prior_Param_MLE_A,PJ_A)
Prior_Mom_DV_A <- Prior_Mom(Prior_Param_DV_A,PJ_A)


# Risk group B
Prior_Param_DV_B <- DeVylder(Cum_Njd_B,Pj_B,PId_DF_B)

Post_Mom_MM_B <- Method_Moments(Cum_Njd_B,Pj_B,PId_DF_B)
Post_Mom_DV_B <- Posterior_Mom(Prior_Param_DV_B,Cum_Njd_B,Pj_B,PId_DF_B)

Prior_Mom_DV_B <- Prior_Mom(Prior_Param_DV_B,PJ_B)



# Determine the equivalent single discount rate
# The curve to be applied is EIOPA's RFR + VA as at 31 December 2017
# Read and store the curve into a variable Data_RFR
# Determine the cash flows for each case: RBNS, IBNR and CBNI
# For this case we have use the prior and posterior parameters estimated using De Vylder's iterative procedure
Data_RFR <- read.xlsx("C:/Users/tmarques011/Documents/Pessoal/Article/ASTIN/Article/RFR+VA 31-12-2017.xlsx")
RFR <- Data_RFR[,2]

Discount_factor <- Discount(RFR)


# Risk group A
CF_RBNS_UNDISC_A <- cf_rbns(Njd_A,Vt_DF_A,H_A_CP)
CF_IBNR_UNDISC_A <- cf_ibnr(Pj_A,PId_DF_A,Vt_DF_A,H_A_CP,Post_Mom_DV_A)
CF_CBNI_UNDISC_A <- cf_cbni(PJ_A,PId_DF_A,Vt_DF_A,H_A_CP,Prior_Mom_DV_A)

CF_RBNS_DISC_A <- sum(CF_RBNS_UNDISC_A*Discount_factor) %>% formattable::comma()
CF_IBNR_DISC_A <- sum(CF_IBNR_UNDISC_A*Discount_factor) %>% formattable::comma()
CF_CBNI_DISC_A <- sum(CF_CBNI_UNDISC_A*Discount_factor) %>% formattable::comma()

D_RBNS_A <- uniroot(f,c(0,2),CF_UNDISC=CF_RBNS_UNDISC_A, CF_DISC=CF_RBNS_DISC_A)$root
D_IBNR_A <- uniroot(f,c(0,1),CF_UNDISC=CF_IBNR_UNDISC_A, CF_DISC=CF_IBNR_DISC_A)$root
D_CBNI_A <- uniroot(f,c(0,1),CF_UNDISC=CF_CBNI_UNDISC_A, CF_DISC=CF_CBNI_DISC_A)$root


# Risk group B
CF_RBNS_UNDISC_B <- cf_rbns(Njd_B,Vt_DF_B,H_B_CP)
CF_IBNR_UNDISC_B <- cf_ibnr(Pj_B,PId_DF_B,Vt_DF_B,H_B_CP,Post_Mom_DV_B)
CF_CBNI_UNDISC_B <- cf_cbni(PJ_B,PId_DF_B,Vt_DF_B,H_B_CP,Prior_Mom_DV_B)

CF_RBNS_DISC_B <- sum(CF_RBNS_UNDISC_B*Discount_factor) %>% formattable::comma()
CF_IBNR_DISC_B <- sum(CF_IBNR_UNDISC_B*Discount_factor) %>% formattable::comma()
CF_CBNI_DISC_B <- sum(CF_CBNI_UNDISC_B*Discount_factor) %>% formattable::comma()

D_RBNS_B <- uniroot(f,c(0,2),CF_UNDISC=CF_RBNS_UNDISC_B, CF_DISC=CF_RBNS_DISC_B)$root
D_IBNR_B <- uniroot(f,c(0,1),CF_UNDISC=CF_IBNR_UNDISC_B, CF_DISC=CF_IBNR_DISC_B)$root
D_CBNI_B <- uniroot(f,c(0,1),CF_UNDISC=CF_CBNI_UNDISC_B, CF_DISC=CF_CBNI_DISC_B)$root
