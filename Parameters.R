# Parameters used for the practical application in the article


# Exposure measure
Pj_A <- data.frame("Exposure"=c(507, 547.87, 576.13, 608.74000000000001, 627.13999999999999,
                                628.73000000000002, 629.83000000000004, 619.56999999999994,
                                626.21000000000004, 652.36000000000001, 765.62))
Pj_B <- data.frame("Exposure"=c(3954.7199999999998, 4244.0599999999995, 4297.5799999999999,
                                4358.9899999999998, 4445.6100000000006, 4547.7399999999998, 
                                4633.9099999999999, 4583.6999999999998, 4626.3699999999999,
                                4703.2399999999998, 4821.0599999999995))

PJ_A <- c(350,100,50)
PJ_B <- c(2400, 650, 325)


# Reporting pattern
PId_DF_A <- c(0.1406686295301809719, 0.2595362168453523299, 0.2105711598268874829, 
              0.1548729499810748700, 0.0750939825579363118, 0.0548714971081243896,
              0.0340969962886888481, 0.0386782876236249698, 0.0245680267170031684, 
              0.0070422535211266662, 0)
PId_DF_B <- c(0.098845395591370525, 0.165294094541550224, 0.139644130862764115, 
              0.118333322397919050, 0.081066581526139908, 0.066962714900728901,
              0.077892749317810345, 0.070242685565424304, 0.074640558165540716, 
              0.071679537042256214, 0.035398230088495665)


# Payment pattern
Vt_DF_A <- c(0.00702259524563344107, 0.17548489270589667788, 0.24867591401872402024, 
             0.25140107726992216852, 0.13255742704663231457, 0.07156907833934635088,
             0.11239324186212901191, 0.00089577351171605179, 0, 0, 0)
Vt_DF_B <- c(0.026626555653261122, 0.328585539384505632, 0.244509826858605311,
             0.123847868928295329, 0.064948762104212202, 0.073516183806203575,
             0.062743859792921838, 0.075221403471995005, 0, 0, 0)


