---
title: 'Getting Started With The Basics'
description: 'This chapter will introduce you to the basic concepts behind causal inference, and will let you learn and practice through R'
---

## Trailer for Causal Inference with R - Introduction

```yaml
type: VideoExercise
key:
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/276321141
```


---

## Introduction to the Causal Inference Bootcamp

```yaml
type: VideoExercise
key:
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/230621577
```


---

## Correlation vs Causation

```yaml
type: PureMultipleChoiceExercise
key:
lang: r
xp: 50
skills: 1
```

One example we saw in the previous video was when a football player scored a touchdown on a running play. When we examine how two events are connected in our data, whether it's from a football match or from the business world, we often want to figure out which factors are most responsible for causing our outcome. In the case of the football play we saw in the video, how much credit should we give the **coach** for calling that play?

`@hint`


`@possible_answers`
- All the credit: he chose the players on the field, he chose the play, he is in complete control
- [Some of the credit: The players sometimes ignore the coach and just do what they want, and they have to react to what the other team is doing too]
- None of the credit: The offense can only do what the defense allows, so it is the defensive mistakes that creates the score
- It is not a valid question: the astrological position of the sun and the stars determined the outcome of the play when the universe was created, not the coaches or players.

`@feedback`
- While some people believe that people at the top of a power hierarchy have the most causal impact, others believe the opposite, and probably the truth lies somewhere in the middle. Try again.
- Correct, some of the credit. It is the intuitive answer, and also the right one. The real world is really complex, and it can be hard to tell exactly what is the cause of an event. In general, without good data, it is best to assume that a variety of factors contribute to any outcome.)
- This is an argument you will often hear among sports analysts, but team sports involve actors on both sides, so the causality will involve some combination of each, so try again.
- While some form of astrological determinism may provoke an interesting philosophical viewpoint for some people, it’s not related to causal inference, so try again.

---

## Measurement

```yaml
type: VideoExercise
key:
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/230621760
```


---

## Let’s Code: Comparing Breakfast Cereals, Part 1

```yaml
type: VideoExercise
key:
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/276320362
```


---

## Comparing Breakfast Cereals: Outcome Variables

```yaml
type: PureMultipleChoiceExercise
key:
lang: r
xp: 50
skills: 1
```

The food scientists at breakfast cereal manufacturer Puritan Wheat Inc. have developed a new breakfast cereal product called TechnoCrunch. It has a biodegradable nanomaterial coating designed to keep its flakes crispy in milk for longer than the flakes in its competitor cereal, NeoPuffs. Now Puritan Wheat wants to run an experiment to see if the formula works, so it compares the time it takes for TechnoCrunch to get soggy in milk versus the time it takes for NeoPuffs to get soggy. 

In this experiment on the two cereals, which of the following is the outcome variable in Puritan Wheat's analysis?

`@hint`


`@possible_answers`
- The brand of cereal.
- The amount of milk that each flake of cereal can absorb.
- [The time it takes for the cereal to get soggy.]
- Individual flakes.

`@feedback`
- This is the experimental condition that causes the outcome, i.e. the treatment variable, also called the independent variable (because we have the freedom to manipulate its value in an experiment). Try again.
- This is likely correlated with how the dependent variable, but is not mentioned in the prompt. Try again.
- Correct! The outcome variable is one's outcome of interest. You will see it also called the dependent variable, because its value depends on the treatment. You might also see the treatment being called the independent variable, because we have the freedom to manipulate its value in an experiment.
- Not quite. Try again.

---

## Comparing Breakfast Cereals: Units of Analysis

```yaml
type: PureMultipleChoiceExercise
key:
lang: r
xp: 50
skills: 1
```

Puritan Wheat generates some data from a sample of individual flakes in a box of TechnoCrunch and from a box of its competitor's cereal, NeoPuffs. Puritan Wheat intends to examine the average time it takes for each flake to become soggy. What is the unit of analysis in this study?

`@hint`


`@possible_answers`
- The brand of cereal.
- The amount of milk that each flake of cereal can absorb.
- The time it takes for the cereal to get soggy.
- [Individual flakes.]

