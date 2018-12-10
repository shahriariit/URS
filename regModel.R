library(caret)

control <- trainControl(method="repeatedcv", number=10, repeats=10)

rf<-function(x,y){
  set.seed(7)
  return(train(Level~., data=x, method=y, trControl=control))
}

algolist=c("treebag","bayesglm","brnn","glmboost","BstLm","rpart","rpart1SE","rpart2","ctree","ctree2","enet",
           "gaussprLinear","gam","gamSpline","glm","glmStepAIC","glmnet","icr","kknn","knn","svmLinear3","lars",
           "lars2","leapBackward","leapForward","leapSeq","lmStepAIC","mlp","mlpML","earth","gcvEarth","glm.nb",
           "nnet","pcaNNet","rqnc","null","nnls","kernelpls","pls","simpls","penalized","ppr","pcr","rqlasso",
           "relaxo","ridge","foba","rlm","superpc","svmLinear","svmLinear2","svmRadial","svmRadialCost","lasso")

resorList = list()
resddList = list()
resexList = list()
resorddList = list()
resddexList = list()
resorexList = list()
resorddexList = list()

for (i in algolist) 
{
  
   resorList[[length(resorList)+1]]=rf(my_data$original_data,i)
   resddList[[length(resddList)+1]]=rf(my_data$dummy_data,i)
   resexList[[length(resexList)+1]]=rf(my_data$externel_data,i)
   resorddList[[length(resorddList)+1]]=rf(my_data$original_dummy_data,i)
   resddexList[[length(resddexList)+1]]=rf(my_data$dummy_external_data,i)
   resorexList[[length(resorexList)+1]]=rf(my_data$original_external_data,i)
   resorddexList[[length(resorddexList)+1]]=rf(my_data$original_dummy_external_data,i)
}


summarize_res <- function(x){
  modellist=list(TREEBAG=x[[1]],BAYESGLM=x[[2]],BRNN=x[[3]],GLMBOOST=x[[4]],BSTLM=x[[5]],RPART=x[[6]],RPART1SE=x[[7]],
                 RPART2=x[[8]],CTREE=x[[9]],CTREE2=x[[10]],ENET=x[[11]],GAUSSPRLINEAR=x[[12]],GAM=x[[13]],GAMSPLINE=x[[14]],
                 GLM=x[[15]],GLMSTEPAIC=x[[16]],GLMNET=x[[17]],ICR=x[[18]],KKNN=x[[19]],KNN=x[[20]],SVMLINAR3=x[[21]],
                 LARS=x[[22]],LARS2=x[[23]],LEAPBACKWARD=x[[24]],LEAPFORWARD=x[[25]],LEAPSEQ=x[[26]],LMSTEPAIC=x[[27]],
                 MLP=x[[28]],MLPML=x[[29]],EARTH=x[[30]],GCVEARTH=x[[31]],GLM.NB=x[[32]],NNET=x[[33]],PCANNET=x[[34]],
                 RQNC=x[[35]],NULL1=x[[36]],NNLS=x[[37]],KERNELPLS=x[[38]],PLS=x[[39]],SIMPLS=x[[40]],PENALIZED=x[[41]],
                 PPR=x[[42]],PCR=x[[43]],RQLASSO=x[[44]],RELAXO=x[[45]],RIDGE=x[[46]],FOBA=x[[47]],RLM=x[[48]],SUPERPC=x[[49]],
                 SVMLINEAR=x[[50]],SVMLINEAR2=x[[51]],SVMRADIAL=x[[52]],SVMRADIALCOST=x[[53]],LASSO=x[[54]])
  
  summary(resamples(modellist))
  #bwplot(resamples(modellist))
}

summarize_res(resorList)
summarize_res(resddList)
summarize_res(resexList)
summarize_res(resorddList)
summarize_res(resddexList)
summarize_res(resorexList)
summarize_res(resorddexList)