# Number of reported claims
Njd_A <- data.frame(c(18, 17, 13, 40, 25, 26, 38, 33, 24, 37, 30),
                    c(40, 40, 71, 52, 39, 50, 55, 44, 44, 65, NA),
                    c(24, 26, 42, 38, 50, 41, 50, 39, 42, NA, NA),
                    c(27, 13, 30, 30, 31, 32, 31, 37, NA, NA, NA),
                    c(14, 13, 14, 18, 14, 16, 8, NA, NA, NA, NA),
                    c(12, 7, 13, 8, 9, 10, NA, NA, NA, NA, NA),
                    c(6, 6, 9, 8, 1, NA, NA, NA, NA, NA, NA),
                    c(5, 7, 6, 9, NA, NA, NA, NA, NA, NA, NA),
                    c(3, 4, 5, NA, NA, NA, NA, NA, NA, NA, NA),
                    c(2, 0, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                    c(0, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA))
colnames(Njd_A)=c(0:10)

Njd_B <- data.frame(c(11, 17, 17, 32, 33, 42, 69, 77, 61, 59, 112),
                    c(36, 31, 40, 55, 85, 73, 106, 85, 89, 99, NA),
                    c(20, 33, 37, 61, 61, 67, 84, 53, 91, NA, NA),
                    c(28, 36, 35, 46, 47, 50, 49, 68, NA, NA, NA),
                    c(22, 34, 18, 35, 26, 34, 33, NA, NA, NA, NA),
                    c(18, 20, 13, 29, 22, 27, NA, NA, NA, NA, NA),
                    c(25, 18, 23, 30, 20, NA, NA, NA, NA, NA, NA),
                    c(14, 30, 16, 17, NA, NA, NA, NA, NA, NA, NA),
                    c(23, 20, 11, NA, NA, NA, NA, NA, NA, NA, NA),
                    c(21, 14, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                    c(8, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA))
colnames(Njd_B)=c(0:10)


# Raw moments of the severity distribution (used for the compound Poisson model)
H_A_CP <- data.frame("mean"=220285.91385425811, "rawmom2"=1069622337685.6754, "rawmom3"=9578987850251440128)
H_B_CP <- data.frame("mean"=59209.501970660145, "rawmom2"=137970043634.15283, "rawmom3"=1134463503952609408)


# Raw moments of the severity distribution (used for the multinomial and dirichlet models)
G_A <- data.frame("mean"=220285.91385425811, "rawmom2"=1118148221528.281, "rawmom3"=10296545621327343616)
G_B <- data.frame("mean"=59209.501970660145, "rawmom2"=141475808757.76645, "rawmom3"=1159178491270949888)


# Prior moments theta
Prior_Mom_DV_A <- data.frame("mu1" = c(0.31527275263432336, 0.31527275263432336, 0.31527275263432336),
                             "mu2" = c(0.00089414103036334453, 0.00089414103036334453, 0.00089414103036334453),
                             "mu3" = c(2.5358619655486971e-06, 2.5358619655486971e-06, 2.5358619655486971e-06))
Prior_Mom_DV_B <- data.frame("mu1" = c(0.10589534314999556, 0.10589534314999556, 0.10589534314999556),
                             "mu2" = c(0.0024313766446624565, 0.0024313766446624565, 0.0024313766446624565),
                             "mu3" = c(5.5824856999014437e-05, 5.5824856999014437e-05, 5.5824856999014437e-05))


# Posterior moments theta
Post_Mom_DV_A <- data.frame("mu1" = c(0.30498505905344281, 0.27115295873059109, 0.33975826736513554,
                                      0.33347416930625351, 0.29943075424616195, 0.31250985394318764,
                                      0.33233969929404750, 0.31943623242746305, 0.30087465690833698,
                                      0.34735700022470384, 0.30668162743141308),
                            "mu2" = c(0.00035479944687040401, 0.00030112432583612289, 0.00036743684029218567,
                                      0.00035397046799833057, 0.00032002168891992407, 0.00034128043378775676,
                                      0.00037674958921107891, 0.00038627231902020956, 0.00040931289728414287,
                                      0.00056602660980004799, 0.00066626875334050253),
                            "mu3" = c(4.1275021107668783e-07, 3.3440851995405346e-07, 3.9737026165962618e-07,
                                      3.7572652921099151e-07, 3.4202859902281848e-07, 3.7269971815843400e-07, 
                                      4.2709388397541646e-07, 4.6709261284294689e-07, 5.5683336577656766e-07,
                                      9.2235401271452522e-07, 1.4474752054626592e-06))

Post_Mom_DV_B <- data.frame("mu1" = c(0.057677925327730382, 0.062264534435479600, 0.055298745323236607,
                                      0.085754792486900738, 0.088634103433689507, 0.096277075083884112,
                                      0.121752208714958496, 0.118029531084653083, 0.128484697265823455,
                                      0.126461269485168920, 0.224213892002201626),
                            "mu2" = c(1.4425707263504144e-05, 1.5049261296524442e-05, 1.4248734416361247e-05,
                                      2.3751926156013938e-05, 2.6308389774143882e-05, 3.1145488611140806e-05,
                                      4.2890856732326234e-05, 4.8436657512372817e-05, 6.7212956753974338e-05,
                                      9.8347231162825859e-05, 4.3110326195249768e-04),
                            "mu3" = c(3.6079839708150089e-09, 3.6373879227468450e-09, 3.6714473589093438e-09,
                                      6.5786876716763675e-09, 7.8088607623372401e-09, 1.0075518600679607e-08,
                                      1.5109587009955554e-08, 1.9877311799944599e-08, 3.5160463866487921e-08,
                                      7.6483321073481998e-08, 8.2889610811563311e-07))


# Determine the equivalent single discount rate
# The curve to be applied is EIOPA's RFR + VA as at 31 December 2017
# Read and store the curve into a variable Data_RFR
# Determine the cash flows for each case: RBNS, IBNR and CBNI
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
