The script `run_analysis.R`performs the 5 steps described in the course project's definition.

* First, all the similar data is merged using the `rbind()` function. 
* Then, only those columns with the mean and standard deviation measures are taken from the whole dataset giving the correct names, taken from `features.txt`.
* As activity data is addressed with values 1:6, we take the activity names and IDs from `activity_labels.txt` and they are substituted in the dataset.
* On the whole dataset, those columns with vague column names are corrected.
* We generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities)