---
title: 'Confounders, Counterfactuals, and p-Hacking'
description: 'This chapter will introduce you the important issues of confounders, counterfactuals, and the problem of p-hacking, and will let you learn and practice through R'
---

## Confounders

```yaml
type: VideoExercise
key: 5c37f21710
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/230623543
```


---

## Understanding Confounders

```yaml
type: PureMultipleChoiceExercise
key: ac9bc35c31
lang: r
xp: 50
skills: 1
```

Why are confounding variables a potential problem for causal inference?

`@hint`


`@possible_answers`
- Because confounding variables prevent the treatment from being randomly assigned
- [Because confounding variables might alter the association between the treatment and dependent variable]
- Because confounders are not observed

`@feedback`
- Almost, but remember, the main reason we worry about confounders has to do with effects on the outcome, not on treatment assignment. Try again.
- Correct! Confounders are called *confounders* for a reason---because when they are present, we cannot distinguish the effect of treatment from the effect of the confounder. To learn causal effects, we want to compare people with treatment and people without treatment. If those two groups of people differ in their values of some potential confounding variable, then we can't tell if differences in outcomes are due to differences in treatment, or differences in the confounder.
- Unobserved variables are not always a problem in causal inference, because they may not have any effect on outomes. Try again

---

## Counterfactuals

```yaml
type: VideoExercise
key: 6e830d0422
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/230623577
```


---

## Counterfactuals and You

```yaml
type: PureMultipleChoiceExercise
key: 97e0c3c1ec
lang: r
xp: 50
skills: 1
```

Suppose this was the best DataCamp course ever, and over the course of the past hour, we delivered a cup of ice cream to every DataCamp user's front door. We surveyed our participants, and found out that half of them decided to eat our free ice cream. Can we be certain that providing this free ice cream increased the amount of ice cream that each user would have eaten today if we hadn't provided any free ice cream?

`@hint`


`@possible_answers`
- Yes
- [No]

`@feedback`
- Oops! Think about the data we provided you. Is this really enough to make that conclusion? Try again.
- Correct! The question proposed an experiment and an outcome, but we do not know the counterfactual. While it seems likely that having access to free ice cream would increase our users ice cream consumption, there is no way to know for certain that they would not have eaten ice cream otherwise. For example, maybe some of our user's would have eaten ice cream anyway, or decided to eat more ice cream than what we provided to them. Maybe some users were going to eat ice cream, but changed their mind after seeing a melted scoop of ice cream on their door steps. In sum, the null hypothesis cannot be refuted without knowing the counterfactual.

---

## Statistical Inference vs. Causal Inference

```yaml
type: VideoExercise
key: ddb24adc92
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/230623833
```


---

## Big Data and Statistical Inference

```yaml
type: PureMultipleChoiceExercise
key: 11e02ba59d
lang: r
xp: 50
skills: 1
```

If I have an enormous amount of data, do I still have to worry about causal inference?

`@hint`


`@possible_answers`
- [Yes]
- No

`@feedback`
- Correct. Big data might give you more power to make statistical inferences with your data, but all statistics still need to be interpreted carefully in order to make any causal inferences about the patterns you see."
- Big Data does not solve all problems by magic! No matter the size of your data, you will always need to think about how to interpret your results. Try again.

---

## p Hacking and Talking to Ghosts

```yaml
type: VideoExercise
key: a13b7c2ffd
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/230618095
```


---

## Baseball Ad Campaign: Determining a Counterfactual

```yaml
type: PureMultipleChoiceExercise
key: b1da122e43
lang: r
xp: 50
skills: 1
```

Last year, a small town baseball team called The Hammers was hoping to attract bigger audiences to their home games, so halfway through their season they started a social media advertising campaign. Let’s see how well it worked and explore the data by looking at the behaviour of just one individual.

To find a causal effect, we need to develop a counterfactual. So let's see if our subject went to any baseball games before they saw the ads. Below is a table tracking the games attended per month and the number of ads served per month for our initial subject: 

