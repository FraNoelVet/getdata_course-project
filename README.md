# getdata_course-project
This repo contains a README file with some general informations, a tidy.txt with tidy a data, a code book for the tidy data set, and run_analysis code.

# Some infos on the run_analysis.r 
* The first lines load all data in variables
* For the first question, data for different variables are merged in a variable called "all_data"
* For the second question, I find all index for which there is the world "mean()" and for which there is "std()", and gather all the corresponding lines in a variable called "extracted". 
The brackets are important, as these lines are the results of direct mean or standard deviation. The other one are more complex objects resulting of transformations
* For the third question, I created a vector with factors corresponding to the activities, and the created a pre_tidy variable from extracted, while replacing activity codes by names
* For the forth question, I simply added the provided data names (while selecting only the ones that corresponds to what was selected in the second step)
* For the last question, I aggregated all and wrote the 'tidy.txt' data set.

I hope it will be fine with you ^^
