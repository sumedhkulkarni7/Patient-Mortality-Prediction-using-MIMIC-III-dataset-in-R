#Data Cleaning 

#Importing the Data

Data_Min <- read.csv(file="E:/Spring 2018/Data Mining/Project/Final Datasets/new_data_min.csv", header=TRUE, sep=",")

options(max.print=1000000)

str(Data_Min)

names(Data_Min)


#Data Cleaning

# Removing generic parameters like "Age"     "Gender"  "Height"  "ICUType" "RecordID" "Weight" 
Col_Clean <- Data_Min[,c(-5, -14, -19, -20,-33,-42)]

Col_Clean_Names <- Data_Min[,c(5, 14, 19,33,20,42)] 

names(Col_Clean_Names)

# Removing columns/parameters which have more than 60% null values.

Data_Clean <- Col_Clean[, -which(colMeans(is.na(Col_Clean)) > .6)]

Removed_Col_Names <- Col_Clean[, which(colMeans(is.na(Col_Clean)) > .6)]

names(Removed_Col_Names)

# Removed ("Cholesterol" "RespRate"    "TroponinI"   "TroponinT" )


# Removing Rows which have more than 70% of null values. ie the records which have less than or equal to 10 parameters.

Data_Row_Cleaned <- Data_Clean[-which(rowMeans(is.na(Data_Clean)) > 0.68), ]

# 24 rows were removed.

#separating alive and died patients and fill all null values with the mean of the column 

library(dplyr)

alive <- filter(Data_Row_Cleaned,In.hospital_death == '0')

death <- filter(Data_Row_Cleaned,In.hospital_death == '1')

#Getting list of columns having missing values in both "alive" and "died"
mylist_alive <- c(unlist(lapply(alive , function(x) any(is.na(x)))))
View(mylist_alive)
names(mylist_alive)

mylist_died <- c(unlist(lapply(death , function(x) any(is.na(x)))))
View(mylist_died)

# Except for In.hospital_death all the other parameters have null values for both the dataframes.


#Filling missing values with mean values for the obtained columns for Patients alive.

alive$ALP[is.na(alive$ALP)] <- mean(alive$ALP, na.rm = T)

alive$ALT[is.na(alive$ALT)] <- mean(alive$ALT, na.rm = T)

alive$AST[is.na(alive$AST)] <- mean(alive$AST, na.rm = T)

alive$Albumin[is.na(alive$Albumin)] <- mean(alive$Albumin, na.rm = T)

alive$BUN[is.na(alive$BUN)] <- mean(alive$BUN, na.rm = T)

alive$Bilirubin[is.na(alive$Bilirubin)] <- mean(alive$Bilirubin, na.rm = T)

alive$Creatinine[is.na(alive$Creatinine)] <- mean(alive$Creatinine, na.rm = T)

alive$DiasABP[is.na(alive$DiasABP)] <- mean(alive$DiasABP, na.rm = T)

alive$FiO2[is.na(alive$FiO2)] <- mean(alive$FiO2, na.rm = T)

alive$GCS[is.na(alive$GCS)] <- mean(alive$GCS, na.rm = T)

alive$Glucose[is.na(alive$Glucose)] <- mean(alive$Glucose, na.rm = T)

alive$HCO3[is.na(alive$HCO3)] <- mean(alive$HCO3, na.rm = T)

alive$HCT[is.na(alive$HCT)] <- mean(alive$HCT, na.rm = T)

alive$HR[is.na(alive$HR)] <- mean(alive$HR, na.rm = T)

alive$K[is.na(alive$K)] <- mean(alive$K, na.rm = T)

alive$Lactate[is.na(alive$Lactate)] <- mean(alive$Lactate, na.rm = T)

alive$MAP[is.na(alive$MAP)] <- mean(alive$MAP, na.rm = T)

alive$MechVent[is.na(alive$MechVent)] <- mean(alive$MechVent, na.rm = T)

alive$Mg[is.na(alive$Mg)] <- mean(alive$Mg, na.rm = T)

alive$NIDiasABP[is.na(alive$NIDiasABP)] <- mean(alive$NIDiasABP, na.rm = T)

alive$NIMAP[is.na(alive$NIMAP)] <- mean(alive$NIMAP, na.rm = T)

alive$NISysABP[is.na(alive$NISysABP)] <- mean(alive$NISysABP, na.rm = T)

alive$Na[is.na(alive$Na)] <- mean(alive$Na, na.rm = T)

alive$PaCO2[is.na(alive$PaCO2)] <- mean(alive$PaCO2, na.rm = T)