| Month    |Attended|Ads Served|
|----------|-------:|---------:|
| April    |   0    |    0     |
| May      |   1    |    0     |
| June     |   2    |    0     |
| July     |   -    |    -     |
| August   |   -    |    -     |
| September|   -    |    -     |

Based on the average number of games attended per month in the first 3 months, what would you use as a conservative counterfactual for average number of games attended per month in the second 3 months?

`@hint`


`@possible_answers`
- 0
- [1]
- 2
- 3

`@feedback`
- This person has already shown that they go to some games without ads, so it’s probably safe to assume they’ll go to at least one. Try again.
- Correct. This person has gone to 3 games in 3 months, so on average this person goes to 1 game per month. If you are optimistic, you could read this as a rising trend leading to either +1 game per month, or even 2x games per month, but let’s just stick with the average of 1 game per month for now.
- This could be a safe guess if you think they’ll continue at their last count. But they’ve shown variability before, so it’s probably wise to back off this. Try again.
- This could be a safe guess if you think their attendance rate will keep increasing. But they’ve shown variability before, so it’s probably wise to back off this. Try again.

---

## Baseball Ad Campaign: Early Success?

```yaml
type: PureMultipleChoiceExercise
key: 0ecec920ef
lang: r
xp: 50
skills: 1
```

Let’s see what happened in the first month of the ad campaign for our individual fan. Take a look at the following table:

| Month    |Attended|Ads Served|
|----------|-------:|---------:|
| April    |   0    |    0     |
| May      |   1    |    0     |
| June     |   2    |    0     |
| July     |   7    |    5     |
| August   |   -    |    -     |
| September|   -    |    -     |

Since the number of baseball games that this individual went to appears to increase after viewing 5 ads, can we conclude that the advertising campaign caused the individual to go to more games?

`@hint`


`@possible_answers`
- Yes, the treatment had a positive effect on the outcome variable.
- No, the treatment had no effect.
- [It's too early to tell.]

`@feedback`
- Not yet! We do not know whether the difference in games attended after being exposed to the ad-campaign was statistically significant, nor do we have a sense for any potential confounding variables. Try again.
- Not yet! We do not know whether the difference in games attended after being exposed to the ad-campaign was statistically significant, nor do we have a sense for any potential confounding variables. Try again.
- Correct! Stopping this analysis just because we like the results in the first month would be hacking our results. This month could just be due to confounders. We should let the ad campaign run for the whole season to get a better conclusion.

---

## Let’s Code: A Bigger Sample Size for the Ad Campaign

```yaml
type: VideoExercise
key: 384a8c2308
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/276320373
```


---

## Baseball Ad Campaign: Exploring the Data

```yaml
type: NormalExercise
key: 1b191b5c59
lang: r
xp: 100
skills: 1
```

This series of question will test your knowledge on what we have learned so far, and will introduce some new functions.

The Hammers decided to expand their sample to examine how effective their social media campaign was. They collected more information on the fans who were served promotional ads (their treatment group) and fans who were not served promotional ads (their control group). They determined how many games each individual attended per month and how many ads each individual was served in a given month. To begin our analysis of the ad campaign, let's first get acquainted with the provided dataframe, `Baseball`:

`@instructions`
- 1) Look at the first few rows of dataframe, `Baseball` with function `head`.
- 2) Identify how many observations (`rows`) are in dataframe, `Baseball` with function `nrow`.
- 3) Identify how many unique individuals (`id`) were sampled in dataframe, `Baseball` with functions `length` and `unique`.

`@hint`


