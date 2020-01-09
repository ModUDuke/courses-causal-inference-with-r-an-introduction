---
title: 'Introduction to Treatment Effects'
description: 'This chapter will introduce you to individual, group, and average treatment effects, and will let you learn and practice through R'
---

## The Average Treatment Effect

```yaml
type: VideoExercise
key: df9b958a75
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/230622767
```


---

## Let’s Code: Finishing Up with Breakfast Cereals

```yaml
type: VideoExercise
key: 41d2451b2e
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/276320325
```


---

## Comparing Breakfast Cereals: Average Treatment Effect

```yaml
type: NormalExercise
key: 0eb921aaf9
lang: r
xp: 100
skills: 1
```

Since we found no significant errors in their dataset in Chapter 1, Puritan Wheat Inc. now wants us to determine whether their cereal TechnoCrunch lasts a longer amount of `time` before it gets soggy than NeoPuffs. Conduct the  the following steps:

`@instructions`
- 1) Use the `mean` function to estimate the mean `time` in dataframe `Soggy` just for flakes that were in TechnoCrunch `cereal`
- 2) Use the `mean` function to estimate the mean `time` in dataframe `Soggy` just for flakes that were in NeoPuffs `cereal`
- 3) In dataframe `Soggy`, subtract the mean `time` for flakes in NeoPuffs `cereal` from the mean `time` for flakes in TechnoCrunch `cereal` to determine which cereal lasts longer before it gets soggy

`@pre_exercise_code`
```{r}
library(plyr)
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
# Note: The following questions require you to subset the data. Remember that in Chapter 1, we had entered the following to get the maximum `time` in dataframe `Soggy`:

    max(Soggy$time[Soggy$cereal=="TechnoCrunch"]) 

# 1) Use the `mean` function to estimate the mean `time` in dataframe `Soggy` just for flakes that were in TechnoCrunch `cereal` 



# 2) Use the `mean` function to estimate the mean `time` in dataframe `Soggy` just for flakes that were in NeoPuffs `cereal`



# 3) In dataframe `Soggy`, subtract the mean `time` for flakes in NeoPuffs `cereal` from the mean `time` for flakes in TechnoCrunch `cereal` to determine which cereal lasts longer before it gets soggy.



```

`@solution`
```{r}
mean(Soggy$time[Soggy$cereal=="TechnoCrunch"])
    mean(Soggy$time[Soggy$cereal=="NeoPuffs"])
    mean(Soggy$time[Soggy$cereal=="TechnoCrunch"])-mean(Soggy$time[Soggy$cereal=="NeoPuffs"])
```

`@sct`
```{r}
test_error()
test_function("mean", incorrect_msg = "Did you use the `mean` function?")
success_msg("Good work! It appears that TechnoCrunch's crunchiness lasts longer than does NeoPuffs. But could there be any factors that are confounding this relationship?")
```

---

## Comparing Breakfast Cereals: Confounders

```yaml
type: NormalExercise
key: 7fd76a360d
lang: r
xp: 100
skills: 1
```

Puritan Wheat Inc. wants to know if there are any factors that might contribute to the difference in the time it took for TechnoCrunch and Neopuffs to get soggy. Puritan Wheat suggests exploring whether `milk` absorption or `fiber` content are correlated with `time` before sogginess. That is, conduct the the following steps:

`@instructions`
- 1) Use the `cor` function to estimate the correlation between `milk` and `time`
- 2) Use the `cor` function to estimate the correlation between `fiber` and `time`

`@pre_exercise_code`
```{r}
library(plyr)
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
# Note: The following questions require use of the cor function. The cor function requires two variables as inputs, separated by a comma. As an example, we produce the correlation between milk and fiber below.

    cor(Soggy$milk,Soggy$fiber)

# 1) Use the `cor` function to estimate the correlation between `milk` and `time`.



# 2) Use the `cor` function to estimate the correlation between `fiber` and `time`.



```

`@solution`
```{r}
cor(Soggy$milk,Soggy$time)
    cor(Soggy$fiber,Soggy$time)
```

`@sct`
```{r}
test_error()
test_function("cor", incorrect_msg = "Did you use the `cor` function?")
success_msg("Good work! There is a positive correlation between fiber and time. It is possible that this correlation might confound the relationship between time and cereal brand, but Puritan Wheat Inc. seems to be satisfied with these results!")
```