alive$PaO2[is.na(alive$PaO2)] <- mean(alive$PaO2, na.rm = T)

alive$Platelets[is.na(alive$Platelets)] <- mean(alive$Platelets, na.rm = T)

alive$SaO2[is.na(alive$SaO2)] <- mean(alive$SaO2, na.rm = T)

alive$SysABP[is.na(alive$SysABP)] <- mean(alive$SysABP, na.rm = T)

alive$Temp[is.na(alive$Temp)] <- mean(alive$Temp, na.rm = T)


alive$Urine[is.na(alive$Urine)] <- mean(alive$Urine, na.rm = T)

alive$WBC[is.na(alive$WBC)] <- mean(alive$WBC, na.rm = T)

alive$pH[is.na(alive$pH)] <- mean(alive$pH, na.rm = T)

#Filling missing values with mean values for the obtained columns for the Patients who are Died
death$ALP[is.na(death$ALP)] <- mean(death$ALP, na.rm = T)

death$ALT[is.na(death$ALT)] <- mean(death$ALT, na.rm = T)

death$AST[is.na(death$AST)] <- mean(death$AST, na.rm = T)

death$Albumin[is.na(death$Albumin)] <- mean(death$Albumin, na.rm = T)

death$BUN[is.na(death$BUN)] <- mean(death$BUN, na.rm = T)

death$Bilirubin[is.na(death$Bilirubin)] <- mean(death$Bilirubin, na.rm = T)

death$Creatinine[is.na(death$Creatinine)] <- mean(death$Creatinine, na.rm = T)

death$DiasABP[is.na(death$DiasABP)] <- mean(death$DiasABP, na.rm = T)

death$FiO2[is.na(death$FiO2)] <- mean(death$FiO2, na.rm = T)

death$GCS[is.na(death$GCS)] <- mean(death$GCS, na.rm = T)

death$Glucose[is.na(death$Glucose)] <- mean(death$Glucose, na.rm = T)

death$HCO3[is.na(death$HCO3)] <- mean(death$HCO3, na.rm = T)

death$HCT[is.na(death$HCT)] <- mean(death$HCT, na.rm = T)

death$HR[is.na(death$HR)] <- mean(death$HR, na.rm = T)

death$K[is.na(death$K)] <- mean(death$K, na.rm = T)

death$Lactate[is.na(death$Lactate)] <- mean(death$Lactate, na.rm = T)

death$MAP[is.na(death$MAP)] <- mean(death$MAP, na.rm = T)

death$MechVent[is.na(death$MechVent)] <- mean(death$MechVent, na.rm = T)

death$Mg[is.na(death$Mg)] <- mean(death$Mg, na.rm = T)

death$NIDiasABP[is.na(death$NIDiasABP)] <- mean(death$NIDiasABP, na.rm = T)

death$NIMAP[is.na(death$NIMAP)] <- mean(death$NIMAP, na.rm = T)

death$NISysABP[is.na(death$NISysABP)] <- mean(death$NISysABP, na.rm = T)

death$Na[is.na(death$Na)] <- mean(death$Na, na.rm = T)

death$PaCO2[is.na(death$PaCO2)] <- mean(death$PaCO2, na.rm = T)

death$PaO2[is.na(death$PaO2)] <- mean(death$PaO2, na.rm = T)

death$Platelets[is.na(death$Platelets)] <- mean(death$Platelets, na.rm = T)

death$SaO2[is.na(death$SaO2)] <- mean(death$SaO2, na.rm = T)

death$SysABP[is.na(death$SysABP)] <- mean(death$SysABP, na.rm = T)

death$Temp[is.na(death$Temp)] <- mean(death$Temp, na.rm = T)

death$Urine[is.na(death$Urine)] <- mean(death$Urine, na.rm = T)

death$WBC[is.na(death$WBC)] <- mean(death$WBC, na.rm = T)

death$pH[is.na(death$pH)] <- mean(death$pH, na.rm = T)

#All the null values are being replaced by the mean values of their respective columns.

Patient_Alive <- alive[,-19]

Patient_Died <- death[,-19]

Data_Cleaned <- rbind(Patient_Alive,Patient_Died)

Data_Cleaned1 <- Data_Cleaned[,-1]
Data_Cleaned1
str(Data_Cleaned1)

#Performing Dimensionality Reduction on Un-Scaled Data

#Calculating PCA on data

Pca_Data_Cleaned <- prcomp(Data_Cleaned1)
summary(Pca_Data_Cleaned)
plot(Pca_Data_Cleaned)
plot(Pca_Data_Cleaned, type = 'line')