`@feedback`
- This is the experimental condition that causes the outcome, i.e. the treatment (a.k.a. independent) variable. Try again.
- Not quite. Try again.
- This is the outcome (a.k.a. dependent) variable in our analysis, try again.
- Correct! The unit of analysis is 'what' or 'who' is being studied/sampled. Often our unit of analyses are individual people, but in this example, we are studying a sample of cereal flakes.

---

## Comparing Breakfast Cereals: Getting Familiar with the Data

```yaml
type: NormalExercise
key:
lang: r
xp: 100
skills: 1
```

Before hiring you to explore which cereal takes longer to get soggy, Puritan Wheat  wants to make sure you know how to look at the variables that it provides in its dataset, `Soggy`. Its variables are defined as follows:

- `id` = The ID that Puritan Wheat assigned to each flake in its sample
- `cereal` = The cereal brand of the individual flake
- `milk` = The amount of milk (in ml) that an individual flake was able to absorb
- `time` = The amount of time (in seconds) that the flake weas crispy
- `fiber` = The number of mg in fiber for each flake of cereal

To get familiar with the data, follow the instructions below:

`@instructions`
- 1) Use the `head` function to examine the first few rows of the variable `time` in dataframe `Soggy`
- 2) Use the `tail` function to examine the last few rows of all variables in dataframe `Soggy`

`@hint`


`@pre_exercise_code`
```{r}
library(dplyr)
n=731
set.seed(1)
#Create rnorm function that allows for min and max
  rtnorm <- function(n, mean, sd, min = -Inf, max = Inf){
      qnorm(runif(n, pnorm(min, mean, sd), pnorm(max, mean, sd)), mean, sd)
  }
#Create rounding function that allows to round to numbers above 1
  mround <- function(x,base){
          base*round(x/base)
  }
#Create scaling function that puts number between 0 and 1
  scale <- function(x){
    (x - min(x))/(max(x)-min(x))
    }
#Dataframe
  x=rtnorm(n=n,mean=1,sd=.3,min=.5,max=1.5)
  x2=rtnorm(n=n,mean=.8,sd=.1,min=.1,max=1.5)
    
  Soggy<-data.frame(
    ID=1:n,
    cereal=rbinom(n,1,.4*x*x2),
    milk=mround(rtnorm(n=n,mean=3,sd=2,min=0,max=8)*x,.1),
    time=mround(rtnorm(n=n,mean=212,sd=20,min=99,max=399)*x2,1),
    fiber=mround(rtnorm(n=n,mean=30,sd=5,min=15,max=66)*x2^(1/2),1)
    )
  Soggy$time<-Soggy$time+Soggy$cereal*rtnorm(n=n,mean=10,sd=3,min=0,max=20)
  Soggy$cereal<-ifelse(Soggy$cereal==1,"TechnoCrunch","NeoPuffs")
```

`@sample_code`
```{r}
# Note: Below is an example of how to examine the first few rows of the variable `fiber`, in dataset `soggy`.

    head(Soggy$fiber)

# 1) Use the `head` function to examine the first few rows of the variable `time` in dataframe `Soggy`. 



# 2) Use the `tail` function (which has similar syntax) to examine the last few rows of all variables in dataframe `Soggy`.




```

`@solution`
```{r}
head(Soggy$time)
    tail(Soggy)
```

`@sct`
```{r}
ex() %>% check_error()
success_msg("Good work! It is often important to get a sense of your data before running any analyses with it. Using the head and tail functions is a common and easy way to observe what your data actually looks like.")
```

---

## Comparing Breakfast Cereals: Variable Attributes and Distributions

```yaml
type: NormalExercise
key:
lang: r
xp: 100
skills: 1
```

Before comparing how long it actually takes for each flake of cereal in TechnoCrunch and NeoPuffs to get soggy, Puritan Wheat suggests we summarize information about some of the variables in its dataset, `Soggy`, in case there are any errors that might cause further analyses.

Follow the instructions below:

`@instructions`
- 1) Use the `class` function to examine the format of the variable `fiber` in dataframe `Soggy`
- 2) Use the `table` function to examine the distribution of `cereal` within the sample `Soggy`

`@hint`


