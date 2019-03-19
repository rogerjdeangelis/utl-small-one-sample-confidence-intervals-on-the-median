Small one sample confidence intervals on the median                                                                                                 
                                                                                                                                                    
Not as simple as you might think.                                                                                                                   
                                                                                                                                                    
Bootstrap is rarely used for small samples?                                                                                                         
                                                                                                                                                    
github                                                                                                                                              
http://tinyurl.com/yxfzz34n                                                                                                                         
https://github.com/rogerjdeangelis/utl-small-one-sample-confidence-intervals-on-the-median                                                          
                                                                                                                                                    
SAS Doc                                                                                                                                             
This is SAS bread and butter?                                                                                                                       
http://tinyurl.com/y4p44w2a                                                                                                                         
http://support.sas.com/documentation/cdl/en/procstat/63963/HTML/default/viewer.htm#procstat_univariate_sect028.htm#procstat.univariate.clpctl       
                                                                                                                                                    
SAS Forum                                                                                                                                           
http://tinyurl.com/y3ohchua                                                                                                                         
https://communities.sas.com/t5/SAS-Enterprise-Guide/Computing-confidence-interval-for-median/td-p/392456                                            
                                                                                                                                                    
*_                   _                                                                                                                              
(_)_ __  _ __  _   _| |_                                                                                                                            
| | '_ \| '_ \| | | | __|                                                                                                                           
| | | | | |_) | |_| | |_                                                                                                                            
|_|_| |_| .__/ \__,_|\__|                                                                                                                           
        |_|                                                                                                                                         
;                                                                                                                                                   
                                                                                                                                                    
                                                                                                                                                    
data have;                                                                                                                                          
  call streaminit(1234);                                                                                                                            
  format date date9.;                                                                                                                               
  do date=today()-29 to today();                                                                                                                    
    z=rand('normal',5,1);                                                                                                                           
    output;                                                                                                                                         
  end;                                                                                                                                              
run;quit;  

HAVE total obs=30

Obs      DATE          Z

  1    18FEB2019    5.86503
  2    19FEB2019    5.81118
  3    20FEB2019    3.95564
  4    21FEB2019    3.94351
  5    22FEB2019    3.25105
  6    23FEB2019    5.56657
                                                                                                                                                    
                                                                                                                                  
 *           _               _                                                                                                                      
  ___  _   _| |_ _ __  _   _| |_                                                                                                                    
 / _ \| | | | __| '_ \| | | | __|                                                                                                                   
| (_) | |_| | |_| |_) | |_| | |_                                                                                                                    
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                                                                   
                |_|                                                                                                                                 
;                                                                                                                                                   
                                                                                                                                                    
          95% Confidence Intervals on Median under three Conditions                                                                                 
          ---------------------------------------------------------                                                                                 
                                                                                                                                                    
             4.25    4.50    4.75    5.00    5.25    5.50                                                                                           
              +--------+-------+-------+-------+-------+----+                                                                                       
              |                                             |                                                                                       
              |           NICE DISTRIBUTION FREE            |                                                                                       
         Nice |                                             |                                                                                       
 Distribition +      L----------------------M---------U     +                                                                                       
         Free |                                             |                                                                                       
              |                                             |                                                                                       
              |        ASYMETRIC DISTRIBUTION FREE**        |                                                                                       
    Asymetric |                                             |                                                                                       
 Distribition +      L----------------------M---------U     +                                                                                       
         Free |                                             |                                                                                       
              |                                             |                                                                                       
              |               ASSUME NORMALITY              |                                                                                       
       Assume |                                             |                                                                                       
    Normality +            L----------------M----U          +                                                                                       
              |                                             |                                                                                       
              |                                             |                                                                                       
              +--------+-------+-------+-------+-------+----+                                                                                       
             4.25    4.50    4.75    5.00    5.25    5.50                                                                                           
                                                                                                                                                    
                                                                                                                                                    
 *         _       _   _                                                                                                                            
 ___  ___ | |_   _| |_(_) ___  _ __  ___                                                                                                            
/ __|/ _ \| | | | | __| |/ _ \| '_ \/ __|                                                                                                           
\__ \ (_) | | |_| | |_| | (_) | | | \__ \                                                                                                           
|___/\___/|_|\__,_|\__|_|\___/|_| |_|___/                                                                                                           
                                                                                                                                                    
;                                                                                                                                                   
                                                                                                                                                    
  ** symetry requirement satisfied                                                                                                                  
                                                                                                                                                    