#1 Scaling the data
datacleaned1<- Data_Cleaned1[sapply(Data_Cleaned1,is.numeric)] 

datacleaned1
dim(datacleaned1)
library(factoextra)
cleaneddata <- fviz_eig(Pca_Data_Cleaned, addlabels = TRUE, ylim = c(0, 20),xlim=c(0,11))
cleaneddata

# What to do?

#1.) Scale the data and run the PCA again.
scaling<- scale(datacleaned1)
plot(scaling)
Pca_Data_Cleaned1<- prcomp(scaling,center=TRUE)
summary(Pca_Data_Cleaned1)
plot(Pca_Data_Cleaned1)
plot(Pca_Data_Cleaned1,type='line')
library(factoextra)
cleaneddata1 <- fviz_eig(Pca_Data_Cleaned1, addlabels = TRUE, ylim = c(0, 20),xlim=c(0,11))
cleaneddata1

#2.) After plotting graph and manual observation of PCA Components,we need to choose PCA Components having 95% Variance.
## or using covariances 
eig.val <- get_eigenvalue(Pca_Data_Cleaned1)
eig.val

## we get 99% variances till 27 variables
dim(datacleaned1)
cor(datacleaned1)
covariances<-cor(scaling)
library(corrplot)
corrplot(covariances, order = "hclust")
dim(covariances)
library(caret)
highlyCor <- findCorrelation(covariances, 0.6)

#Apply correlation filter at 0.95,

#then we remove all the variable correlated with more 0.7.
datMyFiltered.scale <- scaling[,-highlyCor]
covariances1 <- cor(datMyFiltered.scale)
corrplot(covariances1, order = "hclust")
dim(datMyFiltered.scale)
str(datMyFiltered.scale)


#Concatenated the final data frame with the In_hospital_Death column .
z <- as.data.frame(datMyFiltered.scale, Header = TRUE)
str(z)

pcaYVar <- data.frame(c(z, Data_Cleaned [c("In.hospital_death")]))

str(pcaYVar)

pcaYVar$In.hospital_death<-as.numeric(pcaYVar$In.hospital_death)

#Divide the data into 70 % traing and 30 % testing
ind = sample(2,nrow(pcaYVar), replace=TRUE, prob=c(0.7, 0.3))
TrainData = pcaYVar[ind==1,]
TestData = pcaYVar[ind==2,]

table(TrainData$In.hospital_death)

table(TestData$In.hospital_death)

#Tuning SVM for finding best parameters for all possible 4 kernels.

obj<-tune(svm, In.hospital_death~.,kernel ="radial", data= TrainData, ranges=list(gamma=10^(-2:2), cost=10^(-2:2)))

summary(obj)

library(e1071)
#Applying SVM with the Kernel 'radial' . 
model1 = svm(In.hospital_death ~ ., kernel = "radial",  type = "C-classification", cost =1 ,gamma=0.01, data = TrainData, scale = F)
summary(model1)

# Predicting the Values using model created using SVM.
predictions <-  predict(model1, TrainData[-27])

str(predictions)
str(TrainData)

accuracy(predictions, TestData$In.hospital_death)


table(pred = predictions, Actual = TrainData$In.hospital_death)

ACCURACY : (2384 + 92)/ (2788) = 88.8

Prediction1 = predict(model1, TestData)

table(pred = Prediction1, Actual = TestData$In.hospital_death)


#Logistic regression
pcaYVar
str(pcaYVar)
Log_regression = glm(In.hospital_death ~.,data=TrainData,family="binomial")
summary(Log_regression)

Log_Pred <- predict(Log_regression, TestData)

library(forecast)
forecast(predictions)
accuracy(forecast(predictions))

accuracy(forecast(predictions), TrainData$In.hospital_death)


data.frame(actual = TestData$In.hospital_death[1:5], predicted = Log_Pred [1:5])

accuracy(Log_Pred, TrainData$In.hospital_death)

accuracy(Log_Pred, TestData$In.hospital_death)

pf <- data.frame((round(Log_Pred)))

log_final <- data.frame(c(TestData$In.hospital_death, pf$X.round.Log_Pred..))

library(ggplot2)

qplot(In.hospital_death, data = TestData, geom = "density")

qplot(In.hospital_death, data = TrainData, geom = "density")

Log_regression = glm(In.hospital_death ~ALT + HR + MAP + Mg + Na + PaCO2 + PaO2 + Platelets + SysABP + Temp,data=pcaYVar,family="binomial")
summary(Log_regression)