`@pre_exercise_code`
```{r}
library(dplyr)
n=731
set.seed(1)
#Create rnorm function that allows for min and max
  rtnorm <- function(n, mean, sd, min = -Inf, max = Inf){
      qnorm(runif(n, pnorm(min, mean, sd), pnorm(max, mean, sd)), mean, sd)
  }
#Create rounding function that allows to round to numbers above 1
  mround <- function(x,base){
          base*round(x/base)
  }
#Create scaling function that puts number between 0 and 1
  scale <- function(x){
    (x - min(x))/(max(x)-min(x))
    }
#Dataframe
  x=rtnorm(n=n,mean=1,sd=.3,min=.5,max=1.5)
  x2=rtnorm(n=n,mean=.8,sd=.1,min=.1,max=1.5)
    
  Soggy<-data.frame(
    ID=1:n,
    cereal=rbinom(n,1,.4*x*x2),
    milk=mround(rtnorm(n=n,mean=3,sd=2,min=0,max=8)*x,.1),
    time=mround(rtnorm(n=n,mean=212,sd=20,min=99,max=399)*x2,1),
    fiber=mround(rtnorm(n=n,mean=30,sd=5,min=15,max=66)*x2^(1/2),1)
    )
  Soggy$time<-Soggy$time+Soggy$cereal*rtnorm(n=n,mean=10,sd=3,min=0,max=20)
  Soggy$cereal<-ifelse(Soggy$cereal==1,"TechnoCrunch","NeoPuffs")
```

`@sample_code`
```{r}
# Note: Below is an example of how to examine the class and frequency of values for the variable `milk`, in dataset `Soggy`.

    class(Soggy$milk)
    table(Soggy$milk)

# 1) Use the `class` function to examine the format of the variable `fiber` in dataframe `Soggy`.


      
# 2) Use the `table` function to examine the distribution of `cereal` within the sample `Soggy`.



```

`@solution`
```{r}
class(Soggy$fiber)
    table(Soggy$cereal)
```

`@sct`
```{r}
ex() %>% check_error()
success_msg("Good work! The above functions will often come in handy as you continue to code in R. The class function is particularly important, because many functions only work with certain types of variables. For example, it is meaningless (and impossible) to estimate the 'mean' of a character variable.")
```

---

## Description

```yaml
type: VideoExercise
key:
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/230622159
```


---

## Let’s Code: Comparing Breakfast Cereals, Part 2

```yaml
type: VideoExercise
key:
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/276320339
```


---

## Comparing Breakfast Cereals: Means, Medians, and Standard Deviations

```yaml
type: NormalExercise
key:
lang: r
xp: 100
skills: 1
```

Before running any direct comparisons between TechnoCrunch and NeoPuffs, Puritan Wheat Inc. now wants you to get some detailed descriptive statistics about the `time` variable in its dataset. Using the dataframe `Soggy`, determine the following:

`@instructions`
- 1) Use the `mean` function to estimate the mean `time` in dataframe `Soggy`
- 2) Use the `median` function to estimate the median `time` in dataframe `Soggy`
- 3) Use the `sd` function to estimate the standard deviation of `time` in dataframe `Soggy`

`@hint`


`@pre_exercise_code`
```{r}
library(dplyr)
n=731
set.seed(1)
#Create rnorm function that allows for min and max
  rtnorm <- function(n, mean, sd, min = -Inf, max = Inf){
      qnorm(runif(n, pnorm(min, mean, sd), pnorm(max, mean, sd)), mean, sd)
  }
#Create rounding function that allows to round to numbers above 1
  mround <- function(x,base){
          base*round(x/base)
  }
#Create scaling function that puts number between 0 and 1
  scale <- function(x){
    (x - min(x))/(max(x)-min(x))
    }
#Dataframe
  x=rtnorm(n=n,mean=1,sd=.3,min=.5,max=1.5)
  x2=rtnorm(n=n,mean=.8,sd=.1,min=.1,max=1.5)
    
  Soggy<-data.frame(
    ID=1:n,
    cereal=rbinom(n,1,.4*x*x2),
    milk=mround(rtnorm(n=n,mean=3,sd=2,min=0,max=8)*x,.1),
    time=mround(rtnorm(n=n,mean=212,sd=20,min=99,max=399)*x2,1),
    fiber=mround(rtnorm(n=n,mean=30,sd=5,min=15,max=66)*x2^(1/2),1)
    )
  Soggy$time<-Soggy$time+Soggy$cereal*rtnorm(n=n,mean=10,sd=3,min=0,max=20)
  Soggy$cereal<-ifelse(Soggy$cereal==1,"TechnoCrunch","NeoPuffs")
```

