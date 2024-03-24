# SURV675 S2024 Assignment 1


## Contents

- [Description](#description)
- [Repo Contents](#repo-contents)
- [Main findings](#main-findings)
- [Session Info](#session-info)



### Description

In this project we aim to investigate the trend of COVID-19 cases over the past few years. All data are downloaded from [JHU CSSE COVID-19 Dataset](https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data).


### Repo Contents 

- [code](./code): `R` code to reproduce the graphs.
- [data](./data): downloaded and processed data.
- [figures](./figures): output graphs.


### Main findings 

![Alt text](./figures/fig1.jpeg)
We can see that overall the number of cases has been increasing since 2020.

![Alt text](./figures/fig2.jpeg)
The trends in different countries are consistent with the overall trend.

![Alt text](./figures/fig3.jpeg)
That being said, the change in incident rates differs among different countries.


### Session Info


```
sessionInfo()

R version 4.3.2 (2023-10-31 ucrt)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 10 x64 (build 19045)

Matrix products: default


locale:
[1] LC_COLLATE=English_United States.utf8  LC_CTYPE=English_United States.utf8    LC_MONETARY=English_United States.utf8 LC_NUMERIC=C                          
[5] LC_TIME=English_United States.utf8    

time zone: America/New_York
tzcode source: internal

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

loaded via a namespace (and not attached):
 [1] utf8_1.2.4        R6_2.5.1          tidyselect_1.2.0  magrittr_2.0.3    gtable_0.3.4      glue_1.7.0        tibble_3.2.1      pkgconfig_2.0.3  
 [9] generics_0.1.3    dplyr_1.1.4       lifecycle_1.0.4   ggplot2_3.5.0     cli_3.6.2         fansi_1.0.6       scales_1.3.0      grid_4.3.2       
[17] vctrs_0.6.5       compiler_4.3.2    rstudioapi_0.15.0 tools_4.3.2       munsell_0.5.0     pillar_1.9.0      colorspace_2.1-0  rlang_1.1.3

```





