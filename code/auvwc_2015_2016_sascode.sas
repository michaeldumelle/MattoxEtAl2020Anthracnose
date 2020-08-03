
filename auv 'anthracnose_auvwc_2015_data.csv';
data auv;
	infile auv firstobs=2 dlm=',';
	input block trt cored $ audpc response month;
run;

proc print data=auv;
run;

ods graphics on;
proc mixed data = auv;
	class trt cored block month;
	model response = trt|cored|month block / ddfm=sat residual;
	random  block*cored block*trt block*trt*cored;
	repeated month / subject = block*trt*cored type = arh(1) R Rcorr;
	*because cored is not significant, remove it from pairwise comparisons;
	lsmeans trt*month / diff; *adjust = bon; 
	run;
ods graphics off;

*can add the line below right upder the repeated statement above to get
*all pairwise comparisons with a bonferroni adjustment
*lsmeans cored*trt*month / diff adjust = Bon; 

filename auv2 'anthracnose_auvwc_2016_data.csv';
data auv2;
	infile auv2 firstobs=2 dlm=',';
	input block trt cored $ audpc response month;
run;

proc print data=auv2;
run;

ods graphics on;
proc mixed data = auv2;
	class trt cored block month;
	model response = trt|cored|month block / ddfm=sat residual;
	random  block*cored block*trt block*trt*cored;
	repeated month / subject = block*trt*cored type = arh(1) R Rcorr;
	*because cored is not significant, remove it from pairwise comparisons;
	lsmeans trt*month/ diff; *adjust = bon; 
	run;
ods graphics off;

*can add the line below right upder the repeated statement above to get
*all pairwise comparisons with a bonferroni adjustment
*lsmeans cored*trt*month / diff adjust = Bon;



