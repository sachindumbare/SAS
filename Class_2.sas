libname test "E:\Pune\SAS Training\PUNSAS48\Session_1\Data";

proc import datafile="E:\Pune\SAS Training\PUNSAS48\Session_1\Data\exercise3.13.csv"
out =work.new
dbms=csv
replace;
run;
proc import datafile="E:\Pune\SAS Training\PUNSAS48\Session_1\Data\stocks.csv"
out=work.new1
dbms=csv
replace;
run;

proc import datafile="E:\Pune\SAS Training\PUNSAS48\Session_1\Data\sample_data.xls"
out=work.new2
dbms=xls
replace;
run;

filename excel dde "soffice|E:\Pune\SAS Training\PUNSAS48\Session_1\Data\stocks.xls!stocks.A2:H700" notab;
data test;
infile excel dlm="09"x  missover dsd;
input Stock$	Date$	Open$	High$	Low$	Close$	Volume$	AdjClose$ ;
run;

filename excel1 dde "soffice|E:\Pune\SAS Training\PUNSAS48\Session_1\Data\sample_data.xls!sample_data.A2:C15" notab;
data test1;
length  VT_NUM $20  AT_NUM$20 EVLT_AR1$100;
infile excel1 dlm='09'x  missover dsd;
input VT_NUM$	AT_NUM	EVLT_AR1$;
run;