---

## The Unit Level Effect

```yaml
type: VideoExercise
key: 5ebfd9aaa0
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/230623038
```


---

## The Conditional Average Treatment Effect

```yaml
type: VideoExercise
key: 6fc38f8905
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/230623221
```


---

## Changing an Ice Cream Recipe: ATE

```yaml
type: MultipleChoiceExercise
key: 6238dbab2d
lang: r
xp: 50
skills: 1
```

Suppose Eddie's Ice Cream wants to know the effect of a new chocolate ice cream recipe on how many cartons of ice cream someone buys next month. They try distributing their new chocolate ice cream to one grocery store, and after a month, they survey three regular Eddie's customers at this store. The first person surveyed bought 10 fewer cartons of Eddie's ice cream after changing the recipe, the second bought 6 more cartons, and the third bought 5 fewer cartons. Assuming that no other factors that influenced their ice cream consumption, this would mean that the experiment's unit-level causal effects were -10, 6, -5 cartons of ice cream. Based on this sample, what was the average treatment effect (ATE) of changing the Eddie's chocolate ice cream recipe on ice cream consumption?

`@hint`

`@instructions`
- 3
- 10
- -7
- [-3]

`@pre_exercise_code`

`@sample_code`

`@feedback`
- What does (-10 + 6 + -5)/3 equal? Try again.
- What does (-10 + 6 + -5)/3 equal? Try again.
- What does (-10 + 6 + -5)/3 equal? Try again.
- Correct!


---

## Changing an Ice Cream Recipe: CATEs

```yaml
type: MultipleChoiceExercise
key: 2bbbcc3971
lang: r
xp: 50
skills: 1
```

Eddie's then surveyed three people who were not regular Eddie's customers. Their unit level causal effects of the change in the chocolate ice cream recipe were -1, 0, 2. If the experiment's unit-level causal effects on regular Eddie's customers was -10, 6, -5 cartons of ice cream, what is the difference between CATE(regular customers) and CATE(not regular customers)?

`@hint`


`@instructions`
- [-3.33]
- -7.33
- 0
- 20

`@pre_exercise_code`

`@sample_code`

`@feedback`
- Correct! CATE(regular) = [(-10) + (6) + (-5)]/3 = -3. CATE(not regular) = (-1 + 0 + 2)/3 = 1/3. So the difference is -3 - 1/3 = -3.33. We see that the average effect on regular customers is much different than on non-regulars: the regular customers will buy a lot less ice cream on average.
- Try again: CATE(regular) = [(-10) + (6) + (-5)]/3 = -3. CATE(not regular) = (-1 + 0 + 2)/3 = 1/3.
- Try again: CATE(regular) = [(-10) + (6) + (-5)]/3 = -3. CATE(not regular) = (-1 + 0 + 2)/3 = 1/3.
- Try again: CATE(regular) = [(-10) + (6) + (-5)]/3 = -3. CATE(not regular) = (-1 + 0 + 2)/3 = 1/3.


---

## Let’s Code: A Problem with Employee Unhappiness

```yaml
type: VideoExercise
key: 6b8a71d25a
lang: r
xp: 50
skills: 1
video_link: //player.vimeo.com/video/276320364
```


---

## Unhappiness at Unter: Identifying Heterogeneous Outcomes - ATE

```yaml
type: NormalExercise
key: 311670fb1a
lang: r
xp: 100
skills: 1
```

The transportation network company, Unter Technologies, is interested in improving their employee morale and reducing employee turnover rate by downsizing their Human Resources (HR) Department.

To make sure this would not antagonize their workforce, Unter conducts an experiment: With a balanced sample of employees, Unter tells a treatment group that the HR Department will be downsized in the following year, and a control group that the HR Department will remain the same size in the following year (and magically, they don't end up discussing this with each other). Unter then surveys the employees to find out whether employees plan to look for new jobs, with response options 0="No" and 1="Yes."

With the dataframe, `UnterHR`, determine whether there is a negative or positive average treatment effect of reducing the size of Unter's HR department on employee turnover:

`@instructions`
- 1) Determine the average effect of reducing the size of HR (`treatment`) on whether employees plan to leave their job in the following year (`LeaveJob`).

`@hint`
- Try breaking the task into pieces. First find the mean rate of `LeaveJob`in the control condition (`Treatment==0`) then find the mean rate of `LeaveJob`in the treatment condition (`Treatment==1`).