`@pre_exercise_code`
```{r}
library(dplyr)
n=62
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
  Baseball<-data.frame(id=rep(1:n,each=6))
  Baseball$month=rep(1:6,n)
  Baseball$ads.served=ifelse(Baseball$month<4,round(rtnorm(n=n,mean=1,sd=.5,min=0,max=3)),round(rtnorm(n=n,mean=5,sd=3,min=1,max=12)))
  Baseball$temp<-rep(c(56,66,77,86,81,70),n)
  Baseball$food<-rep(c(2,3,3,2,2,3),n)
  Baseball$ranking<-rep(c(16,15,11,4,7,6),n)
  Baseball$month=rep(c("April","May","June","July","August","September"),n)
#treatment condition
  treatment<-sample(c(0,1),n,.5)
  Baseball$treatment<-rep(treatment,each=6)
  Baseball$ads.served[Baseball$month=="April" | Baseball$month=="May" | Baseball$month=="June"]<-0
  Baseball$ads.served[Baseball$treatment==0]<-0
  Baseball$attended<-round(
                    rtnorm(n=n,mean=3,sd=1.5,min=0,max=6)+
                    .3*Baseball$ads.served+
                    .0006*Baseball$temp^2+
                    .17*Baseball$ranking
                    )
  Baseball$attended[Baseball$attended<0]<-0
  Baseball<-Baseball[,c("id","month","attended","ads.served","treatment","temp","ranking")]
#Adjustments for this problem
  Baseball<-Baseball[,c("id","month","attended","ads.served","treatment")]
```

`@sample_code`
```{r}
# 1) Look at the first few rows of dataframe, `Baseball` with function `head`.



# Note: Notice that the first rows all have the same respondent id, but different months. In this case, the unit of analysis is not individuals or months, but what we could refer to as "person-months". Let's now determine our sample size of "person-months" and number of unique individuals.

# 2) Identify how many observations (`rows`) are in dataframe, `Baseball` with function `nrow`. Assign this result to object "Solution1".

    Solution1<-

# 3) Identify how many unique individuals (`id`) were sampled in dataframe, `Baseball` with functions `length` and `unique`. To help, we provide sample code for how to determine how long the vector, Baseball$month is, and code for printing the unique months in our sample.

    length(Baseball$month)
    unique(Baseball$month)
    
    Solution2<-
```

`@solution`
```{r}
head(Baseball)
    Solution1<-nrow(Baseball)
    Solution2<-length(unique(Baseball$id))
```

`@sct`
```{r}
ex() %>% check_error()
ex() %>% check_object("Solution1") %>% check_equal()
ex() %>% check_object("Solution2") %>% check_equal()
success_msg("Good work! You should always explore your data before running analyses. These are very typical steps that one might take")
```

---

## Baseball Ad Campaign: Calculating an Average Treatment Effect

```yaml
type: NormalExercise
key: 3c1d77fe1a
lang: r
xp: 100
skills: 1
```

Now that we've looked at some of the basics of the data, let's go ahead and calculate the average treatment effect of the social media ad campaign on baseball game attendance to determine if the Hammer's ad campaign appears effective.

Although we have detailed information about exactly how many ads each participant had viewed, and a control group to compare to, let's really simplify our approach by just examining how whether individuals in the treatment group went to more baseball games during the months of the experiment (July, August, and September). Conduct the following steps:

`@instructions`
- 1) Create a variable called `ExpMonths` in data.frame `Baseball` that indicates whether the month is during the ad campaign (July, August, and September) in logical (TRUE/FALSE) format.
- 2) Calculate the ATE for individuals in the `Treatment` group by subtracting the average attendance (`attended`) of this group prior to the months of the experiment (`ExpMonths`==0) from the average attendance (`attended`) of this group during the experiment (`ExpMonths`==1).

`@hint`


