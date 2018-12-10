encode_feature_gender <- function(x,y){
    x[,y]=factor(x[,y],levels=c("Male","Female"), labels = c(1,2))
    x[,y]=as.numeric(x[,y])
    return(x[,y])
}

my_data$original_data$Gender=encode_feature_gender(my_data$original_data,"Gender")
my_data$dummy_data$Gender=encode_feature_gender(my_data$dummy_data,"Gender")
my_data$externel_data$Gender=encode_feature_gender(my_data$externel_data,"Gender")
my_data$original_dummy_data$Gender=encode_feature_gender(my_data$original_dummy_data,"Gender")
my_data$dummy_external_data$Gender=encode_feature_gender(my_data$dummy_external_data,"Gender")
my_data$original_external_data$Gender=encode_feature_gender(my_data$original_external_data,"Gender")
my_data$original_dummy_external_data$Gender=encode_feature_gender(my_data$original_dummy_external_data,"Gender")

