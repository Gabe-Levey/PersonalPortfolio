Gabriel Levey
CSC 415-01
Assignment #1


VM User: student1@csc415-server09.hpc.tcnj.edu
Password: bond2flavoYr3s
Pathway: vm-csc415/Assignment_1/.git/
GitHub Repository: https://github.com/leveyg1/Assignment_1.git


Instructions

1) Enter >ruby Program.rb into the console.
(NOTE: Do not type > into the console)

2) Enter the name of the file you want to use into the console. Be sure to
include the file type (.csv) or an error will occur.

3) If you've done everything correctly, the program will print the data from
the file onto the console. You may also notice the number on the left hand
side of each Student's info. This is their index location within a Student
array and is referred to as student ID.

4) On the first menu, you'll notice how certain words are uppercase while
others aren't. The uppercase words indicate what must be typed into the console
in order to select that option. Capitalization does not matter here since the
program will do it for you but spelling does matter. See the
'Option Description' section of this file to learn more about what each option
does. Type "NEXT" or "next" into the console when you have finished modifying
the Student array.

*IMPORTANT! ONCE YOU HAVE TYPED LEFT THE FIRST MENU YOU CAN NOT MAKE CHANGES
TO THE STUDENT ARRAY.*

5) On the second menu, you'll be asked to specify what criteria you'd like to
use when seperating Students into Groups. This is achieved by sorting the
Student array in reference to the desired criteria. Type the index number of
the info field you'd like to use as criteria.

6) You will be automatically sent to the third menu once you have specified
the criteria you'll be using. Enter the maximum amount of students you want
in a group. The program will tell you what you are allowed and not allowed to
put here.

7) Enter >groups.txt into the console to view the output.
(NOTE: Do not type > into the console)


Option Description

PRINT
Located in menu1. Displays the contents of the Student array onto the console.
The program does this automatically after extracting the data from the file
but the option is still available. Each line prints the data of one Student
in the following format:
ID first_name,last_name,email

GET
Located in menu1. Similar to PRINT but displays one Student's info in an
easier-to-read format.

MODIFY
Located in menu1. Same as GET, only after retrieving the Student's info you
are able to modify their info. This option produces a sub-menu that requires
you to enter the index of the info you want to modify. SPELLING IS VERY
IMPORTANT HERE, ESPECIALLY WHEN MODIFYING A MAJOR OR MINOR. If you wish to
remove a major or minor, please change that major or minor to "N/a". If an
invalid input is entered, the user will be taken back to menu1.

ADD
Located in menu1. Adds a new Student to the Student array. If all required
info fields of the new Student match the required info fields of a Student
already in the Student array, then the new Student will not be added into the
Student array.

REMOVE
Located in menu1. Removes a Student from the Student array.

NEXT
Located in menu1. Typing this means the user is done modifying the Student
array and is ready to move forward.



Limitations
-Program is somewhat reliant on correct user input
-Program can only create groups based off of provided criteria options
-Program is only capable of extracting data from a .csv file
-Program is only capable of printing to a .txt file
-Program must be restarted in order to make revisions to groups
-Program is unable to automatically open output file


Known Bugs
-Program is not able to tell if multiple info fields for a Student are the
same (eg. a Student's major1 and major2 are the same)
-When run on the VM, an empty Student instance is generated at the last index
of the Student array. Not removing it causes errors when groups are generated.