`@pre_exercise_code`
```{r}
library(plyr)
set.seed(1)
n=382
#Dataframe
  UnterHR<-data.frame(Treatment=rbinom(n,1,.4),Female=rbinom(n,1,.1),LeaveJob=0)
#LeaveJob
  #treatment makes men less likely to leave
    UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==0]<-rbinom(length(UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==0]),1,.3)
    UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==0]<-rbinom(length(UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==0]),1,.2)
  #treatment makes wommen more likely to leave
    UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==1]<-rbinom(length(UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==1]),1,.3)
    UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==1]<-rbinom(length(UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==1]),1,.6)
```

`@sample_code`
```{r}
# Note 1: The average treatment effect is simply the mean outcome of the treatment group minus the mean outcome of the control group. The mean outcome overall is calculated below:

    mean(UnterHR$LeaveJob)

# Note 2: You will need to `subset` the data into treatment and control groups. For example, we create a data frame for just those in the treatment group below:

    dfTreated<-UnterHR[UnterHR$Treatment==1,]

# 1) Write the code that finds the average effect of reducing the size of HR (`treatment`) on whether employees plan to leave their job in the following year (`LeaveJob`). Assign this value to Solution1.

    Solution1<-
    
```

`@solution`
```{r}
Solution1<- mean(UnterHR$LeaveJob[UnterHR$Treatment==1])-mean(UnterHR$LeaveJob[UnterHR$Treatment==0])
```

`@sct`
```{r}
test_error()
test_object("Solution1")
success_msg("Good work! It seems that reducing the size of HR reduced Unter employees' intentions to leave their jobs")
```

---

## Unhappiness at Unter: Identifying Heterogeneous Outcomes - CATEs

```yaml
type: MultipleChoiceExercise
key: 6217752659
lang: r
xp: 50
skills: 1
```

Since reducing the size of HR seems to reduce the rate of employee turnover, the CEO of Unter Technologies is now heavily considering this option.

However, his chief operating officer (COO) warns him that reducing the size of HR might be unpopular among certain minority groups within the company, particularly among women. The COO sends the CEO a figure (illustrated in the R workspace) showing the results of his experiment among men and women. Which of the following does the figure suggest?

`@instructions`
- While the pooled average treatment effect is slightly negative, and the average treatment effect for men is negative, the average treatment effect for women is positive.
- While the pooled average treatment effect is slightly positive, and the average treatment effect for men is positive, the average treatment effect for women is negative.
- While the pooled average treatment effect is slightly negative, and the average treatment effect for men is positive, the average treatment effect for women is negative.
- While the pooled average treatment effect is slightly positive, and the average treatment effect for men is negative, the average treatment effect for women is positive.

`@pre_exercise_code`
```{r}
library(plyr)
set.seed(1)
n=382
#Dataframe
  UnterHR<-data.frame(Treatment=rbinom(n,1,.4),Female=rbinom(n,1,.1),LeaveJob=0)
#LeaveJob
  #treatment makes men less likely to leave
    UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==0]<-rbinom(length(UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==0]),1,.3)
    UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==0]<-rbinom(length(UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==0]),1,.2)
  #treatment makes wommen more likely to leave
    UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==1]<-rbinom(length(UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==1]),1,.3)
    UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==1]<-rbinom(length(UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==1]),1,.6)
    library(ggplot2)
    library(scales)
    df<-data.frame(Treatment=c("Control","Control","Treatment","Treatment"),Gender=c("Male","Female","Male","Female"),Value=c(mean(UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==0]),mean(UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==1]),mean(UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==0]),mean(UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==1])))
    df<-data.frame(Treatment=c("Control","Control","Control","Treatment","Treatment","Treatment"),Gender=c("Male","Female","Pooled","Male","Female","Pooled"),Value=c(mean(UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==0]),mean(UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==1]),mean(UnterHR$LeaveJob[UnterHR$Treatment==0]),mean(UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==0]),mean(UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==1]),mean(UnterHR$LeaveJob[UnterHR$Treatment==1])))
    df$Gender<-factor(df$Gender, levels = c("Male","Pooled","Female"))
    df$`Percent Intending to Quit`<-df$Value
    df$`Control and Treatment Groups`<-df$Treatment
    p<-ggplot(df, aes(x=`Control and Treatment Groups`,y=`Percent Intending to Quit`,group=Gender,color=Gender))
    p+geom_point(size=3)+geom_line(size=2)+scale_y_continuous(label = percent,limits = c(0,1))
```

