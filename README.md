# IE 7275: Data Mining in Engiineering - Final Project

# Title: Patient-Mortality-Prediction-using-MIMIC-III-dataset-in-R
### Contributed By:
#### 1. Sumedh Kulkarni
#### 2. Akshat Karambe
#### 3. Manish Lumada
#### 4. Prajwal Parlawar

The MIMIC-III dataset is a real world dataset of Massachussets General Hospital provided to our group by Professor Chun-Ann Chou. This dataset belongs to the healthcare industry.

![image](https://user-images.githubusercontent.com/35174083/55694007-0f5dc400-5980-11e9-95c2-6a3d7eeed8e9.png)


## Data
As this is an official dataset we cannot provide the data on public platforms.

## Analysis Performed
### Objective
Using R predict whether a patient who is inside the ICU will die or not. It was a classical classification problem.

### Approach
Deploy Machine Learning classification techniques like SVM, Logistic Regression, Naive Bayes to predict the occurence of an event given some target labels. We will extensively use R programing for this purpose.

### Steps
1. The data provided to us was in the form of 4000 text files. So firstly combine the data from 4000 text files into one comma seperated value file and load it into a dataframe.
2. Perform the pre-processing and EDA
3. Split the data into three types:min, max and mean. Which is to fill the null values in the dataset.
4. Perform predictive analysis using the Machine Learning algorithms mentioned above. 
5. Plot the accuracy graphs of different techniques.

### Insight
Here is a snap of the SVM code:

![image](https://user-images.githubusercontent.com/35174083/55753807-374d3600-5a19-11e9-97d6-6dd43f00f9a7.png)


### Conclusion
1. Accuracy with SVM is 88.8%
2. Accuracy with Logistic Regression is 90%
Hence it can be seen that Logistic Regression performs better than SVM in this case.
