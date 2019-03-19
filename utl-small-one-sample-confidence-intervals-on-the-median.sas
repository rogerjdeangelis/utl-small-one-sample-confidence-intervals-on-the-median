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
                                                                                                                                                   
options ls=64;                                                                                                                                     
ods graphivs off;                                                                                                                                  
proc univariate data=have plot normal;                                                                                                             
run;quit;                                                                                                                                          
                                                                                                                                                   
                                                                                                                                                   
   Stem Leaf                     #  Boxplot                      Normal Probability Plot                                                           
      7 6                        1     0      7.75+                                             *                                                  
      7                                           |                                               ++++                                             
      6                                           |                                          +++++                                                 
      6                                       6.25+                                     +++++                                                      
      5 566678899                9  +-----+       |                               *****+* * *                                                      
      5 0123334                  7  *--+--*       |                         ******                                                                 
      4 799                      3  |     |   4.75+                    +****+                                                                      
      4 003444                   6  +-----+       |               +*****                                                                           
      3 59                       2     |          |          +*+*+*                                                                                
      3 23                       2     |      3.25+    +*+++*                                                                                      
        ----+----+----+----+                       +----+----+----+----+----+----+----+----+----+----+                                             
                                                       -2        -1         0        +1        +2                                                  
                                                                                                                                                   
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
                                                                                                                                                   
                          95% Confidence Limits    ---                                                                                             
Level         Quantile      Distribution Free      LCL                                                                                             
                                                                                                                                                   
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
                                                                                                                                                   
                                                                                                                                                   
