## Use Headers ---  WKSHP 2 --- QCBS
# date
##version 3.6.0


####Housekeeping#### 
#note how 4 hashtags becomes a small arrow to the right that can collapse


#cool


####Always do this first####

rm(list=ls())  # Clears R workspace
?rm
?ls


A<-"Test"     # Put some data into workspace, to see how rm(list=ls()) removes it
A <- "Test"   # Note that you can use a space before or after <-
A = "Test"    # <- or = can be used equally

# Note that it is best practice to use "<-" for assignment instead of "="

A
rm(list=ls())
A

a<-10  
A<-5
a
A

rm(list=ls())  # Clears R workspace again


####Loading, exploring and saving data####

getwd() # This commands shows the directory you are currently working in

#To change working directories using the setwd() function, specify the working directory's path using a “/” to separate folders, subfolders and file names. You can also click Session > Set working directory > Choose directory…

dir() # This command shows the content of the directory you are currently working in

setwd("C:/Users/Fraser McL/Documents/R/QCBS_wkshp2/data")

CO2 <- read.csv("co2_good.csv") # Creates an object called CO2 by loading data from a file called "co2_good.csv" 

?read.csv # Use the question mark to pull up the help page for a command  

CO2 <- read.csv("co2_good.csv", header = TRUE) 


####Looking at the data####

CO2

head(CO2) #first few rows

tail(CO2) #last few

names(CO2) #column names

attributes(CO2) 

dim(CO2) #dimensions

ncol(CO2)

nrow(CO2)

summary(CO2)

str(CO2) # The str() command is very useful to check the data type/mode for each column (i.e. to check that all factors are factors, and numeric data is stored as an integer or numeric.


#exercise

CO2<-read.csv("co2_good.csv",header=FALSE)

str(CO2) # var instead of proper numbers and all variables are factors

CO2<-read.csv("co2_good.csv")

str(CO2)

#remember

#mydata[2,3] # extracts the content of row 2 / column 3
#mydata[1,] # extracts the content of the first row
#mydata[,1][2] # this extracts the second content of the first column
#If row number is omitted, the whole column is extracted. Similarly, the $ sign followed by the corresponding header can be used.
#mydata$Variable1 # extracts a specific column by its name ("Variable1")


####Renaming variables####

# First let's make a copy of the dataset to play with!
CO2copy <- CO2
# names() gives you the names of the variables present in the data frame 
names(CO2copy)

# Changing from English to French names (make sure you have the same levels!)
names(CO2copy) <- c("Plante","Categorie", "Traitement", "conc","absortion")


####Creating new variables####

#New variables can be easily created and populated. For example, variables and strings can be concatenated together using the function paste().

# Let's create an unique id for our samples using the function paste()
# see 
?paste  
?paste0
# Don't forget to use "" for strings 
CO2copy$uniqueID <- paste0(CO2copy$Plante,"_", CO2copy$Categorie, "_", CO2copy$Traitement)

# Observe the results 
head(CO2copy$uniqueID)

?head

# Let's standardize our variable "absortion" to relative values 
CO2copy$absortionRel <- CO2copy$absortion/max(CO2copy$absortion) # Changing to relative values 

# Observe the results 
head(CO2copy$absortionRel)

####Subsetting data####

# Let's keep working with our CO2copy data frame 

## Subsetting by variable name 
CO2copy[,c("Plante", "absortionRel")] # Selects only "Plante" and "absortionRel" columns. (Don't forget the ","!)

## Subsetting by row 
CO2copy[1:50,] # Subset data frame from rows from 1 to 50 

### Subsetting by matching with a factor level 
CO2copy[CO2copy$Traitement == "nonchilled",] # Select observations matching only the nonchilled Traitement. 

### Subsetting according to a numeric condition 
CO2copy[CO2copy$absortion >= 20, ] # Select observations with absortion higher or equal to 20  

### Conditions can be complimentary -The & (and) argument-
CO2copy[CO2copy$Traitement  == "nonchilled" & CO2copy$absortion >= 20, ]