*         _ _   _                                        _ _ _                                                                                      
__      _(_) |_| |__    _ __   ___  _ __ _ __ ___   __ _| (_) |_ _   _                                                                              
\ \ /\ / / | __| '_ \  | '_ \ / _ \| '__| '_ ` _ \ / _` | | | __| | | |                                                                             
 \ V  V /| | |_| | | | | | | | (_) | |  | | | | | | (_| | | | |_| |_| |                                                                             
  \_/\_/ |_|\__|_| |_| |_| |_|\___/|_|  |_| |_| |_|\__,_|_|_|\__|\__, |                                                                             
                                                                 |___/                                                                              
;                                                                                                                                                   
title 'Assume Normality';                                                                                                                           
ods select Quantiles;                                                                                                                               
proc univariate data=have ciquantnormal(alpha=.05);                                                                                                 
   var z;                                                                                                                                           
run;                                                                                                                                                
                                                                                                                                                    
Assume Normality                                                                                                                                    
-----------------                                                                                                                                   
                                                                                                                                                    
The UNIVARIATE Procedure                                                                                                                            
Variable:  Z                                                                                                                                        
                                                                                                                                                    
           Quantiles (Definition 5)                                                                                                                 
                                                                                                                                                    
                          95% Confidence Limits                                                                                                     
Level         Quantile      Assuming Normality                                                                                                      
                                                                                                                                                    
50% Median     5.14948    4.633852     5.325591                                                                                                     
                                                                                                                                                    
*      _                _ _     _      __                                                                                                           
 _ __ (_) ___ ___    __| (_)___| |_   / _|_ __ ___  ___                                                                                             
| '_ \| |/ __/ _ \  / _` | / __| __| | |_| '__/ _ \/ _ \                                                                                            
| | | | | (_|  __/ | (_| | \__ \ |_  |  _| | |  __/  __/                                                                                            
|_| |_|_|\___\___|  \__,_|_|___/\__| |_| |_|  \___|\___|                                                                                            
                                                                                                                                                    
;                                                                                                                                                   
                                                                                                                                                    
Nice distrobution free                                                                                                                              
-----------------------                                                                                                                             
                                                                                                                                                    
title 'Distribution Free';                                                                                                                          
ods select Quantiles;                                                                                                                               
proc univariate data=have ciquantdf(alpha=.05); ;                                                                                                   
   var z;                                                                                                                                           
run;                                                                                                                                                
                                                                                                                                                    
                            Quantiles (Definition 5)                                                                                                
                                                                                                                                                    
                          95% Confidence Limits                                                                                                     
Level         Quantile      Distribution Free                                                                                                       
                                                                                                                                                    
50% Median     5.14948     4.44496      5.45391                                                                                                     
                                                                                                                                                    
*                               _        _                                                                                                          
  __ _ ___ _   _ _ __ ___   ___| |_ _ __(_) ___                                                                                                     
 / _` / __| | | | '_ ` _ \ / _ \ __| '__| |/ __|                                                                                                    
| (_| \__ \ |_| | | | | | |  __/ |_| |  | | (__                                                                                                     
 \__,_|___/\__, |_| |_| |_|\___|\__|_|  |_|\___|                                                                                                    
           |___/                                                                                                                                    
;                                                                                                                                                   
                                                                                                                                                    
Relax the symetry requirement;                                                                                                                      
------------------------------                                                                                                                      
                                                                                                                                                    
This option requests symmetric limits when the coverage requirement can be met, and asymmetric limits otherwise;                                    
Note the result is the same as nice distribution free because the symetry requiremnet is satisfies.                                                 
                                                                                                                                                    
title 'Distribution Free Asymetric';                                                                                                                
ods select Quantiles;                                                                                                                               
proc univariate data=have CIPCTLDF(TYPE =ASYMETRIC alpha=.05); ;                                                                                    
   var z;                                                                                                                                           
run;                                                                                                                                                
                                                                                                                                                    
                            Quantiles (Definition 5)                                                                                                
                                                                                                                                                    
                          95% Confidence Limits                                                                                                     
Level         Quantile      Distribution Free                                                                                                       
                                                                                                                                                    
50% Median     5.14948     4.44496      5.45391                                                                                                     
                                                                                                                                                    
                                                                                                                                                    
                                                                                                                                                    
data plt;                                                                                                                                           
input des$ ltr$ val;                                                                                                                                
cards4;                                                                                                                                             
NrmLow N 5.14948                                                                                                                                    
NrmMed N 4.44496                                                                                                                                    
NrmUpr N 5.45391                                                                                                                                    
NonPar P 5.14948                                                                                                                                    
NonPar P 4.44496                                                                                                                                    
NONPAR P 5.45391                                                                                                                                    
AsmTrc A 5.14948                                                                                                                                    
AsmTrc A 4.63385                                                                                                                                    
AsmTrc A 5.32559                                                                                                                                    
;;;;                                                                                                                                                
run;quit;                                                                                                                                           
                                                                                                                                                    
options ls=64 ps=24;                                                                                                                                
proc plot data=plt(rename=ltr=a1111111111111111111);                                                                                                
 plot a1111111111111111111*val='*';                                                                                                                 
run;quit;                                                                                                                                           
                                                                                                                                                    
* You need to use the excellent                                                                                                                     
                                                                                                                                                    
          95% Confidence Intervals on Median under three Conditions                                                                                 
          ---------------------------------------------------------                                                                                 
                                                                                                                                                    
             4.25    4.50    4.75    5.00    5.25    5.50                                                                                           
              +--------+-------+-------+-------+-------+----+                                                                                       
              |                                             |                                                                                       
              |           NICE DISTRIBUTION FREE            |                                                                                       
         Nice |                                             |                                                                                       
 Distribition +      L----------------------M---------U     +                                                                                       
         Free |                                             |                                                                                       
              |                                             |                                                                                       
              |        ASYMETRIC DISTRIBUTION FREE          |                                                                                       
    Asymetric |                                             |                                                                                       
 Distribition +      L----------------------M---------U     +                                                                                       
         Free |                                             |                                                                                       
              |                                             |                                                                                       
              |                                             |                                                                                       
       Assume |                                             |                                                                                       
    Normality +            L----------------M----U          +                                                                                       
              |                                             |                                                                                       
              |                                             |                                                                                       
              +--------+-------+-------+-------+-------+----+                                                                                       
             4.25    4.50    4.75    5.00    5.25    5.50                                                                                           
                                                                                                                                                    
                                  VAL                                                                                                               
                                                                                                                                                    