`@sample_code`
```{r}
p<-ggplot(df, aes(x=`Control and Treatment Groups`,y=`Percent Intending to Quit`,group=Gender,color=Gender))
    p+geom_point(size=3)+geom_line(size=2)+scale_y_continuous(label = percent,limits = c(0,1))
```

`@sct`
```{r}
msg1 = "Good job! This is an example of a heterogeneous average treatment effect - the treatment has different effects on men and women. However, when men and women are pooled, this heterogeneity is masked."
msg2 = "Whoa! While you're right that there are different effects for men and for women, it looks like you're confused about which effects are negative and which are positive.  Try again."
msg3 = "While you're right that the pooled effects are negative and there are different effects for men and for women, it looks like you're confused about which gender-specific effects are negative and which are positive. Look again."
msg4 = "You're right about the gender-specific effects, but not the pooled effects. Check your results again."
test_mc(correct = 1, feedback_msgs = c(msg1,msg2,msg3,msg4))
```

---

## Unhappiness at Unter: Identifying Heterogeneous Outcomes - CATEs (2)

```yaml
type: NormalExercise
key: a4ab5d9f9b
lang: r
xp: 100
skills: 1
```

Let's further analyze the heterogeneous effect of the treatment on men vs. women in Unter Technologies. With the dataframe, `UnterHR`, determine the average treatment effect of reducing the size of Unter's HR department on employee turnover by gender (`Female`).

`@instructions`
- 1) Determine the average effect of reducing the size of HR (`treatment`) on whether male employees (`Female = 0`) plan to leave the job in the following year (`LeaveJob`).
- 2) Determine the average effect of reducing the size of HR (`treatment`) on whether female employees (`Female = 1`) plan to leave the job in the following year (`LeaveJob`).

`@hint`
- Remember, you can determine the ATE by subtracting the mean rate of the outcome in the control condition by the mean rate of the outcome in the treatment condition.
- You will need to use the `mean` and `subset` commands.
- Try breaking the task into pieces. First find the mean rate of `LeaveJob`in the control condition (`Treatment=0`) then find the mean rate of `LeaveJob`in the treatment condition (`Treatment=1`).

`@pre_exercise_code`
```{r}
library(plyr)
set.seed(1)
n=382
#Dataframe
  UnterHR<-data.frame(Treatment=rbinom(n,1,.4),Female=rbinom(n,1,.1),LeaveJob=0)
#LeaveJob
  #treatment makes men less likely to leave
    UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==0]<-rbinom(length(UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==0]),1,.3)
    UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==0]<-rbinom(length(UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==0]),1,.2)
  #treatment makes wommen more likely to leave
    UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==1]<-rbinom(length(UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==1]),1,.3)
    UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==1]<-rbinom(length(UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==1]),1,.6)
```

`@sample_code`
```{r}
# Note: Since we are interested in understanding the rates of intention to leave by treatment and gender, we might want to examine a three way table of this relationship first. The following syntax prints the numbers of men and women who intend to leave work by treatment group and gender:

    xtabs(~LeaveJob+Treatment+Female, data=UnterHR)

# Note: This question is tricky because we want to subset the data based on two condition (i.e. whether someone is treated and whether someone is female). Below is an example of how to get the mean rate of leaving a job for men who were treated. The `&` symbol is used to add an additional condition:

    mean(UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==0])

# 1) Write the code that determines the average treatment effect among men. Assign this value to Solution1.

    Solution1<- 

# 2) Write the code that determines the average treatment effect among women. Assign this value to Solution2.

    Solution2<-
```

`@solution`
```{r}
Solution1 <- mean(UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==0])-mean(UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==0])
Solution2 <- mean(UnterHR$LeaveJob[UnterHR$Treatment==1 & UnterHR$Female==1])-mean(UnterHR$LeaveJob[UnterHR$Treatment==0 & UnterHR$Female==1])
```

`@sct`
```{r}
test_error()
ex() %>% check_object("Solution1") %>% check_equal()
ex() %>% check_object("Solution2") %>% check_equal()
success_msg("Good work! We can see a clear difference in the treatment effect among men and women. This is a clear example of a conditional average treatment effect.")
```
