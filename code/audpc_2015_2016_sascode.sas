filename antdata 'anthracnose_audpc_2015_2016_data.csv';
data antdata;
	infile antdata firstobs=2 dlm=',';
	input trt year cored $ block audpc cuberoot;
run;

proc print data=antdata;
run;

data ant1;
	set antdata;
	if year=1;
run;

proc print data=ant1;
run;

proc glm data = ant1;
	class trt;
	model cuberoot = trt;
	means trt / hovtest=BF;
run;

ods graphics on;
proc mixed data = ant1;
	class trt cored block;
	model cuberoot = cored|trt block / ddfm=CON residual;
	random block*cored block*trt;
	lsmeans trt cored / diff adjust = Tukey;
run;
ods graphics off;

data ant2;
	set antdata;
	if year=2;
run;

proc print data=ant2;
run;

proc glm data = ant2;
	class trt;
	model cuberoot = trt;
	means trt / hovtest=BF;
run;

ods graphics on;
proc mixed data = ant2;
	class trt cored block;
	model cuberoot = cored|trt block / residual;
	random block*cored block*trt;
	lsmeans trt cored / diff adjust = Tukey;
run;
ods graphics off;






