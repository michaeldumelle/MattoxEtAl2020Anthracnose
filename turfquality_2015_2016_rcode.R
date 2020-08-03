#dunns test results

#loading required packages
library(tidyverse)
library(dunn.test)

#reading in 2015 data
turf2015 <- read.csv("C:/Users/PC2/Google Drive/non_thesis_research/horticulture_alec_clint/6_6_meeting_materials/turf_quality_2015_data.csv", stringsAsFactors = F)

#subsetting in the 2015 data (for somem reason R is reading in 16 blank NA elements)
turf2015 <- turf2015 %>% .[complete.cases(.) == T, ]

#adding treatment index that goes 1 - 16 in the order you have in the paper
turf2015$newtrt <- group_indices(turf2015, Aerified, Trt)
turf2015 %>% select(Aerified, Trt, newtrt) %>% distinct(.)


#now we can perform the KW / Dunn's test for each month

#march - pointless because they all have the same value
#we get an error for this reason
k2015_mar <- dunn.test(x = turf2015$mar, g =  turf2015$Trt) 

#april - using the holm correction
k2015_avr <- dunn.test(x = turf2015$avr, g =  turf2015$newtrt, method = "holm") 

#may
k2015_mai <- dunn.test(x = turf2015$mai, g =  turf2015$newtrt, method = "holm")

#june
k2015_jun <- dunn.test(x = turf2015$jun, g =  turf2015$newtrt, method = "holm")

#july
k2015_jul <- dunn.test(x = turf2015$jul, g =  turf2015$newtrt, method = "holm")

#aug
k2015_aug <- dunn.test(x = turf2015$aug, g =  turf2015$newtrt, method = "holm")

#sep
k2015_sep <- dunn.test(x = turf2015$sep, g =  turf2015$newtrt, method = "holm")

#binding all of these results together in a data frame
dunns_df2015 <- bind_rows(as.data.frame(k2015_avr[c("P.adjusted", "comparisons")]) %>% mutate(month = "avr"),
           as.data.frame(k2015_mai[c("P.adjusted", "comparisons")]) %>% mutate(month = "mai"),
           as.data.frame(k2015_jun[c("P.adjusted", "comparisons")]) %>% mutate(month = "jun"),
           as.data.frame(k2015_jul[c("P.adjusted", "comparisons")]) %>% mutate(month = "jul"),
           as.data.frame(k2015_aug[c("P.adjusted", "comparisons")]) %>% mutate(month = "aug"),
           as.data.frame(k2015_sep[c("P.adjusted", "comparisons")]) %>% mutate(month = "sep"))

#use .025 because default dunns test default only rejects Z>|z| not |Z| > |z|)
#looking at the significant pairwise comparisons (controlled within test)
dunns_df2015[dunns_df2015$P.adjusted < .025, ]
#if we want to control FWER across and within tests, we need to do another holm correction to the p-values
bon_correct <- 1
dunns_df2015[dunns_df2015$P.adjusted < .025 / bon_correct, ]


# dunns_df2015$P.adjusted = 2 * dunns_df2015$P.adjusted
# dunns_df2015 <- dunns_df2015 %>% mutate(trt1 = str_sub(comparisons, 1, 2), trt2 = str_sub(comparisons, -2, -1)) %>% select(-comparisons)
# write_csv(dunns_df2015[dunns_df2015$P.adjusted < .05 / bon_correct, ], "C:/Users/PC2/Google Drive/non_thesis_research/horticulture_alec_clint/holm_dunns_aud_2015.csv")




#reading in 2016 data
turf2016 <- read.csv("C:/Users/PC2/Google Drive/non_thesis_research/horticulture_alec_clint/6_6_meeting_materials/turf_quality_2016_data.csv", stringsAsFactors = F)

#subsetting in the 2016 data (for somem reason R is reading in 16 blank NA elements)
turf2016 <- turf2016 %>% .[complete.cases(.) == T, ]

#adding treatment index that goes 1 - 16 in the order you have in the paper
turf2016$newtrt <- group_indices(turf2016, Aerified, Trt)
turf2016 %>% select(Aerified, Trt, newtrt) %>% distinct(.)


#now we can perform the KW / Dunn's test for each month

#march - using the holm correction
k2016_mar <- dunn.test(x = turf2016$mar, g =  turf2016$newtrt, method = "holm") 

#april - using the holm correction
k2016_avr <- dunn.test(x = turf2016$avr, g =  turf2016$newtrt, method = "holm") 

#may
k2016_mai <- dunn.test(x = turf2016$mai, g =  turf2016$newtrt, method = "holm")

#june
k2016_jun <- dunn.test(x = turf2016$jun, g =  turf2016$newtrt, method = "holm")

#july
k2016_jul <- dunn.test(x = turf2016$jul, g =  turf2016$newtrt, method = "holm")

#aug
k2016_aug <- dunn.test(x = turf2016$aug, g =  turf2016$newtrt, method = "holm")

#sep
k2016_sep <- dunn.test(x = turf2016$sep, g =  turf2016$newtrt, method = "holm")

#binding all of these results together in a data frame
dunns_df2016 <- bind_rows(as.data.frame(k2016_mar[c("P.adjusted", "comparisons")]) %>% mutate(month = "mar"),
                          as.data.frame(k2016_mai[c("P.adjusted", "comparisons")]) %>% mutate(month = "mai"),
                          as.data.frame(k2016_jun[c("P.adjusted", "comparisons")]) %>% mutate(month = "jun"),
                          as.data.frame(k2016_jul[c("P.adjusted", "comparisons")]) %>% mutate(month = "jul"),
                          as.data.frame(k2016_aug[c("P.adjusted", "comparisons")]) %>% mutate(month = "aug"),
                          as.data.frame(k2016_sep[c("P.adjusted", "comparisons")]) %>% mutate(month = "sep"))

#looking at the significant pairwise comparisons (controlled within test)
dunns_df2016[dunns_df2016$P.adjusted < .025, ]
#if we want to control FWER across and within tests, we need to do another holm correction to the p-values
bon_correct <- 1
dunns_df2016[dunns_df2016$P.adjusted < .025 / bon_correct, ]

# dunns_df2016$P.adjusted = 2 * dunns_df2016$P.adjusted
# dunns_df2016 <- dunns_df2016 %>% mutate(trt1 = str_sub(comparisons, 1, 2), trt2 = str_sub(comparisons, -2, -1)) %>% select(-comparisons)
# write_csv(dunns_df2016[dunns_df2016$P.adjusted < .05 / bon_correct, ], "C:/Users/PC2/Google Drive/non_thesis_research/horticulture_alec_clint/holm_dunns_aud_2016.csv")



turf_index2015 = turf2015 %>% select(Aerified, Trt, newtrt) %>% distinct(.) %>% rename("Index" = newtrt) %>% mutate(year = "2015")
turf_index2016 = turf2016 %>% select(Aerified, Trt, newtrt) %>% distinct(.) %>% rename("Index" = newtrt) %>% mutate(year = "2016")
turf_index = bind_rows(turf_index2015, turf_index2016)
# write_csv(turf_index, "C:/Users/PC2/Google Drive/non_thesis_research/horticulture_alec_clint/turf_index.csv")
