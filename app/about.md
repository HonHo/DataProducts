## Predictive Model Exploration Tool 

This Shiny App allows users to explore various statistics of several predictive models applied on Car Evaluation Data Set, compare the accuracy level of the models derived from training data set with between 60% and 90% of the sample data set, and at the end the most suitable predictive model can be selected for prediction.

This application provides an user interface to choose one of the four predictive models, and training data set in percentage of the sample data set. The statistics, training data set, and accuracy line chart are then updated on the respective pages for the selected parameters.

### Data Set Information

- Number of Instances: 1728 (instances completely cover the attribute space) 
- Class Values: unacc, acc, good, vgood 
- Class Distribution (Number of instances per class)
    + unacc: 1210 (70.023%) 
    + acc: 384 (22.222%) 
    + good: 69 (3.993%) 
    + vgood: 65 (3.762%) 
- Number of Attributes: 6 
- Attribute Values:
    + buying: v-high, high, med, low
    + maint: v-high, high, med, low
    + doors: 2, 3, 4, 5-more
    + persons: 2, 4, more
    + lug_boot: small, med, big
    + safety: low, med, high
- Missuing Attribute Values: None 

For more information of the Car Evaluation Data Set, please visit: https://archive.ics.uci.edu/ml/datasets/Car+Evaluation

Author: Hon Yung (Ken) Ho
