#To run the entire program one only needs to run the "Results" script

# Libraries used in the program
library(openxlsx) # retrieve data from an excel file
library(tidyverse) # organize the data 
library(ggplot2) # visual analysis of the data
library(rootSolve) # solve for the single discount rate
library(formattable) # format data
library(plotly) # present the results in a graphic

source("Functions - general.R")
source("Functions - cash flows.R")
source("Functions - parameters.R")
source("Functions - results.R")
source("Parameters.R")


# Risk group A
# Determine the severity distribution moments based on the compound Poisson
CMOM_RBNS_CP_A <- cmom_cp(D_RBNS_A,Vt_DF_A,H_A_CP)
CMOM_IBNR_CP_A <- cmom_cp(D_IBNR_A,Vt_DF_A,H_A_CP)
CMOM_CBNI_CP_A <- cmom_cp(D_CBNI_A,Vt_DF_A,H_A_CP)

# Determine the moments based on the compound Poisson
MOM_RBNS_CP_A <- mom_rbns_gen(D_RBNS_A,Njd_A,CMOM_RBNS_CP_A)
MOM_IBNR_CP_A <- mom_ibnr_gen(D_IBNR_A,Pj_A,PId_DF_A,Post_Mom_DV_A,CMOM_IBNR_CP_A)
MOM_CBNI_CP_A <- mom_cbni_gen(D_CBNI_A,PJ_A,PId_DF_A,Prior_Mom_DV_A,CMOM_CBNI_CP_A)

#Determine the estimated risk adjustment for the defined confidence level based on the compound Poisson
RA_LIC_CP_A <- ra_lic(0.85,MOM_RBNS_CP_A,MOM_IBNR_CP_A)
RA_LRC_CP_A <- ra_lrc(0.85,MOM_CBNI_CP_A)


# Determine the severity distribution moments based on the multinomial
CMOM_RBNS_MULT_A <- cmom_mult(D_RBNS_A,Vt_DF_A,G_A)
CMOM_IBNR_MULT_A <- cmom_mult(D_IBNR_A,Vt_DF_A,G_A)
CMOM_CBNI_MULT_A <- cmom_mult(D_CBNI_A,Vt_DF_A,G_A)

# Determine the moments based on the multinomial
MOM_RBNS_MULT_A <- mom_rbns_gen(D_RBNS_A,Njd_A,CMOM_RBNS_MULT_A)
MOM_IBNR_MULT_A <- mom_ibnr_gen(D_IBNR_A,Pj_A,PId_DF_A,Post_Mom_DV_A,CMOM_IBNR_MULT_A)
MOM_CBNI_MULT_A <- mom_cbni_gen(D_CBNI_A,PJ_A,PId_DF_A,Prior_Mom_DV_A,CMOM_CBNI_MULT_A)

# Determine the estimated risk adjustment for the defined confidence level based on the multinomial
RA_LIC_MULT_A <- ra_lic(0.85,MOM_RBNS_MULT_A,MOM_IBNR_MULT_A)
RA_LRC_MULT_A <- ra_lrc(0.85,MOM_CBNI_MULT_A)


#Determine the severity distribution moments based on the Dirichlet
#Assume that delta=1 so that the payment pattern for the Dirichlet deltat is the same as for the other models vt
#The delta chosen impacts the volatility of the model
CMOM_RBNS_DIR_A <- cmom_dir(D_RBNS_A,Vt_DF_A,G_A)
CMOM_IBNR_DIR_A <- cmom_dir(D_IBNR_A,Vt_DF_A,G_A)
CMOM_CBNI_DIR_A <- cmom_dir(D_CBNI_A,Vt_DF_A,G_A)

#Determine the moments based on the Dirichlet
MOM_RBNS_DIR_A <- mom_rbns_gen(D_RBNS_A,Njd_A,CMOM_RBNS_DIR_A)
MOM_IBNR_DIR_A <- mom_ibnr_gen(D_IBNR_A,Pj_A,PId_DF_A,Post_Mom_DV_A,CMOM_IBNR_DIR_A)
MOM_CBNI_DIR_A <- mom_cbni_gen(D_CBNI_A,PJ_A,PId_DF_A,Prior_Mom_DV_A,CMOM_CBNI_DIR_A)

#Determine the estimated risk adjustment for the defined confidence level based on the Dirichlet
RA_LIC_DIR_A <- ra_lic(0.85,MOM_RBNS_DIR_A,MOM_IBNR_DIR_A)
RA_LRC_DIR_A <- ra_lrc(0.85,MOM_CBNI_DIR_A)