`@pre_exercise_code`
```{r}
library(dplyr)
n=62
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
  Baseball<-data.frame(id=rep(1:n,each=6))
  Baseball$month=rep(1:6,n)
  Baseball$ads.served=ifelse(Baseball$month<4,round(rtnorm(n=n,mean=1,sd=.5,min=0,max=3)),round(rtnorm(n=n,mean=5,sd=3,min=1,max=12)))
  Baseball$temp<-rep(c(56,66,77,86,81,70),n)
  Baseball$food<-rep(c(2,3,3,2,2,3),n)
  Baseball$ranking<-rep(c(16,15,11,4,7,6),n)
  Baseball$month=rep(c("April","May","June","July","August","September"),n)
#treatment condition
  treatment<-sample(c(0,1),n,.5)
  Baseball$treatment<-rep(treatment,each=6)
  Baseball$ads.served[Baseball$month=="April" | Baseball$month=="May" | Baseball$month=="June"]<-0
  Baseball$ads.served[Baseball$treatment==0]<-0
  Baseball$attended<-round(
                    rtnorm(n=n,mean=3,sd=1.5,min=0,max=6)+
                    .3*Baseball$ads.served+
                    .0006*Baseball$temp^2+
                    .17*Baseball$ranking
                    )
  Baseball$attended[Baseball$attended<0]<-0
  Baseball<-Baseball[,c("id","month","attended","ads.served","treatment","temp","ranking")]
#Adjustments for this problem
  Baseball<-Baseball[,c("id","month","attended","ads.served","treatment")]
```

`@sample_code`
```{r}
# Note: We only want to compare the attendance of individuals in the treatment group during the months of the ad campaign to the months prior to the ad campagin. To do so, it would help to first create a variable that indicates which months are during the add campaign. As an example of how to code this, below shows how to create a variable `example` that indicates which months are prior to the ad campaign.

    example<-Baseball$month=="April" | Baseball$month=="May" | Baseball$month=="June"

# 1) Create a variable called `ExpMonths` in data.frame `Baseball` that indicates whether the month is during the ad campaign (July, August, and September).

    Baseball$ExpMonths<-

# 2) Calculate the ATE for individuals in the `Treatment` group by subtracting the average attendance (`attended`) of this group prior to the months of the experiment (`ExpMonths`==FALSE) from the average attendance (`attended`) of this group during the experiment (`ExpMonths`==TRUE). To help get you started, we fill in the first half of this equation, so fill in the second half.

    Solution2<- mean(Baseball$attended[Baseball$treatment==1 & Baseball$ExpMonths==TRUE]) -
```

`@solution`
```{r}
Baseball$ExpMonths<-Baseball$month=="July" | Baseball$month=="August" | Baseball$month=="September" 
    Solution2<- mean(Baseball$attended[Baseball$treatment==1 & Baseball$ExpMonths==TRUE]) - mean(Baseball$attended[Baseball$treatment==1 & Baseball$ExpMonths==FALSE])
```

`@sct`
```{r}
    ex() %>% check_error()
    ex() %>% check_object("Solution2") %>% check_equal()
    success_msg("Good work! The ad campaign had a positive average treatment effect. However, there are several potential confounders that we might want to consider before declaring victory. Let's explore some in the next few questions.")
```

---

## Baseball Ad Campaign: Confounders, Part 1 - Merging and Creating Variables

```yaml
type: NormalExercise
key: 85efc26bc3
lang: r
xp: 100
skills: 1
```

Let's now determine if the treatment effect of the Hammer's ad campaign could be confounded by the weather or the team's performance. To do this, we will first need to merge this information into our dataframe `Baseball`:

`@instructions`
- 1) Print dataframe `dfMonth` to the console.
- 2) Merge `dfMonth` with dataframe `Baseball` by `month` with the `merge` function.

`@hint`