# We are done playing with the dataset copy. Let's erase it.
CO2copy <- NULL

#### Data Exploration ####


summary(CO2) # Get summary statistics of your dataset

# Calculate mean and standard deviation of the concentration, and assign them to new variables
meanConc <- mean(CO2$conc)
sdConc <- sd(CO2$conc)

# print() prints any given value to the R console
print(paste("the mean of concentration is:", meanConc))
print(paste("the standard deviation of concentration is:", sdConc))

# Let's plot a histogram to explore the distribution of "uptake"
hist(CO2$uptake)

# Increasing the number of bins to observe better the pattern 
hist(CO2$uptake, breaks = 40)

?apply

apply(CO2[,4:5], MARGIN = 2, FUN = mean) # Calculate mean of the two columns in the data frame that contain continuous data

#### Save your workspace ####
save.image(file="co2_project_Data.RData") # Save workspace

rm(list=ls())  # Clears R workspace

load("co2_project_Data.RData") #Reload everything that was in your workspace

head(CO2) # Looking good! :)

####Exporting data####

getwd()
write.csv(CO2,file="co2_new.csv") # Save object CO2 to a file named co2_new.csv

####Playing with my own data ####
FO2020 <- read.csv("FOPlantReport-20200504192752.csv")
FO2020

head(FO2020)

tail(FO2020) #last few

names(FO2020) #column names

attributes(FO2020) 
?attributes

dim(FO2020) #dimensions

ncol(FO2020)

nrow(FO2020)

summary(FO2020)

str(FO2020) # The str() command is very useful to check the data type/mode for each column (i.e. to check that all factors are factors, and numeric data is stored as an integer or numeric.

## Subsetting by variable name 
#CO2copy[,c("Plante", "absortionRel")] # Selects only "Plante" and "absortionRel" columns. (Don't forget the ","!)

FO2020[,c("Agency", "SubProgram","ApprovedSeedlings")]

## Subsetting by row 
#CO2copy[1:50,] # Subset data frame from rows from 1 to 50 

### Subsetting by matching with a factor level 
#CO2copy[CO2copy$Traitement == "nonchilled",] # Select observations matching only the nonchilled Traitement. 

FO2020[FO2020$SubProgram == "Highway of Heroes" & FO2020$ApprovedSeedlings >= 1000, c("Agency", "SubProgram","ApprovedSeedlings")]

### Subsetting according to a numeric condition 
#CO2copy[CO2copy$absortion >= 20, ] # Select observations with absortion higher or equal to 20  

### Conditions can be complimentary -The & (and) argument-
#CO2copy[CO2copy$Traitement  == "nonchilled" & CO2copy$absortion >= 20, ]


hist(FO2020$ApprovedSeedlings, breaks = 100)



#### Fix broken data frame ####

CO2<-read.csv("co2_broken.csv") # Overwrite CO2 object with broken CO2 data 
head(CO2) # Looks messy
CO2 # Indeed!

#4 problems

#tab was used in stead of , for seperation
CO2 <- read.csv("co2_broken.csv",sep = "")
?read.csv

#notes at the top

head(CO2) # The head() command allows you to see that the data has not been read in with the proper headings

CO2<-read.csv("co2_broken.csv",sep = "",skip=2)  # By adding the skip argument into the read.csv function, R knows to skip the first two rows
head(CO2) # You can now see that the CO2 object has the appropriate headings

# Problem #3: “conc” and “uptake” variables are considered factors instead of numbers, because there are comments/text in the numeric columns.

str(CO2) # The str() command shows you that both 'conc' and 'uptake' are labelled as factors
class(CO2$conc)
unique(CO2$conc) # By looking at the unique values in this column, you see that both columns contain "cannot_read_notes" 
unique(CO2$uptake) 
?unique

#solution

?read.csv

CO2 <- read.csv("co2_broken.csv",sep = "",skip = 2,na.strings = c("NA","na","cannot_read_notes")) 

