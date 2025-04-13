var hold{a in assets}>=0;
var ifhold{a in assets} binary;
var aveport>=targ;
var portret{t in rtime};
var over{r in rtime}>=0;
var under{r in rtime}>=0;

minimize indtrck:sum{t in intime}(over[t]+under[t])/card(intime);

subject to

must_in: sum{a in rassets}hold[a]=1;

defave: aveport=sum{t in intime}portret[t]/card(intime);

defport{t in intime}:portret[t]=sum{a in rassets}return[a,t]*hold[a];

lowlnk{a in rassets}:hold[a]>=ifhold[a]*mininvest;

uplnk{a in rassets}:hold[a]<=ifhold[a]*maxinvest;

limit: sum{a in rassets}ifhold[a]<=maxstock;

deferr{t in intime}:portret[t]=indret[t]+over[t]-under[t];