`@pre_exercise_code`
```{r}
library(dplyr)
n=62
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
  Baseball<-data.frame(id=rep(1:n,each=6))
  Baseball$month=rep(1:6,n)
  Baseball$ads.served=ifelse(Baseball$month<4,round(rtnorm(n=n,mean=1,sd=.5,min=0,max=3)),round(rtnorm(n=n,mean=5,sd=3,min=1,max=12)))
  Baseball$temp<-rep(c(56,66,77,86,81,70),n)
  Baseball$food<-rep(c(2,3,3,2,2,3),n)
  Baseball$ranking<-rep(c(16,15,11,4,7,6),n)
  Baseball$month=rep(c("April","May","June","July","August","September"),n)
#treatment condition
  treatment<-sample(c(0,1),n,.5)
  Baseball$treatment<-rep(treatment,each=6)
  Baseball$ads.served[Baseball$month=="April" | Baseball$month=="May" | Baseball$month=="June"]<-0
  Baseball$ads.served[Baseball$treatment==0]<-0
  Baseball$attended<-round(
                    rtnorm(n=n,mean=3,sd=1.5,min=0,max=6)+
                    .3*Baseball$ads.served+
                    .0006*Baseball$temp^2+
                    .17*Baseball$ranking
                    )
  Baseball$attended[Baseball$attended<0]<-0
  Baseball<-Baseball[,c("id","month","attended","ads.served","treatment","temp","ranking")]
#Adjustments for this problem
  Baseball<-Baseball[,c("id","month","attended","ads.served","treatment")]
  dfMonth<-data.frame(month=c("April","May","June","July","August","September"),
                      temp=c(56,66,77,86,81,70),
                      ranking=c(21,15,11,4,7,13))
```

`@sample_code`
```{r}
# 1) Print dataframe `dfMonth` to the console. This can be done by either simply typing dfMonth below, or by using the `print` function with `dfMonth`.


# 2) Merge `dfMonth` with dataframe `Baseball` by `month` with the `merge` function. The merge function requires three arguments, your first dataframe, your second dataframe, and the name of the column that you want to merge by. To accomplish this, replace 'x, y, and "variable"' in the code below with 'Baseball, dfMonth, and "month"'.

    Baseball<-merge(x,y,by="variable")
```

`@solution`
```{r}
dfMonth
    Baseball<-merge(Baseball,dfMonth,by="month")
```

`@sct`
```{r}
ex() %>% check_error()
success_msg("Good work! This is a common way to merge data from different sized dataframes together. Now we can see whether these other variables are associated with attending baseball games and whether they may be confounding the relationship between baseball attendance and  number of ads served.")
```

---

## Looking for Confounders, Part 2 - Did the Weather Affect Attendance Too?

```yaml
type: NormalExercise
key: c24635cc57
lang: r
xp: 100
skills: 1
```

Now that we have calculated a positive average treatment effect of the ad campaign on stadium attendance, it's worth a little effort to see if we have any potential confounders in our data. And remember, there may be important confounders that are not in our data! But for now, let's explore the information we have by starting with a key factor to consider with sports attendance: the weather.

`@instructions`
- 1) Look at a summary of all the variables in the dataframe.
- 2) Generate a bar graph of average high temperature vs. attendance.
- 3) Calculate the correlation between monthly high temperature and baseball stadium attendance.
- 4) What happens to the attendance when the temperature goes up?
- 5) What happens to the temperature when the attendance goes down?

`@hint`
- The syntax for the cor() function is: cor(dataframe$variable1, dataframe$variable2)

`@pre_exercise_code`
```{r}
n=62
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
 Baseball<-data.frame(id=rep(1:n,each=6))
 Baseball$month=rep(1:6,n)
 Baseball$ads.served=ifelse(Baseball$month<4,round(rtnorm(n=n,mean=1,sd=.5,min=0,max=3)),round(rtnorm(n=n,mean=5,sd=3,min=1,max=12)))
 Baseball$temp<-rep(c(56,66,77,86,81,70),n)
 Baseball$food<-rep(c(2,2,2,3,2,2),n)
 Baseball$ranking<-rep(c(16,15,11,4,7,6),n)
 Baseball$month=rep(c("April","May","June","July","August","September"),n)
 #treatment condition
 treatment<-sample(c(0,1),n,.5)
 Baseball$treatment<-rep(treatment,each=6)
 Baseball$ads.served[Baseball$month=="April" | Baseball$month=="May" | Baseball$month=="June"]<-0
 Baseball$ads.served[Baseball$treatment==0]<-0
 Baseball$attended<-round(
     rtnorm(n=n,mean=3,sd=1.5,min=0,max=6)+
         .3*Baseball$ads.served+
         .0006*Baseball$temp^2+
         .17*Baseball$ranking
 )
 Baseball$attended[Baseball$attended<0]<-0
 Baseball<-Baseball[,c("id","month","attended","ads.served","treatment","temp","food","ranking")]
 Baseball$attended
```