# Risk group B
# Determine the severity distribution moments based on the compound Poisson
CMOM_RBNS_CP_B <- cmom_cp(D_RBNS_B,Vt_DF_B,H_B_CP)
CMOM_IBNR_CP_B <- cmom_cp(D_IBNR_B,Vt_DF_B,H_B_CP)
CMOM_CBNI_CP_B <- cmom_cp(D_CBNI_B,Vt_DF_B,H_B_CP)

# Determine the moments based on the compound Poisson
MOM_RBNS_CP_B <- mom_rbns_gen(D_RBNS_B,Njd_B,CMOM_RBNS_CP_B)
MOM_IBNR_CP_B <- mom_ibnr_gen(D_IBNR_B,Pj_B,PId_DF_B,Post_Mom_DV_B,CMOM_IBNR_CP_B)
MOM_CBNI_CP_B <- mom_cbni_gen(D_CBNI_B,PJ_B,PId_DF_B,Prior_Mom_DV_B,CMOM_CBNI_CP_B)

#Determine the estimated risk adjustment for the defined confidence level based on the compound Poisson
RA_LIC_CP_B <- ra_lic(0.85,MOM_RBNS_CP_B,MOM_IBNR_CP_B)
RA_LRC_CP_B <- ra_lrc(0.85,MOM_CBNI_CP_B)


# Determine the severity distribution moments based on the multinomial
CMOM_RBNS_MULT_B <- cmom_mult(D_RBNS_B,Vt_DF_B,G_B)
CMOM_IBNR_MULT_B <- cmom_mult(D_IBNR_B,Vt_DF_B,G_B)
CMOM_CBNI_MULT_B <- cmom_mult(D_CBNI_B,Vt_DF_B,G_B)

# Determine the moments based on the multinomial
MOM_RBNS_MULT_B <- mom_rbns_gen(D_RBNS_B,Njd_B,CMOM_RBNS_MULT_B)
MOM_IBNR_MULT_B <- mom_ibnr_gen(D_IBNR_B,Pj_B,PId_DF_B,Post_Mom_DV_B,CMOM_IBNR_MULT_B)
MOM_CBNI_MULT_B <- mom_cbni_gen(D_CBNI_B,PJ_B,PId_DF_B,Prior_Mom_DV_B,CMOM_CBNI_MULT_B)

# Determine the estimated risk adjustment for the defined confidence level based on the multinomial
RA_LIC_MULT_B <- ra_lic(0.85,MOM_RBNS_MULT_B,MOM_IBNR_MULT_B)
RA_LRC_MULT_B <- ra_lrc(0.85,MOM_CBNI_MULT_B)


#Determine the severity distribution moments based on the Dirichlet
#Assume that delta=1 so that the payment pattern for the Dirichlet deltat is the same as for the other models vt
#The delta chosen impacts the volatility of the model
CMOM_RBNS_DIR_B <- cmom_dir(D_RBNS_B,Vt_DF_B,G_B)
CMOM_IBNR_DIR_B <- cmom_dir(D_IBNR_B,Vt_DF_B,G_B)
CMOM_CBNI_DIR_B <- cmom_dir(D_CBNI_B,Vt_DF_B,G_B)

#Determine the moments based on the Dirichlet
MOM_RBNS_DIR_B <- mom_rbns_gen(D_RBNS_B,Njd_B,CMOM_RBNS_DIR_B)
MOM_IBNR_DIR_B <- mom_ibnr_gen(D_IBNR_B,Pj_B,PId_DF_B,Post_Mom_DV_B,CMOM_IBNR_DIR_B)
MOM_CBNI_DIR_B <- mom_cbni_gen(D_CBNI_B,PJ_B,PId_DF_B,Prior_Mom_DV_B,CMOM_CBNI_DIR_B)

#Determine the estimated risk adjustment for the defined confidence level based on the Dirichlet
RA_LIC_DIR_B <- ra_lic(0.85,MOM_RBNS_DIR_B,MOM_IBNR_DIR_B)
RA_LRC_DIR_B <- ra_lrc(0.85,MOM_CBNI_DIR_B)


# Presentation of the results
# Data frame with the mean obtained for each case: RBNS, IBNR and CBNI
Summary_mean <- data.frame("RBNS" = c(CF_RBNS_DISC_A, CF_RBNS_DISC_B), 
                           "IBNR" = c(CF_IBNR_DISC_A, CF_IBNR_DISC_B),
                           "CBNI" = c(CF_CBNI_DISC_A, CF_CBNI_DISC_B))
Summary_mean <- Summary_mean %>% mutate(IBNS = RBNS + IBNR)


