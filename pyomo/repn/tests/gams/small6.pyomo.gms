$offlisting
$offdigit

EQUATIONS
	c1
	c2
	c3
	c4
	c5
	c6
	c7;

VARIABLES
	GAMS_OBJECTIVE
	x1
	x2
	x3;


c1.. 1/2*x1*(x2 - x3) =e= 2 ;
c2.. x1/2*(x2 - x3) =e= 2 ;
c3.. x1*(x2 - x3)/2 =e= 2 ;
c4.. x1*(x2/2 - x3/2) =e= 2 ;
c5.. x1*(x2 - x3)*(1/2) =e= 2 ;
c6.. x1*(x2 - x3) - 4 =e= 0 ;
c7.. GAMS_OBJECTIVE =e= x2 ;

x1.lo = -1;
x1.up = 1;
x1.l = 3;
x2.lo = -1;
x2.up = 1;
x2.l = 1;
x3.lo = -1;
x3.up = 1;
x3.l = 2;

MODEL GAMS_MODEL /all/ ;
option solprint=off;
option limrow=0;
option limcol=0;
option solvelink=5;
SOLVE GAMS_MODEL USING nlp minimizing GAMS_OBJECTIVE;

Scalars MODELSTAT 'model status', SOLVESTAT 'solve status';
MODELSTAT = GAMS_MODEL.modelstat;
SOLVESTAT = GAMS_MODEL.solvestat;

Scalar OBJEST 'best objective', OBJVAL 'objective value';
OBJEST = GAMS_MODEL.objest;
OBJVAL = GAMS_MODEL.objval;

Scalar NUMVAR 'number of variables';
NUMVAR = GAMS_MODEL.numvar

Scalar NUMEQU 'number of equations';
NUMEQU = GAMS_MODEL.numequ

Scalar NUMDVAR 'number of discrete variables';
NUMDVAR = GAMS_MODEL.numdvar

Scalar NUMNZ 'number of nonzeros';
NUMNZ = GAMS_MODEL.numnz

Scalar ETSOLVE 'time to execute solve statement';
ETSOLVE = GAMS_MODEL.etsolve