`@sample_code`
```{r}
# 1) We have sorted the merged dataframe `Baseball` by id and month for you. Although this is not necessary for this problem, it is often preferable to have longitudinal data sorted this way for conducting future analyses. To see what we have, select this code and hit the "Run Code" button:
   
 head(Baseball)

# Good. You will notice some other variables that we have not used yet:
#   temp: the average high temperature each month (in F)
#   food: the average quality of stadium food (on a scale of 1-10)
#   ranking: the average national ranking of the team (from 1 - 30)

# 2) One of these variables, `temp`,  is a logical place to start, because it makes sense that people will go to more baseball games during good weather. Let's start by looking at a graph that shows the total monthly baseball attendance by everyone in our sample group vs. the average high temperatures for each month. We have generated this code for you, so select it and hit the "Run Code" button:

   bytemp<-aggregate(attended~temp, Baseball, sum)
   barplot(bytemp$attended, main="Total Attendance in Sample vs. Temperature", ylab="Total Games Attended per Month", xlab="Avg High Temp in F", names.arg=bytemp$temp, ylim=c(0,600))

# 3) Great (and note that the x-axis shows the average monthly high temperatures, not the calendar months). Now let's find out if there's a statistical correlation between the variables `temp` and `attended`, so insert those variables into the cor() function and hit the "Run Code" button:
  
  cor()
  
# 4) Based on that correlation, if the temperature goes up by 5 degrees, would you expect the attendance to increase, decrease, or stay the same? Write "increase", "decrease", or "stay the same".

  Solution4<-""

# 5) And based on that correlation, if you see that the attendance goes down by 200, would you expect to see the average high temperature increase, decrease, or stay the same? Write "increase", "decrease", or "stay the same".

  Solution5<-""
```

`@solution`
```{r}
cor(Baseball$temp,Baseball$attended)
Solution4<-"increase"
Solution5<-"decrease"
```

`@sct`
```{r}
ex() %>% check_error()
ex() %>% check_object("Solution4") %>% check_equal()
ex() %>% check_object("Solution5") %>% check_equal()

    success_msg("Nice job. This result makes intuitive sense: people want to get outside more often when it gets warmer than when it's colder, and when it does get colder, they will likely go to fewer games. There are potential other complicating factors, like the other variables in our dataset, and some potential complicating factors that aren't in our dataset, like when kids are out of school for the summer and families are therefore more available to go to baseball games. So let's keep digging!")
```

---

## Looking for Confounders, Part 3 - Did the Team Performance Affect Attendance?

```yaml
type: NormalExercise
key: e7a246aa66
lang: r
xp: 100
skills: 1
```

Another variable that might be important is `ranking`, which reflects the quality of the team's performance. As the team improves, its ranking gets closer to #1, and if they get worse, their ranking moves closer to #30. It makes sense that people will be more interested to go to games if the team is good, i.e. is ranked near #1. But is that true in our sample? Let's find out.

`@instructions`
- 1) Generate a line graph of team national ranking vs. attendance.
- 2) Calculate the correlation between team ranking and baseball stadium attendance.
- 3) What happens to the attendance when the team gets better?
- 4) What happens to the team ranking when the attendance goes down?

`@hint`
- The syntax for the cor() function is: cor(dataframe$variable1, dataframe$variable2)