#Data frame with an estimate of the Risk Adjustment for a certain confidence level separating the SD adjustment and skewness adjustment
Summary_85_MULT <- data.frame("Element"=c("SD_A", "Skewness_A","SD_B", "Skewness_B"),
                            "RBNS"=c(qnorm(0.85)*sqrt(MOM_RBNS_MULT_A[2]),
                                     ((qnorm(0.85)^2-1)*MOM_RBNS_MULT_A[3])/(6*MOM_RBNS_MULT_A[2]),
                                     qnorm(0.85)*sqrt(MOM_RBNS_MULT_B[2]),
                                     ((qnorm(0.85)^2-1)*MOM_RBNS_MULT_B[3])/(6*MOM_RBNS_MULT_B[2])),
                            "IBNR"=c(qnorm(0.85)*sqrt(MOM_IBNR_MULT_A[2]),
                                     ((qnorm(0.85)^2-1)*MOM_IBNR_MULT_A[3])/(6*MOM_IBNR_MULT_A[2]),
                                     qnorm(0.85)*sqrt(MOM_IBNR_MULT_B[2]),
                                     ((qnorm(0.85)^2-1)*MOM_IBNR_MULT_B[3])/(6*MOM_IBNR_MULT_B[2])),
                            "IBNS"=c(qnorm(0.85)*sqrt(MOM_RBNS_MULT_A[2]+MOM_IBNR_MULT_A[2]),
                                     ((qnorm(0.85)^2-1)*(MOM_RBNS_MULT_A[3]+MOM_IBNR_MULT_A[3]))/(6*(MOM_RBNS_MULT_A[2]+MOM_IBNR_MULT_A[2])),
                                     qnorm(0.85)*sqrt(MOM_RBNS_MULT_B[2]+MOM_IBNR_MULT_B[2]),
                                     ((qnorm(0.85)^2-1)*(MOM_RBNS_MULT_B[3]+MOM_IBNR_MULT_B[3]))/(6*(MOM_RBNS_MULT_B[2]+MOM_IBNR_MULT_B[2]))),
                            "CBNI"=c(qnorm(0.85)*sqrt(MOM_CBNI_MULT_A[2]),
                                     ((qnorm(0.85)^2-1)*MOM_CBNI_MULT_A[3])/(6*MOM_CBNI_MULT_A[2]),
                                     qnorm(0.85)*sqrt(MOM_CBNI_MULT_B[2]),
                                     ((qnorm(0.85)^2-1)*MOM_CBNI_MULT_B[3])/(6*MOM_CBNI_MULT_B[2])))


# Risk group A
# Data frame with an estimate of the risk adjustment for different confidence levels and different assumptions: compound Poisson, multinomial, Dirichlet
RA_LIC_CL_A <- ra_lic_cl(MOM_RBNS_CP_A,MOM_RBNS_MULT_A,MOM_RBNS_DIR_A,MOM_IBNR_CP_A,MOM_IBNR_MULT_A,MOM_IBNR_DIR_A)
RA_LRC_CL_A <- ra_lrc_cl(MOM_CBNI_CP_A,MOM_CBNI_MULT_A,MOM_CBNI_DIR_A)

# Add columns with the relative size of the percentile compared to the mean
LIC_CL_A <- RA_LIC_CL_A %>% 
  mutate(LIC_CP_PER = (CP + Summary_mean$IBNS[1]) / Summary_mean$IBNS[1], 
         LIC_MULT_PER = (MULT + Summary_mean$IBNS[1]) / Summary_mean$IBNS[1],
         LIC_DIR_PER = (DIR + Summary_mean$IBNS[1]) / Summary_mean$IBNS[1])

LRC_CL_A <- RA_LRC_CL_A %>% 
  mutate(LRC_CP_PER = (CP + Summary_mean$CBNI[1]) / Summary_mean$CBNI[1], 
         LRC_MULT_PER = (MULT + Summary_mean$CBNI[1]) / Summary_mean$CBNI[1],
         LRC_DIR_PER = (DIR + Summary_mean$CBNI[1]) / Summary_mean$CBNI[1])


# Risk group B
# Data frame with an estimate of the risk adjustment for different confidence levels and different assumptions: compound Poisson, multinomial, Dirichlet
RA_LIC_CL_B <- ra_lic_cl(MOM_RBNS_CP_B,MOM_RBNS_MULT_B,MOM_RBNS_DIR_B,MOM_IBNR_CP_B,MOM_IBNR_MULT_B,MOM_IBNR_DIR_B)
RA_LRC_CL_B <- ra_lrc_cl(MOM_CBNI_CP_B,MOM_CBNI_MULT_B,MOM_CBNI_DIR_B)

# Add columns with the relative size of the percentile compared to the mean
LIC_CL_B <- RA_LIC_CL_B %>% 
  mutate(LIC_CP_PER = (CP + Summary_mean$IBNS[2]) / Summary_mean$IBNS[2], 
         LIC_MULT_PER = (MULT + Summary_mean$IBNS[2]) / Summary_mean$IBNS[2],
         LIC_DIR_PER = (DIR + Summary_mean$IBNS[2]) / Summary_mean$IBNS[2])

