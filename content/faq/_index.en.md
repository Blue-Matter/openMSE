---
draft: false
title: Frequently Asked Questions
---



### openMSE Questions

{{< faq "What software do I need to use `openMSE`?" >}}
See the [Prerequistes](/welcome-about-openmse/prerequisites/) section
{{</ faq >}}



{{< faq "Can the model be used for short-lived species?" >}}
Due to the problems with approximating fine-scale temporal dynamics with an annual model it is not advised to use `openMSE` with annual time-steps for very short lived stocks (i.e., species with a longevity of 5 years or less).

See [Can the model be run with sub-year time-steps?](/faq/#can-the-model-be-run-with-sub-year-time-steps?) for more information. 
{{</ faq >}}


{{< faq "Can the model be run with sub-year time-steps?" >}}
Possible, but not for the faint-hearted!

You can divide all temporal parameters (e.g., `OM@M` and `OM@K`) by a sub-year resolution. Be aware that all other temporal parameters (e.g., `OM@t0`, `OM@interval`, etc) will also need to be scaled to the same time-step. The [Data object](/object-Data) will be updated at this finer-scale, and you need to design [Custom Management Procedures](/features-management-procedures/custommps/) that operate correctly on your time-scale (e.g., in-season management, or at the end of each year).

{{</ faq >}}

{{< faq "Does the model include density-dependence?" >}}
`openMSE` assumes that, with the exception of the stock-recruitment relationship, there is no density-dependent compensation in the population dynamics, and fish growth, maturity, and mortality does not change directly in response to changes in stock size.

Options to include density-dependence in growth, mortality, etc, may be added at some time in the future.
{{</ faq >}}


{{< faq "Can I model multiple stocks and fleets?" >}}
Yes. The standard `openMSE` model is a single-sex, single-fleet model (i.e, models all fleets in aggregate and assumes females and males are identical). 

The [`multiMSE`](/features-multimse/) feature provides the option to model multiple stocks and fleets, and test fleet-specific management procedures.

{{</ faq >}}

{{< faq "Can I use growth models other than von Bertalanffy function?" >}}
Growth is modeled using the von Bertalanffy growth curve. While this is the most commonly applied model to describe fish growth, it may not be the preferred growth model for some species. The consequences of assuming the von Bertalanffy growth model should be considered when using the model for species with alternative growth patterns. 

Alternative models for describing length-at-age can be added using the [Custom Parameters](/features-custom-parameters/) feature. 
{{</ faq >}}

{{< faq "Can you add feature X?" >}}
The `openMSE` packages are under continual development, and we are frequently updating the packages with new features. [Contact us](/contact) with requests for additional features. 
{{</ faq >}}


{{< faq "What happens if an MP doesn't converge in a particular simulation or year?" >}}
In some cases during the MSE, a [Management Procedure](/features-management-procedures/) may not be able to successfully calculate a management recommendation from the simulated data. 

For example, a catch-curve may used to estimate $Z$, and $F$ is calculated as $F=Z-M$. Because of process and observation error, it is possible that the estimated $F$ is negative, in which case the MP may fail to calculate a recommended catch limit. 

The Management Procedures have been designed to return `NA` if they fail to calculate a management recommendation for any reason. In this case, the management recommendations from the previous year are used in the simulation,e.g., $ \text{TAC}_y = \text{TAC}\_{y-1}$.

{{</ faq >}}


{{< faq "Can I model more than two areas?" >}}
By default, the model uses a two-box spatial model and assumes that growth and other life-history characteristics do not vary across the two spatial areas. 

See the [Custom Parameters](/features-custom-parameters/) section for details on modeling more than two areas.  
{{</ faq >}}

{{< faq "How are the reference points calculated?" >}}
See the [Reference Points](/tutorial-reference-points/) section for details on modeling more than two areas.  
{{</ faq >}}


### Questions related to R
{{< faq "What does this error message mean?" >}}
Although this site attempts to address the most common issues and questions with `openMSE`, undoubtedly there will be times where you have problems with your R code.  R has a somewhat annoying habit of returning cryptic error messages, that are sometimes indecipherable, especially to those who are new to the software.

Most coding problems with the R language are the result of a missing parenthesis, an extra or missing comma or quotation mark, or some other minor typo that stops your code from running.  

There are a number of resources available on the Internet that are devoted to dealing with questions and problems with R programming. [StackOverflow](http://stackoverflow.com/questions/tagged/r) is great place to start searching for answers to your R-related problems. 

There is a high chance that in the past someone has posted the exact question that you are dealing with, and one or several kind souls have provided helpful solutions. If not, you can post your own question. But be aware, the StackOverflow community is made up entirely of people who volunteer their time to help others, and they sometimes have little patience for questions that don't demonstrate a proper search for already posted answers to the problem.
{{</ faq >}}

{{< faq "What are S4 Objects?" >}}
The core objects in the `openMSE` packages are *S4 Classes*. Many R users may not have worked with S4 objects and methods before. 

R has three different object oriented (OO) systems, the most common of which is known as **S3**.   S3 is known as a generic-function OO, and is a casual system with no formal definition of classes.  **S4** works similar to S3, but is more formal and uses classes with a more rigid definition.  

It is not essential to understand the difference between S3 and S4, or why one is preferred over the other, to use the `openMSE` packages.  The most important thing that you need to know how to access the information in S4 classes. 

If you have work with R in the past, you are probably familiar with using the **$** symbol to access elements in a data frame or list.  S4 classes contain a named list of **slots** which are analogous to a standard R list.  However, the slots in a S4 class differ in two important ways:

1. The type of content in each slot (e.g., character, numeric, matrix) is determined in the class definition, and cannot be changed.  In other words, you are not able to put content of class ```character``` into a slot that is expecting information of class ```numeric```.  This is what is meant by the S4 system being more strict than S3.   
2. The slots are accessed with the @ symbol.  This is essentially the same as the **$** symbol in S3 classes.  You will see examples of this throughout the User Guide.

The main thing to note here is that when you see the `@` symbol being used, it refers to some particular information (a *slot*) being accessed from a larger collection of data (the *object*).

For further information on the S4 systems see [Advanced R](http://adv-r.had.co.nz/S4.html).

{{</ faq >}}