`@pre_exercise_code`
```{r}

n=62
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
 Baseball<-data.frame(id=rep(1:n,each=6))
 Baseball$month=rep(1:6,n)
 Baseball$ads.served=ifelse(Baseball$month<4,round(rtnorm(n=n,mean=1,sd=.5,min=0,max=3)),round(rtnorm(n=n,mean=5,sd=3,min=1,max=12)))
 Baseball$temp<-rep(c(56,66,77,86,81,70),n)
 Baseball$food<-rep(c(2,2,2,3,2,2),n)
 Baseball$ranking<-rep(c(16,15,11,4,7,6),n)
 Baseball$month=rep(c("April","May","June","July","August","September"),n)
 #treatment condition
 treatment<-sample(c(0,1),n,.5)
 Baseball$treatment<-rep(treatment,each=6)
 Baseball$ads.served[Baseball$month=="April" | Baseball$month=="May" | Baseball$month=="June"]<-0
 Baseball$ads.served[Baseball$treatment==0]<-0
 Baseball$attended<-round(
     rtnorm(n=n,mean=3,sd=1.5,min=0,max=6)+
         .3*Baseball$ads.served+
         .0006*Baseball$temp^2+
         .17*Baseball$ranking
 )
 Baseball$attended[Baseball$attended<0]<-0
 Baseball<-Baseball[,c("id","month","attended","ads.served","treatment","temp","ranking")]
 Baseball$attended
```

`@sample_code`
```{r}
# 1)  Let's start by looking at a slightly different graph that shows the average baseball game attendance per individual in our sample group each month vs. the average team national ranking for each month. We have generated this code for you, so select it and hit the "Run Code" button:

byranking<-aggregate(attended~ranking, Baseball, mean)
plot(byranking$ranking, byranking$attended, type="l", main="Avg Attendance in Sample vs Team Ranking", ylab="Mean Games Attended per Month",xlab="Team National Ranking", ylim=c(0,10))

# 2) This looks a bit different than the total attendance vs. temperature graph did (and note that the x-axis shows the average monthly rankings, not the calendar months). Now let's find out if there's a statistical correlation between the variables `ranking` and `attended`:
  
  cor()
  
# 3) Based on that correlation, if the team starts the month ranked #2 but ends the month ranked #10, would you expect the attendance to increase, decrease, or stay the same? Write "increase", "decrease", or "stay the same" as the solution.

   Solution3<-""

# 4) And based on that correlation, if you see that the attendance goes up by 100 in that same month, would you expect the team's ranking value to increase, decrease, or stay the same? Write "increase", "decrease", or "stay the same" as the solution.

   Solution4<-""
```

`@solution`
```{r}
cor(Baseball$ranking,Baseball$attended)
Solution3<-"decrease"
Solution4<-"decrease"
```

`@sct`
```{r}
ex() %>% check_error()
ex() %>% check_object("Solution3") %>% check_equal()
ex() %>% check_object("Solution4") %>% check_equal()

    success_msg("Good job. Negative correlations can often be confusing to interpret, and their real-world implications is not always intuitive. In this case, do people go to more baseball games when the team improves, or does the team improve when more people go to their games? We can't tell. This data just shows us that there is a negative correlation between these variables in our sample, not a causal effect.")
```

---

## The Final Question: Do You Think the Ad Campaign Increased Attendance?

```yaml
type: PureMultipleChoiceExercise
key: d4e59f0ac2
lang: r
xp: 50
skills: 1
```

We've been looking at the effect of a social media ad campaign on attendance for a local baseball team. We found a positive average treatment effect for the ad campaign, although we also have found out that our data also has two potential confounding variables. Now the owners of the Hammers walks up to you and asks, "Did the ad campaign work?" What do you tell them?

`@hint`


`@possible_answers`
- Yes, the positive ATE shows that it was a great success.
- [Yes, the ads did seem to work, but this effect may have been confounded by other factors.]
- No, there are too many other explanations for the attendance rates, so the ads clearly didn't work.

`@feedback`
- As a good analyst, you need to mention that there are more factors in attendance than just ads. So try again.
- Correct! The ad campaign had a large average treatment effect on attendance, however, people also do go to more games as the weather gets warmer and their team plays better, so we do have potential confounders. Congratulations! You have now finished the Causal Inference with R - Introduction course. To continue your exploration into causal inference and learn slightly more advanced techniques for statistical inference, we highly recommend you try our next course, 'Causal Inference with R - Experiments!
- There's no need to be a Negative Nelly here, the data did show a large and positive effect. Try again.
