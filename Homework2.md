# Homework 2
### Khyati Kamble

### **Question 1**
What does the following code block accomplish?

```
mkdir project
mkdir project/subdir1
mkdir project/subdir2
cd project/subdir1
mkdir ../subdir2/subdir3
cd ../
rmdir subdir1

```
**Answer**

The first line creates a directory with the name "project". The second line creates a subdirectory under the "project" directory with the name "subdir1". Similarly, the third line creates a subdirectory under the "project" directory with the name "subdir2". The fourth line changes the working directory to "subdir1". For the fifth line, it creates a subdirectory under "subdir2" called "subdir3" without leaving "subdir1" directly. The sixth line changes the working directory from "project/subdir1" to "project". The final line removes the "subdir1" directory. The overall net result is the production of project/subdir2/subdir3.


### **Question 2**

Please consider the following example in R for this question:

```
> mymatrix
     [,1] [,2]
[1,]    1    4
[2,]    2    5
[3,]    3    6

> my_df
  V1 V2
1  1  4
2  2  5
3  3  6

```

In order to obtain the following, what command should be given? Choose A-D, all that apply.

**A:** mymatrix[2]

**B:** mymatrix[[2]]

**C:** my_df[2]

**D:** my_df[[2]]

```
1) [1] 2

2) [1] 4 5 6

3) V2
1  4
2  5
3  6

```
#### **Answer**

1) A, B
2) D
3) C

### **Question 3**
Samantha has a draft of a script for a class called project.sh and she wants to confirm it works. She is thinking of asking people in her study group to read and execute the script. Unfortunately, she doesn't trust some of the people in her study group and wants to make sure she is the only person that can edit/write on her script. What is the chmod command that does this? Use octal numbers.

#### **Answer**

```
chmod 755 project.sh

```