head(CO2)
str(CO2) # You can see that conc variable is now an integer and the uptake variable is now treated as numeric

# Problem #4: There are only two treatments (chilled and nonchilled) but there are spelling errors causing it to look like 4 different treatments.

str(CO2) # You can see that 4 levels are listed for Treatment
levels(CO2$Treatment)
unique(CO2$Treatment) # The 4 different treatments are "nonchilled", "nnchilled", "chilled", and "chiled"  

# You can use which() to find rows with the typo "nnchilled"
which(CO2$Treatment=="nnchilled") # Row number ten
# You can then correct the error using indexing:
CO2$Treatment[10] <- "nonchilled"
# Alternatively, doing it with a single command:
CO2$Treatment[which(CO2$Treatment=="nnchilled")] <- "nonchilled"
# Now doing the same for "chiled":
CO2$Treatment[which(CO2$Treatment=="chiled")] <- "chilled" 


str(CO2)  # Structure still identifies 4 levels of the factor
unique(CO2$Treatment) # But, unique says that only two are used
CO2<-droplevels(CO2) # This command drops the unused levels from all factors in the data frame
str(CO2) # Fixed!

####Advanced user sections####

#Tidyr
# Although aggregation can be done with many functions in R, the tidyr package allows you to both reshape and aggregate within a single syntax.

if(!require(tidyr)){install.packages("tidyr")}
library(tidyr)

#1. gather() our data (wide -> long)
#2. spread() our data (long -> wide)

wide <- data.frame(Species = c("Oak", "Elm", "Ash"),
                   DBH = c(12, 20, 13),
                   Height = c(56, 85, 55))
wide

?gather

#Development on gather() is complete, and for new code we recommend switching to pivot_longer(), which is easier to use, more featureful, and still under active development. df %>% gather("key", "value", x, y, z) is equivalent to df %>% pivot_longer(c(x, y, z), names_to = "key", values_to = "value")

# Gathering columns into rows

long <- gather(wide, Measurement, Value, DBH, Height)
long


CO2.long <- gather(CO2, response, value, conc, uptake)

CO2.long

head(CO2)
head(CO2.long)
tail(CO2.long)

#spread(): Making your data wide
wide2 <- spread(long, Measurement, Value)
wide2

#separate(): Separate two (or more) variables in a single column

?rep
?runif

?set.seed
set.seed(8)
messy <- data.frame(id = 1:4,
                    trt = sample(rep(c('control', 'farm'), each = 2)),
                    zooplankton.T1 = runif(4),
                    fish.T1 = runif(4),
                    zooplankton.T2 = runif(4),
                    fish.T2 = runif(4))
messy

?gather


messy.long <- gather(messy, taxa, count, -id, -trt)
head(messy.long)

messy.long.sep <- separate(messy.long, taxa, into = c("species", "time"), sep = "\\.")
head(messy.long.sep) 


#Here's cheat sheet to help you use tidyr and dplyr for more data wrangling: https://www.rstudio.com/wp-content/uploads/2015/02/data-wrangling-cheatsheet.pdf


#Challenge -- don't fully get this yet

?air.quality
data(airquality)

airquality

?gather()

# Use gather() to convert the dataset to long format
air.long <- gather(airquality, variable, value, -Month, -Day)
head(air.long)
# Note that the syntax used here indicates we wish to gather ALL the columns except "Month" and "Day"

# Then, use spread() to convert the dataset back to wide format
air.wide <- spread(air.long , variable, value) 
head(air.wide)




#### Intro to dplyr ####
#The vision of the dplyr package is to simplify data manipulation by distilling all the common data manipulation tasks to a set of intuitive functions (or "verbs"). The result is a comprehensive set of tools that facilitates data manipulation, such as filtering rows, selecting specific columns, re-ordering rows, adding new columns and summarizing data.

if(!require(dplyr)){install.packages("dplyr")}
library(dplyr)

# Select a subset of columns with ''select()''

#for example

CO2

?starts_with