`@sample_code`
```{r}
# 1) Use the `mean` function to examine the mean `time` in dataframe `Soggy`:

    mean()

# 2) Use the `median` function to examine the median `time` in dataframe `Soggy`.



# 3) Use the `sd` function to examine the standard deviation of `time` in dataframe `Soggy`.



```

`@solution`
```{r}
mean(Soggy$time)
    median(Soggy$time)
    sd(Soggy$time)
```

`@sct`
```{r}
ex() %>% check_error()
success_msg("Good work! As a reminder, the difference in the median and mean of a variable is that the median represents the 'middle' value of a variable whereas the mean represents what we tpyicially think of as the `average` value of a variable. These statistics are often meaningfully (excuse the pun) different; for example, a variable with a much higher mean than median often has observations that are extreme outliers that are much higher than the rest of the observations. Also, remember that the standard deviation is a measure of a variable's variance. If this variable's standard deviation was very high, it would suggest that that most observed values of the variable `time` were not very centered around their mean.")
```

---

## Comparing Breakfast Cereals: Minimums, Maximums, and Summaries

```yaml
type: NormalExercise
key:
lang: r
xp: 100
skills: 1
```

Before running any direct comparisons between TechnoCrunch and NeoPuffs, Puritan Wheat Inc. now wants you to get some descriptive about flakes that are just in TechnoCrunch cereal. Using the dataframe `Soggy`, determine the following:

`@instructions`
- 1) Use the `min` function to estimate the minimum `time` in dataframe `Soggy` just for flakes that were in TechnoCrunch `cereal`
- 2) Use the `summary` function to produce descriptive statistics for `time` in dataframe `Soggy` just for flakes that were in TechnoCrunch `cereal`

`@hint`


`@pre_exercise_code`
```{r}
library(dplyr)
n=731
set.seed(1)
#Create rnorm function that allows for min and max
  rtnorm <- function(n, mean, sd, min = -Inf, max = Inf){
      qnorm(runif(n, pnorm(min, mean, sd), pnorm(max, mean, sd)), mean, sd)
  }
#Create rounding function that allows to round to numbers above 1
  mround <- function(x,base){
          base*round(x/base)
  }
#Create scaling function that puts number between 0 and 1
  scale <- function(x){
    (x - min(x))/(max(x)-min(x))
    }
#Dataframe
  x=rtnorm(n=n,mean=1,sd=.3,min=.5,max=1.5)
  x2=rtnorm(n=n,mean=.8,sd=.1,min=.1,max=1.5)
    
  Soggy<-data.frame(
    ID=1:n,
    cereal=rbinom(n,1,.4*x*x2),
    milk=mround(rtnorm(n=n,mean=3,sd=2,min=0,max=8)*x,.1),
    time=mround(rtnorm(n=n,mean=212,sd=20,min=99,max=399)*x2,1),
    fiber=mround(rtnorm(n=n,mean=30,sd=5,min=15,max=66)*x2^(1/2),1)
    )
  Soggy$time<-Soggy$time+Soggy$cereal*rtnorm(n=n,mean=10,sd=3,min=0,max=20)
  Soggy$cereal<-ifelse(Soggy$cereal==1,"TechnoCrunch","NeoPuffs")
```

`@sample_code`
```{r}
# Note: The next questions require you to subset the data. We provide an example of one way to subset data below. The following code estimates the maximum `time` for flakes that were in TechnoCrunch. The syntax can be interpreted as "show the max of the `time` variable in dataset `Soggy` where the `cereal` variable in dataset `Soggy` is "TechnoCrunch".

    max(Soggy$time[Soggy$cereal=="TechnoCrunch"])
    
# 1) Use the `min` function to estimate the minimum `time` in dataframe `Soggy` just for flakes that were in TechnoCrunch `cereal`.

    
    
# 2) Use the `summary` function to produce descriptive statistics for `time` in dataframe `Soggy` just for flakes that were in TechnoCrunch `cereal`.



```