LRC_CL_B <- RA_LRC_CL_B %>% 
  mutate(LRC_CP_PER = (CP + Summary_mean$CBNI[2]) / Summary_mean$CBNI[2], 
         LRC_MULT_PER = (MULT + Summary_mean$CBNI[2]) / Summary_mean$CBNI[2],
         LRC_DIR_PER = (DIR + Summary_mean$CBNI[2]) / Summary_mean$CBNI[2])


# Graphics with the results
# Risk group A LIC
FIG_LIC_A <- plot_ly(data = LIC_CL_A, x = ~CL) %>%
  add_trace(y = ~LIC_CP_PER, type = "scatter", name = "Compound Poisson", mode = "lines",
            line = list(color = "#5BC8AC")) 

FIG_LIC_A <- FIG_LIC_A %>% 
  add_trace(y = ~LIC_MULT_PER, type = "scatter", name = "Multinomial", mode = "lines",
            line = list(color = "#E6D72A"))

FIG_LIC_A <- FIG_LIC_A %>% 
  add_trace(y = ~LIC_DIR_PER, type = "scatter", name = "Dirichlet", mode = "lines",
            line = list(color = "#F18D9E"))

FIG_LIC_A <- FIG_LIC_A %>% layout(xaxis = list(tickformat = "%", title = "Confidence level"),
                                  yaxis = list(tickformat = "%", title = "Percentile"),
                                  legend = list(x=0.1, y=0.9), title ="Percentile LIC for risk group A")


#Risk group A LRC
FIG_LRC_A <- plot_ly(data = LRC_CL_A, x = ~CL) %>%
  add_trace(y = ~LRC_CP_PER, type = "scatter", name = "Compound Poisson", mode = "lines",
            line = list(color = "#9BC01C")) 

FIG_LRC_A <- FIG_LRC_A %>% 
  add_trace(y = ~LRC_MULT_PER, type = "scatter", name = "Multinomial", mode = "lines",
            line = list(color = "#FA6775"))

FIG_LRC_A <- FIG_LRC_A %>% 
  add_trace(y = ~LRC_DIR_PER, type = "scatter", name = "Dirichlet", mode = "lines",
            line = list(color = "#FFD64D"))

FIG_LRC_A <- FIG_LRC_A %>% layout(xaxis = list(tickformat = "%", title = "Confidence level"),
                                  yaxis = list(tickformat = "%", title = "Percentile"),
                                  legend = list(x=0.1, y=0.9), title ="Percentile LRC for risk group A")


# Risk group B LIC
FIG_LIC_B <- plot_ly(data = LIC_CL_B, x = ~CL) %>%
  add_trace(y = ~LIC_CP_PER, type = "scatter", name = "Compound Poisson", mode = "lines",
            line = list(color = "#5BC8AC")) 

FIG_LIC_B <- FIG_LIC_B %>% 
  add_trace(y = ~LIC_MULT_PER, type = "scatter", name = "Multinomial", mode = "lines",
            line = list(color = "1E656D"))

FIG_LIC_B <- FIG_LIC_B %>% 
  add_trace(y = ~LIC_DIR_PER, type = "scatter", name = "Dirichlet", mode = "lines",
            line = list(color = "#F62A00"))

FIG_LIC_B <- FIG_LIC_B %>% layout(xaxis = list(tickformat = "%", title = "Confidence level"),
                                  yaxis = list(tickformat = "%", title = "Percentile"),
                                  legend = list(x=0.1, y=0.9), title ="Percentile LIC for risk group B")


#Risk group B LRC
FIG_LRC_B <- plot_ly(data = LRC_CL_B, x = ~CL) %>%
  add_trace(y = ~LRC_CP_PER, type = "scatter", name = "Compound Poisson", mode = "lines",
            line = list(color = "#FD974F")) 

FIG_LRC_B <- FIG_LRC_B %>% 
  add_trace(y = ~LRC_MULT_PER, type = "scatter", name = "Multinomial", mode = "lines",
            line = list(color = "#C60000"))

FIG_LRC_B <- FIG_LRC_B %>% 
  add_trace(y = ~LRC_DIR_PER, type = "scatter", name = "Dirichlet", mode = "lines",
            line = list(color = "#805A3B"))

FIG_LRC_B <- FIG_LRC_B %>% layout(xaxis = list(tickformat = "%", title = "Confidence level"),
                                  yaxis = list(tickformat = "%", title = "Percentile"),
                                  legend = list(x=0.1, y=0.9), title ="Percentile LRC for risk group B")

FIG_LIC_A
FIG_LIC_B
FIG_LRC_A
FIG_LRC_B