#Before you push your changes to GitHub, first you should pull from GitHub. Why? If you make changes to the repo in the browser or from another machine or (one day) a collaborator has pushed, you will be happier if you pull those changes in before you attempt to push.

#Click the blue “Pull” button in the “Git” tab in RStudio. I doubt anything will happen, i.e. you’ll get the message “Already up-to-date”. This is just to establish a habit.
#Now click the green “Push” button to send your local changes to GitHub. You should see some message along these lines.


#https://wiki.qcbs.ca/r_workshop3


getwd()



library(ggplot2)

?qplot


#preloaded data

?iris
data(iris)
head(iris)
str(iris)
names(iris)

qplot(data = iris, x = Sepal.Length, y = Sepal.Width)

#As mentioned previously, the qplot() function understands how to draw a plot based on the mapped variables. In the previous example we used two numerical variables and obtained a scatter plot. However, qplot() will also understand categorical variables:
qplot(data = iris, x = Species, y = Sepal.Width)

qplot(data = iris,
      x = Sepal.Length,
      xlab = "Sepal Length (mm)",
      y = Sepal.Width,
      ylab = "Sepal Width (mm)",
      main = "Sepal dimensions")

#challenge
?CO2
data(CO2)
names(CO2)
str(CO2)

qplot(data = CO2,
      x = conc,
      xlab = "Concentration",
      y = uptake,
      ylab = "Uptake",
      main = "ScatterScatterScatter")