`@solution`
```{r}
min(Soggy$time[Soggy$cereal=="TechnoCrunch"])
    summary(Soggy$time[Soggy$cereal=="TechnoCrunch"])
```

`@sct`
```{r}
ex() %>% check_error()
success_msg("Good work! As you may have noticed, the summary function is often a great tool for summarizing data, but in practice, you may find yourself needing the other functions as well. In addition, you will often need to `subset` or `select` values in a dataset or vector that meet a specific criteria. We recommend that you practice and become comfortable with subsetting techniques as you continue your learning!")
```

---

## Can You Always Trust a Correlation Value?

```yaml
type: MultipleChoiceExercise
key:
lang: r
xp: 50
skills: 1
```

In this plot, there are a series of numerical distributions. The correlations between the x and y axis in each graph is about the same. What does this mean?

`@possible_answers`
- The graphs are identical.
- [Correlations do not give a perfect summary of how a dataset is distributed.]
- There is no meaningful difference in the distribution of datapoints across these graphs.
- R's correlation function is broken.

`@hint`


`@pre_exercise_code`
```{r}
library(gridExtra)
library(ggplot2)

#correlation
cor1 <- format(cor(anscombe$x1, anscombe$y1), digits=4)
cor2 <- format(cor(anscombe$x2, anscombe$y2), digits=4)
cor3 <- format(cor(anscombe$x3, anscombe$y3), digits=4)
cor4 <- format(cor(anscombe$x4, anscombe$y4), digits=4)

#define the OLS regression
line1 <- lm(y1 ~ x1, data=anscombe)
line2 <- lm(y2 ~ x2, data=anscombe)
line3 <- lm(y3 ~ x3, data=anscombe)
line4 <- lm(y4 ~ x4, data=anscombe)

circle.size = 5
colors = list('red', '#0066CC', '#4BB14B', '#FCE638')

#plot1
plot1 <- ggplot(anscombe, aes(x=x1, y=y1)) + geom_point(size=circle.size, pch=21, fill=colors[[1]]) +
    geom_abline(intercept=line1$coefficients[1], slope=line1$coefficients[2]) +
    annotate("text", x = 12, y = 5, label = paste("correlation = ", cor1))

#plot2
plot2 <- ggplot(anscombe, aes(x=x2, y=y2)) + geom_point(size=circle.size, pch=21, fill=colors[[2]]) +
    geom_abline(intercept=line2$coefficients[1], slope=line2$coefficients[2]) +
    annotate("text", x = 12, y = 3, label = paste("correlation = ", cor2))

#plot3
plot3 <- ggplot(anscombe, aes(x=x3, y=y3)) + geom_point(size=circle.size, pch=21, fill=colors[[3]]) +
    geom_abline(intercept=line3$coefficients[1], slope=line3$coefficients[2]) +
    annotate("text", x = 12, y = 6, label = paste("correlation = ", cor3))

#plot4
plot4 <- ggplot(anscombe, aes(x=x4, y=y4)) + geom_point(size=circle.size, pch=21, fill=colors[[4]]) +
    geom_abline(intercept=line4$coefficients[1], slope=line4$coefficients[2]) +
    annotate("text", x = 15, y = 6, label = paste("correlation = ", cor4))

grid.arrange(plot1, plot2, plot3, plot4, top='Anscombe Quartet', bottom="Syntax to produce graphs borrowed from Sean Dolinar (stats.seandolinar.com-Tutorials)")
```

`@sct`
```{r}
msg1="Look at the graphs to the right of the page. Are you sure they look identical?"
msg2="Yes. This is why statisticians have created so many different types of summary statistics, and why we encourage understanding so many of them."
msg3="Not necessarily. The distributions certainly appear different to the eye, and so perhaps different dynamics are at work in each graph. Try again."
msg4="Unless the webserver just broke, the correlation function is working perfectly, and it's not the reason these graphs seem different. Try again."
ex() %>% check_mc(2, feedback_msgs = c(msg1, msg2, msg3, msg4))

```

---

## Correlation vs. Causation

```yaml
type: VideoExercise
key:
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/230622365
```


---

## Learn Engineering by Eating Cheese?

