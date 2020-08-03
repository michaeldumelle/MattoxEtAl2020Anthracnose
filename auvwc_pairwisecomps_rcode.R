library(readr)
library(tidyverse)
comps_2015 <- read_csv("C:/Users/dumellem/Desktop/auv_review_pairwise_comps_2015.csv") %>% filter
head(comps_2015)
comps_sub <- comps_2015 %>% filter(month == `_month`)
comps_sub$pvalues = 2 * pt(abs(comps_sub$t), df = comps_sub$DF, lower.tail = F)


#separate by months

#month = 1
comps_sub_april <- comps_sub %>% filter(month == 1)
comps_sub_april$pvalues_adj = p.adjust(comps_sub_april$pvalues, method = "holm")
comps_sub_april_2 = comps_sub_april %>% filter(comps_sub_april$pvalues_adj < 1 * .05)
comps_sub_april_2

#month = 2
comps_sub_may <- comps_sub %>% filter(month == 2)
comps_sub_may$pvalues_adj = p.adjust(comps_sub_may$pvalues, method = "holm")
comps_sub_may_2 = comps_sub_may %>% filter(comps_sub_may$pvalues_adj < 1 * .05)
comps_sub_may_2

#month = 3
comps_sub_june <- comps_sub %>% filter(month == 3)
comps_sub_june$pvalues_adj = p.adjust(comps_sub_june$pvalues, method = "holm")
comps_sub_june_2 = comps_sub_june %>% filter(comps_sub_june$pvalues_adj < 1 * .05)
comps_sub_june_2

#month = 4
comps_sub_july <- comps_sub %>% filter(month == 4)
comps_sub_july$pvalues_adj = p.adjust(comps_sub_july$pvalues, method = "holm")
comps_sub_july_2 = comps_sub_july %>% filter(comps_sub_july$pvalues_adj < 1 * .05)
comps_sub_july_2

#month = 5
comps_sub_august <- comps_sub %>% filter(month == 5)
comps_sub_august$pvalues_adj = p.adjust(comps_sub_august$pvalues, method = "holm")
comps_sub_august_2 = comps_sub_august %>% filter(comps_sub_august$pvalues_adj < 1 * .05)
comps_sub_august_2


#month = 6
comps_sub_september <- comps_sub %>% filter(month == 6)
comps_sub_september$pvalues_adj = p.adjust(comps_sub_september$pvalues, method = "holm")
comps_sub_september_2 = comps_sub_september %>% filter(comps_sub_september$pvalues_adj < 1 * .05)
comps_sub_september_2


#final df
comps_2015_adj = bind_rows(comps_sub_april_2, comps_sub_may_2, comps_sub_june_2,
                           comps_sub_july_2, comps_sub_august_2, comps_sub_september_2)

comps_2015_adj %>% filter(pvalues_adj < .05)

write_csv(comps_2015_adj %>% filter(pvalues_adj < .05), "C:/Users/dumellem/Desktop/auv_review_pcomps_sub_2015.csv")





comps_2016 <- read_csv("C:/Users/dumellem/Desktop/auv_review_pairwise_comps_2016.csv") %>% filter
head(comps_2016)
comps_sub <- comps_2016 %>% filter(month == `_month`)
comps_sub$pvalues = 2 * pt(abs(comps_sub$t), df = comps_sub$DF, lower.tail = F)


#separate by months

#month = 1
comps_sub_april <- comps_sub %>% filter(month == 1)
comps_sub_april$pvalues_adj = p.adjust(comps_sub_april$pvalues, method = "holm")
comps_sub_april_2 = comps_sub_april %>% filter(comps_sub_april$pvalues_adj < 1 * .05)
comps_sub_april_2

#month = 2
comps_sub_may <- comps_sub %>% filter(month == 2)
comps_sub_may$pvalues_adj = p.adjust(comps_sub_may$pvalues, method = "holm")
comps_sub_may_2 = comps_sub_may %>% filter(comps_sub_may$pvalues_adj < 1 * .05)
comps_sub_may_2

#month = 3
comps_sub_june <- comps_sub %>% filter(month == 3)
comps_sub_june$pvalues_adj = p.adjust(comps_sub_june$pvalues, method = "holm")
comps_sub_june_2 = comps_sub_june %>% filter(comps_sub_june$pvalues_adj < 1 * .05)
comps_sub_june_2

#month = 4
comps_sub_july <- comps_sub %>% filter(month == 4)
comps_sub_july$pvalues_adj = p.adjust(comps_sub_july$pvalues, method = "holm")
comps_sub_july_2 = comps_sub_july %>% filter(comps_sub_july$pvalues_adj < 1 * .05)
comps_sub_july_2

#month = 5
comps_sub_august <- comps_sub %>% filter(month == 5)
comps_sub_august$pvalues_adj = p.adjust(comps_sub_august$pvalues, method = "holm")
comps_sub_august_2 = comps_sub_august %>% filter(comps_sub_august$pvalues_adj < 1 * .05)
comps_sub_august_2


#month = 6
comps_sub_september <- comps_sub %>% filter(month == 6)
comps_sub_september$pvalues_adj = p.adjust(comps_sub_september$pvalues, method = "holm")
comps_sub_september_2 = comps_sub_september %>% filter(comps_sub_september$pvalues_adj < 1 * .05)
comps_sub_september_2


#final df
comps_2016_adj = bind_rows(comps_sub_april_2, comps_sub_may_2, comps_sub_june_2,
                           comps_sub_july_2, comps_sub_august_2, comps_sub_september_2)

comps_2016_adj %>% filter(pvalues_adj < .05)

write_csv(comps_2016_adj %>% filter(pvalues_adj < .05), "C:/Users/dumellem/Desktop/auv_review_pcomps_sub_2016.csv")





