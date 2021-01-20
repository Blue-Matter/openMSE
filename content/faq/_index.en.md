---
draft: false
title: Frequently Asked Questions
---

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

{{< faq "Where are the rest of the FAQs?" >}}
Coming soon!
{{</ faq >}}



