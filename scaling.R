feature_scaling <- function(x,y){
  return(scale(x[,y]))
}

my_data$original_data[,1:28]=feature_scaling(my_data$original_data,1:28)
my_data$dummy_data[,1:28]=feature_scaling(my_data$dummy_data,1:28)
my_data$externel_data[,1:28]=feature_scaling(my_data$externel_data,1:28)
my_data$original_dummy_data[,1:28]=feature_scaling(my_data$original_dummy_data,1:28)
my_data$dummy_external_data[,1:28]=feature_scaling(my_data$dummy_external_data,1:28)
my_data$original_external_data[,1:28]=feature_scaling(my_data$original_external_data,1:28)
my_data$original_dummy_external_data[,1:28]=feature_scaling(my_data$original_dummy_external_data,1:28)