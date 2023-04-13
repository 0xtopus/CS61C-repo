# Basic Things about The Course

**Six Great Ideas in Computer Structure**

1. Abstraction
2. Moore's Law
3. Principle of Locality / Memory Hierarchy
4. Parallelism
5. Performance Measurement & Improvement
6. Dependability via Redundancy

**Textbooks**

<img src=".\cs61c_pics\textbooks.png" style="zoom:75%;" />

**Jargon**

A quick clarification on some terms:

- TA/GSI/uGSI: Teaching Assistant (sometimes called Graduate/Undergraduate Student Instructor).
- AI: Academic Intern, also part of course staff. You’ll see them in OH and sometimes Piazza.
  - In this course, AI generally stands for this, and not “artificial intelligence”.
- OH: Office Hours, where you can meet course staff in (virtual) meetings and ask questions.
- Hive/”Hive machines”/”the Hive”: a group of instructional servers.

## **Using Command Line**

see more at<a href="https://inst.eecs.berkeley.edu/~cs61c/sp21/labs/lab00/#cli-keyboard-shortcuts"> this page</a>

### `man` - Manual Pages

The manual pages (“man pages”) are great UNIX resources that are often underused; while not as versatile as Google, they contain documentation on UNIX components from program usage, language standards and conventions, and more. They also work offline, so they can be handy if you’re ever stuck in a North Alaskan woodland cabin in the middle of a snowstorm basking in the dying glow of a ThinkPad which BTW runs Arch Linux.

While your favorite search engine probably also has the answers you’re looking for, in this course, we’d still like you to get comfortable with using `man`, especially for C and UNIX-related questions.

If you want the man page for a single program/command, you can run:

```
$ man command_name | less
```

The man page for a program typically contains information about what the program is used for, what certain flags do when you invoke the program with them, and where to go for more information. Since we piped the man page into `less`, this page is scrollable (use your arrow keys or the space bar). Hit `q` to exit the man page and get back to your terminal prompt.

```
$ man echo | less
```

The above command should bring up the man page for the `echo` command.

If you want to search the man pages for a command that pertains to a keyword:

```
$ man -k single_keyword | less
```

This command will search the manual pages for a command with the keyword `single_keyword`. Forget how to open files in Vim? You can search for `editor` and get a list of all editor-related commands on your system.

### Working With Files

`touch` will create a blank file with the file name you provided.

```
$ touch example.txt
```

This will create a file named `example.txt` with nothing inside.

If you’d like to create a file and add text in one go, you can use:

```
$ echo "Your contents here, inside double quotes" > example.txt
```

This will create a file with the name `example.txt` in your current directory. If the file already exists, it will be overwritten. The file will contain `Your contents here, inside double quotes` but without the double quotes. The `>` symbol takes one argument which redirects where data printed to stdout is sent. Here, we are redirecting the output of `echo` to a file named `example.txt`.

You can also use the `echo` command by itself, in which case it will print the string to the terminal (without creating a file in the process).

You can view the contents of a file with the `cat` or `less` commands.

```
$ cat example.txt
$ less example.txt
```

`cat` print the contents of `example.txt` to your terminal. `less` opens a basic viewer which allows you to scroll and search.

You can provide a relative or absolute path to print out non-local files:

```
$ cat ../other_folder/file.txt
$ cat ~/home_file.txt
$ cat /creeper/awww_man


```

### Vim Basics

`vim` is a text editor included on the Hive machines and many UNIX-based distributions.

Note: We’ll be using Vim in most of our examples and documentation, but we have no hard requirement on which text editor you use; you’re welcome to pick whatever you’re comfortable with, but you should know how to use at least one terminal-based text editor.

To open a file from your current directory, pass the file name to Vim:

```
$ vim filename
```

To open a file from another directory, use a relative or absolute path:

```
$ vim ../other_folder/filename
```

Some useful Vim commands:

| Command           | Explanation                                                  |
| ----------------- | ------------------------------------------------------------ |
| `<escape>:q`      | Closes (quits) Vim without saving                            |
| `<escape>:wq`     | Closes Vim after saving                                      |
| `<escape>:w`      | Saves your file                                              |
| `<escape>:q!`     | Force-quit Vim (for when you’ve made changes but do not wish to save them) |
| `<escape>i`       | Insert mode, allows you to type into the file                |
| `<escape>/cats`   | Searches your file for the nearest occurrence of the string “cats”. Press `n` to go to the next occurrence or `N` to go to the previous |
| `<escape>:set nu` | Shows line numbers within your file                          |

Note: these commands are preceded by `<escape>` because you’ll need to press the escape key on your keyboard to switch you out of your current mode. For example, if I’m inserting (typing) into a file and want to save, I’d have to hit `<escape>` to get out of insert mode, then type `:w` to save my file. If you aren’t in a mode (i.e. you’ve just opened your file) you don’t need to hit escape first, but it won’t hurt :)

For more on Vim, refer to this great [Vim for CS61C guide](https://docs.google.com/document/d/1WQF6hQK8CXtlGynSAIX7Rts6q8lykarrqX-zkb9ZDyc/view).

# Number Representation

**Unsigned number **: numbers that only represents positive number from 0 to 2^n^ - 1.

**Two's Complement** (补码): 

- leftmost bit indicates sign, 0 for positive and 1 for positive. 

- The positive numbers are the same to unsigned number except the leftmost digit is 0. 

- For negatives, flip bits & add one!

  - The negative numbers can be represented by flip digits of its absolute value represented in positive  form and then add 1. e.g. to represent -3 by flipping 0011 into 1100 then add 1 to get 1101. And to interpret a negative  value you can do the same.

- <img src=".\cs61c_pics\2sComplement.png" style="zoom:75%;" />

- **Overflow** only happens when you have the same sign!

- All "1" is always -1! (literally 11111 is  -1)

- Represents numbers from -2^n-1^ to 2^n-1^ - 1 (Note that the number of negatives is always greater by 1 to the positives)

- Easy addition & subtraction

  - Easily convert subtraction into addition.

  

**Bias Encoding**

- \# = bias + unsigned
  1. represent # as unsigned.
  2. shift the number by the bias.

e.g. 

```
010 --> unsigned 2
bias = -3
2 - 3 = -1
so 010 represents -1
```

- bias = - (2^n-1^ - 1)

- There are 2^n-1^  positives and 2^n-1^ - 1 negatives (**Note the differences with Two's Complement!**)

  

**Exercise**

- Do <a href="https://inst.eecs.berkeley.edu/~cs61c/sp21/pdfs/docs/discussions/disc01_sol.pdf">this exercise</a> to get a deeper understanding!

  <img src=".\cs61c_pics\everyBaseIsBase10!.png" style="zoom:75%;" />

# C Intro

## Compile vs. interpret

**Compilation**

For C, there are generally two part process of compiling

1. `.c` file to `.o` files;
2. linking the `.o` files into executables

<img src=".\cs61c_pics\simpCCompile.png" style="zoom:75%;" />

- Advantages
  - Reasonable compilation time
  - Excellent runtime performance
    - But these days a lot of performances is in libraries, so ppl just go for Python.
- Disadvantages
  - Compiled files including the executables, are architecture-specific,depending on processor type and the operating system.
  - Executable must be rebuilt on each new system.
  - "Change -- compile -- run" iteration cycle can be slow during development.

## CPP

C source files first pass through  *macro processor*, *CPP*, before compiler sees code.

- CPP replaces comments with a single space.
- CPP commands begin with "#"

```c
#include "file.h"
#include <stdio.h>
#define PI (3.14159) 
#if/#endif
```

To see result of preprocessing in gcc, use `-save-temps`.

<img src=".\cs61c_pics\CPP.png" style="zoom:75%;" />

**CPP macro warining**

You often see C processor macros defined to create small "functions". But they aren't actual functions! The code below may cause a side-effect:

````c
#define min(X, Y) ((X) < (Y) ? (X) : (Y))
...
next = min(w, foo(z)); // if foo(z) prints something then it will print twice rather than once
````

## Main Function

**Main function return value**: In C, main must return an int. 0 means normal exit, non-zero means error. In C++, main can omit return statement and compiler adds return 0. Return value of main is used by OS or other programs to check status of program.

**Main function accept arguments**: 

You can use this to get `main` function to accept arguments:

```c
int main (int argc, char *argv[])
```

- `argc` (count) will contain the number of strings on the command line(the executable counts as one, plus one for each arguments). Here `argc` is 2:

```bash
unix% sort myFile
```

- `argv` (vector) is a pointer to an array containing the arguments as strings.

**New Bing helps to explain**

- argc is an int that stores the number of command line arguments passed to your program, including the name of the program itself. For example, if you run your program as `./my_program hello world`, then argc will be 3.
- argv is an array of char pointers that store the values of the command line arguments as strings. For example, if you run your program as `./my_program hello world`, then argv will be `{"./my_program", "hello", "world"}`. You can access each argument by using its index in the array, such as argv[0], argv[1](https://www.geeksforgeeks.org/command-line-arguments-in-c-cpp/), etc.

You can use argc and argv to perform different actions depending on the input given by the user. For example, you can write a program that prints its own name and all the arguments it receives, like this:

```c
#include <stdio.h>

int main(int argc, char *argv[])
{
  int i;
  for (i = 0; i < argc; i++)
  {
    printf("%s\n", argv[i]);
  }
  return 0;
}
```

## C Standard Versions

There are several versions of C standard: *ANSI C*  --> *C99* --> *C11(C18)*

You can use macro `__STDC_VERSION__` to examine the version you're currently working with:

```c
printf("ld\n", __STDC_VERSION__);
```

## True and False

**False**: The following things can be regarded as false in C:

- 0(integer)
- NULL(pointer)
- Boolean types(provided by C99's `stdbool.h`)

**True**

- Anything else except the items listed above.

## Declaration

**Must declare the type of data a variable will hold**.

Types cannot be changed after declaration! 

Common types usually used:

<img src=".\cs61c_pics\usualTypes.png" style="zoom:75%;" />



## Integers

- `int` must be integer type that target processor works with most efficiently in C.

- Only guarantee:

  - sizeof(long long) >= sizeof(long) >= sizeof(int) >= 32 bits

  - Also, `short` >= 16 bits, `long` >= 32 bits.
  - All could be 64 bits.
  - This is why using `intN_t` and `uintN_t` is encouraged!!!

**NBE(new bing explaination)**

The reason why C language only guarantees that sizeof(long long) >= sizeof(long) >= sizeof(int) >= 32 bits is because C was originally designed for different architectures and compilers that had different word sizes and memory models. The standard only defines the minimum ranges for each of these types, but not their exact sizes. This allows C to be portable across different platforms, but also introduces some variability and uncertainty.

For example, on a 16-bit machine, int might be 16 bits and long might be 32 bits. On a 32-bit machine, int and long might both be 32 bits. On a 64-bit machine, int might be 32 bits and long might be 64 bits. Or they might have different sizes depending on the compiler options or flags. The only thing that is certain is that int can hold at least 16 bits, long can hold at least 32 bits, and long long can hold at least 64 bits.

If you want to use types that have fixed sizes regardless of the platform or compiler, you can use the types defined in stdint.h header file, such as int32_t, int64_t, etc. These types are guaranteed to have the specified number of bits and no padding.



## Consts and Enums

- Const: constant is assigned a typed of value once in the declaration; values can not change during execution of program.

```c
const int days_in_week = 7;
```

- Enum:  a group of related integer constants.

```c
enum color {RED, GREEN, BLUE};
enum color {RED = 1, GREEN = 2, BLUE = 4};
```

## Structs in C

**Define a New TYPE**

`typedef` allows you to define new types:

```c
typedef uint_8 BYTE;
BYTE b1, b2;
```

**Struct **

Structs are structured groups of variable.

```c
typedef struct {
    int length_in_seconds;
    int year_recorded;
} SONG;

SONG song1;
song1.length_in_seconds = 213;	// using dot notation
song1.year_recorded = 1998;
```

## Undefined Behavior

A lot of C has "Undefined Behavior":

<img src=".\cs61c_pics\UnpredictbleBehavior.png" style="zoom:75%;" />



## Pointer

**Address**: An address points to a particular memory location.

**Pointer**: A variable that contains the address of a variable.

**Pointer Syntax**:

```c
int *p; // variable p is aaddress of an int

p = &y; // assign address of y to p

z = *p // assign value at address in p to z
```

**Pointer Dangers**

Local variables in C are not initialized , they may contain anything! So plz make pointers point to some addresses!

we can make a pointer either:

- make it point to something that already exists.
- allocate room in memory for something new that it will point to.

**Why use pointer?**

- pass pointer is better than pass some big things, like huge arrays or structs.

**Drawbacks**

Memory Leak, Dangling reference...

**Takeaways**

- Pointers are used to point at any data type(`int`, `char`, a `struct`, etc.)

- Normally a pointer can only point to one type.
  - `void *` is a generic pointer.
  - use pointers sparingly to avoid bugs!
- You can even have pointers to functions:

```c
int (*fn) (void *, void *) = &foo;
// (*fn)(x, y) will then call the function
```

**Pointers and Structs**

```c
typedef struct {
    int x;
    int y;
} Point;

Point p1;
Point p2;
Point *paddr;

paddr = &p2;

/* dot notation */
ingt h = p1.x;
p2.y = p1.y;

/* arrow notation */
int h = paddr->x; //mostly used
int h (*paddr).x;

/* This makes values of p2's crews equal to p1 */
p1 = p2; // unlike java, they don't point to a same address
```

**The NULL pointer**

If you try to write or read a null pointer, you program will crash.

"The pointer of all 0s is NULL pointer".

You can create NULL pointer as follows:

```c
int *p = NULL; // create a null pointer
int *q = 0; // another way to create a null pointer
```

To verified if a pointer is a NULL pointer:

```c
if(!p) { /* P is a null pointer*/ }
```

You can also assign a null pointer to another pointer to make it point to nothing. For example:

```c
p = q; // both p and q are now null pointers
```

However, you should never try to **dereference or access** the value pointed by a null pointer, as it will cause undefined behavior and may crash your program. For example:

```c
int x = *p; // wrong! p is a null pointer
*p = 10; // wrong! p is not pointing to any valid memory location
```

**Pointing to Different Size Objects**

<img src=".\cs61c_pics\Pointing2DiffSizeObj.png" style="zoom:75%;" />

### **sizeof()**

`sizeof(type)` returns numbers of bytes in object, including any padding needed for alignment.

- By standard C99, `sizeof(char) == 1`;
- Can take `sizeof(arg)` and `sizeof(structtype)`;

```c
intar[3];
sizeof(ar) // 12
```



**Pointer Arithmetic**

- pointer + n: Adds `n*sizeof(the obj is pointed to)` to the memory address.
- pointer - n: Similar to above.

**Using Function to Change Values**

Simply use pointer to do so.

```c
void addOne(int *p) {
    *p = *p + 1;
}

int y = 3;
addOne(&y);  // pass the address of y!
```

**Change a pointer in a function**

- Use a "handler" or pointer to pointer (`**h`):

```c
void IncrementPtr(int **h) {
    *h = *h + 1; // increase the pointer which pointed by the handler 
}

int A[3] = {50, 60, 70};
int *q = A;	// q is pointing to "50"
IncrementPtr(&q); // pass the address of the pointer!
printf("*q = %d\n", *q); // now q is pointing to "60"!
```

**map**

You can write general procedures that consume other functions.

<img src=".\cs61c_pics\map.png" style="zoom:75%;" />

## Arrays

An array just a block of memory.

**Declaration**: `int ar[2];`

**Declaration and Initialization**: `int ar[] = {3, 4};`

**Accessing Elements**: `ar[num];`

**Array are (almost) identical to pointers**: An array variable is a "pointer" to the first element.

- `ar[0]` is the same as `*ar`
- `ar[2]` is the same as `*(ar+2)`

**Valid Array**: Declared arrays are only allocated while the scope is valid.  

**Single Source of Truth**: 

Utilize a variable for declaration & increment:

```c
int ARRAY_SIZE = 10;
int i, a[ARRAY_SIZE];
for(i = 0; i < ARRAY_SIZE; i++) {
    ...
}
```

**An array doesn't know its own length!** 

- So we can accidentally access off the end of an array.
- Avoidance: We must pass the array **and its size** to a procedure which is going to traverse it.
- Exception: since strings are always terminated with a 0, so you can keep reading until you get to 0.

**Segmentation faults**: A segment kind of is a way to your access space. A segmentation fault says you are reading a wrong memory that you don't have access to.

**Bus errors**: A bus error means your alignment is wrong. e.g. looking at the address of an integer isn't 0, 4, 8, C.

## Dynamic Memory Allocation

To allocate room for something new to point to, use `malloc()` with the help of *typecast* and `sizeof()`:

```c
ptr = (int *) malloc(sizeof(int));
```

To allocate an "array":

```c
ptr = (int *) malloc(n * sizeof(int));
```

**You should remember always check if malloc() failed**:

```c
if(p == 0) {
 ... // do sth if fail   
}
```



Then you need to set value for it.

After dynamically allocating space, we must dynamically **free** it.

```c
free(ptr);
```

**free**: 

Two things you should **never** do:

- `free()` the same thing twice;
- calling `free()` on something you didn't get back from `malloc()`;

**A memory leak** in C occurs when a program allocates memory dynamically and doesn't release it when it is no longer needed.

<img src=".\cs61c_pics\malloc()&free().png" style="zoom:75%;" />

**Choosing a block in `malloc()`**

- best-fit: choose the smallest block that is big enough for the request.
- first-fit: choose the first block we see that is big enough.
- next-fit: like first-fit, but remember where we finished searching and resume searching from there.

**realloc()**

```c
int *ip;
ip = (int *) malloc(10 * sizeof(int));
/* Remember, always check for ip == NULL */
...
ip = (int *) malloc(20 * sizeof(int));
/* Remember, always check for ip == NULL */
...
free(ip); // or use realloc(ip, 0);
```

### Perils

- **realloc() may change the memory block your pointer points to!**

```c
struct foo *f = malloc(sizeof(struct foo) * 10);
...
struct foo *g = f;
...
f = realloc(sizrof(struct foo) * 20); // this may result g pointing to invalid memory 
```

- **Never freeing wrong stuff**

```c
struct foo *f = malloc(sizeof(struct foo) * 10);
...
f++;
...
free(f); // this may corrupt its internal storage or erase other data
```

- **Losing the initial pointer!**

```c
int *plk = NULL;
void genPLK() {
    plk = malloc(2 * sizeof(int));
    ...
    plk++ // don't do this! Memory leak waring!
}
```



- **Never double-free**



<img src=".\cs61c_pics\MinCSummary.png" style="zoom:75%;" />

## Allocation v.s. Array

Using dynamic allocation can avoid program crash if it goes fail.

## Heap

Dynamic variable storage, data  lives until deallocated by programmer.

**Note**: it is a different concept from heap in data structure.

Heap is not allocated **contiguously**.

Heap management:

- quicker runtime of `malloc()` and `free()`
- minimal memory overhead
- avoid fragmentation

Heap is biggest source of bugs in C code!

## Stack

Local variable storage, gets bigger as subroutines are called. (Recursion makes it grows big too).

<img src=".\cs61c_pics\stack.png" style="zoom:65%;" />

**Never** return a pointer in the stack!!!

<img src=".\cs61c_pics\rtnPointerIntoStack.png" style="zoom:75%;" />

## Static Storage

Global variables live here for entire program run.

<img src=".\cs61c_pics\Stack&Heap.png" style="zoom:75%;" />