```yaml
type: PureMultipleChoiceExercise
key:
lang: r
xp: 50
skills: 1
```

![](https://assets.datacamp.com/production/repositories/5613/datasets/141dd1f6a9e9a83bca93fa3e6bd292702d7f8a4e/chart%20resized.jpeg)

As you can see in this chart, the per capita consumption of mozzarella cheese in the US is highly correlated with the number of PhDs awarded annually in Civil Engineering in the US. In fact, it is a 95% correlation. Therefore, does this strong data prove that these two variables are **causally** connected?

`@hint`


`@possible_answers`
- Definitely. 95% correlations do not just happen in real life. There must be a cause and effect reason behind it, even if we do not know what it is.
- [No. This is just a spurious correlation between random variables, and even very strong correlations do not imply causation.]

`@feedback`
- It can be so tempting to assume that any strong correlations in our data are telling us about the cause and effect relationships going on in real life, but do not give into that temptation! We will need to do more to find a causality. Try again.
- Correct! You will find many correlations in your data, sometimes very strong ones like this, but that does not mean there is any causal relationship between them. Sometimes a correlation may help you ask better questions about what is going on, but do not assume they are causal by themselves.

---

## Let’s Code: A Superstitious Sports Fan

```yaml
type: VideoExercise
key:
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/276320346
```


---

## A Superstitious Sports Fan

```yaml
type: NormalExercise
key:
lang: r
xp: 100
skills: 1
```

During last year's football season, Britney's home team, the Durham Dolphins, sadly lost the MegaBowl. As a huge fan, Britney always dressed up on game days in the team jersey and hat, but because the MegaBowl was a special occasion, for that game Britney also painted her nails in the team colors for extra good luck. But her team lost anyway. Britney is convinced that painting her nails hurt the Dolphin's performance, in part because Britney remembers the Dolphins losing when she previously painted her nails.  

Using the dataset, `Nails`, find out whether Britney is at blame for the loss. Specifically:

`@instructions`
- 1) Using the `cor` function, estimate whether the variables `painted` and `wins` within the dataset `Nails` are correlated.
- 2) Using the `ggplot` function, generate a scatterplot and regression line showing the above correlation.
- 3) Based on the above, answer following: "Should Britney have painted her nails?"

`@hint`


`@pre_exercise_code`
```{r}
n=34
set.seed(1)
library(dplyr)
library(ggplot2)
#Create rnorm function that allows for min and max
  rtnorm <- function(n, mean, sd, min = -Inf, max = Inf){
      qnorm(runif(n, pnorm(min, mean, sd), pnorm(max, mean, sd)), mean, sd)
  }
#Create rounding function that allows to round to numbers above 1
  mround <- function(x,base){
          base*round(x/base)
  }
#Create scaling function that puts number between 0 and 1
  scale <- function(x){
    (x - min(x))/(max(x)-min(x))
    }

#Data
  Nails<-data.frame(painted=rbinom(n,1,.3))
  Nails$wins<-rbinom(n,1,.8-Nails$painted*.1)
```

`@sample_code`
```{r}
# 1) Using the `cor` function, estimate whether the variables `painted` and `wins` within the dataset `Nails` are correlated.



# 2) Using the `ggplot` function, generate a scatterplot and regression line showing the above correlation. To do this, replace "df", "x1", and "y1", with the dataset name, and names of the x and y axes. None of these should be in quotes.

  ggplot(data=df, aes(x=x1, y=y1)) + 
  geom_jitter(width = 0, height = 0.1) +
  geom_smooth(method = "lm", se = FALSE)

# 3) Based on what we found the above, answer following: "Should Britney have painted her nails?" Replace Solution3 with one of the following answer options = a) Yes, b) No, c) It depends how they look. Answer with either "a", "b", or "c". 

  Solution3<-""
```

`@solution`
```{r}
cor(Nails$painted,Nails$wins)
  ggplot(data=Nails, aes(x=wins, y=painted)) + 
  geom_jitter(width = 0, height = 0.1) +
  geom_smooth(method = "lm", se = FALSE)
```

`@sct`
```{r}
ex() %>% check_error()
success_msg("Good work! We accepted all answers for Question 3, but we would argue that 'c) It depends how they look' was the most correct of them.")
```