select(CO2, Plant, Type) # select columns 1 and 2
select(CO2, c(3:4,5)) # select columns 3 to 4 and 5
select(CO2, -1) # select all columns except column 1
#hmm -- select(CO2, starts_with(T)) # select all columns that start with "T"

head(airquality)

ozone <- select(airquality, Ozone, Month, Day)
head(ozone)       


#Select a subset of rows with ''filter()''

##filter(dataframe, logical statement 1, logical statement 2, .)

august <- filter(airquality, Month == 8, Temp >= 90)

head(august)

#sorting rows with arrange

#Example: Let's use the following code to create a scrambled version of the airquality dataset

air_mess <- sample_frac(airquality, 1)
head(air_mess)

#Now, let's arrange the data frame back into chronological order, sorting by Month, and then by Day:


air_chron <- arrange(air_mess, Month, Day)
head(air_chron)

air_chron<-arrange(air_mess, Day, Month)
head(air_chron)


#Create and populate columns with ''mutate()''

##The mutate() function follows this syntax: mutate(data, newVar1 = expression1, newVar2 = expression2, .).

airquality_C <- mutate(airquality, Temp_C = (Temp-32)*(5/9))
head(airquality_C)

#Note that the syntax here is quite simple, but within a single call of the mutate() function, we can replace existing columns, we can create multiple new columns, and each new column can be created using newly created columns within the same function call.

?mutate


#### Dplyer and magrittr ####
#The magrittr package brings a new and exciting tool to the table: a pipe operator. 

if(!require(magrittr)){install.packages("magrittr")}
require(magrittr)

#Suppose we wanted to filter() rows to limit our analysis to the month of June, then convert the temperature variable to degrees Celsius. We can tackle this problem step by step, as before:

#step by step:
june_C <- mutate(filter(airquality, Month == 6), Temp_C = (Temp-32)*(5/9))
june_C

#Or, 2 operations by linking both functions together:

june_C <- airquality %>% 
  filter(Month == 6) %>%
  mutate(Temp_C = (Temp-32)*(5/9))

#Quick tip: In RStudio we can insert this pipe quickly using the following hotkey: Ctrl (or Cmd for Mac) +Shift+M.
# %>% 

####dplyr - grouped operations and summaries####
#The following functions allow us to split our data frame into distinct groups on which we can then perform operations individually, such as aggregating/summarising:

# group_by(): group data frame by a factor for downstream commands (usually summarise)
#summarise(): summarise values in a data frame or in groups within the data frame with aggregation functions (e.g. min(), max(), mean(), etc.)
#Split-Apply-Combine strategy

month_sum <- airquality %>% 
  group_by(Month) %>% 
  summarise(mean_temp = mean(Temp),
            sd_temp = sd(Temp))
month_sum

#Challenge
#Using the ChickWeight dataset, create a summary table which displays the difference in weight between the maximum and minimum weight of each chick in the study. Employ dplyr verbs and the %>% operator.

?ChickWeight
?data
data(ChickWeight)

head(ChickWeight)

?summarise

Chick_sum <- ChickWeight %>% 
  group_by(Chick) %>% 
  summarise(Weight.gain = max(weight)-min(weight))

Chick_sum  


#inspect chick_18
chick_18 <- ChickWeight %>% filter(Chick == 18)
chick_18

#Note that we can group the data frame using more than one factor, using the general syntax as follows: group_by(group1, group2, .)

#Challenge
#Using the ChickWeight dataset, create a summary table which displays, for each diet, the average individual difference in weight between the end and the beginning of the study. Employ dplyr verbs and the %>% operator. 
#(Hint: first() and last() may be useful here.)

Chicky <- ChickWeight %>% 
  group_by(Diet, Chick) %>% 
  summarise(weightgain = last(weight) - first(weight)) %>% 
  group_by(Diet) %>% 
  summarise(mean_gain = mean(weightgain))


Chicky

#test <- ChickWeight$weight[ChickWeight$Chick == 1]
#test


#### Merging data frames####
left_join()
right_join()
inner_join()
anti_join()

