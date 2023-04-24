# Basic Things about The Course

## 课程资源

- video：fa20：https://inst.eecs.berkeley.edu/~cs61c/fa20/
- lab: sp21：https://inst.eecs.berkeley.edu/~cs61c/sp21/
- project：sp23：https://cs61c.org/sp23/
- lab：
  - lab00：基本配置以及git和vim等，23看起来比较全面
  - lab01，lab02：
    - 推荐先做sp21的lab01或者sp23的lab02，对debug工具比较熟悉以后再做sp21的lab02；
    - 对C语言不熟悉的话可以选择sp23的lab01，练习更多更基础。sp21的lab02更高级；
    - sp23的lab02和sp21的lab01内容类似，内容是教你使用工具来debug之类的东西，不过看起来sp23更全面一些：https://cs61c.org/sp23/labs/lab02/#other-useful-gdb-commands-recommended

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

#### Redirection

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

### More on Vim

- set line number:

````bash
:set number 
````

unset line number:

```bash
:set nu!
```

set and unset relative line number:

```bash
:set relativenumber
:set nornu
```

if you want to go to a specific line you can open the file using:

```bash
vim +20 <filename>
```



**撤销**：`u`

**Delete whole line**: `dd` （删除后的行会在剪贴板里，按`p`可以黏贴）

**去某行**: ` :数字 + Enter键`

**查看当前文件名**： `:f`

**多行缩进**：`:起始行数字,末行数字<` （几个“<”表示向左缩进几个）

**删除单词**：在insert模式下，`Ctrl-W`的效果是**删除一个单词**。这个快捷键也可以在命令行模式和Ex模式中使用。

**剪切选中的部分**：按`v`，然后选中需要的部分，按`d`剪切，按`p`黏贴。

### 自动补全

> Vim 有很多插件和配置可以实现自动补全变量名的功能。以下是几种实现这个功能的方法：
>
> 1. 使用 Vim 原生的关键字补全功能：在插入模式下，按下 `Ctrl-n` 或 `Ctrl-p`，Vim 会根据当前文本内容进行关键字补全，包括变量名、函数名等等。如果有多个补全选项，可以使用 `Ctrl-n` 或 `Ctrl-p` 来切换选择。
> 2. 使用插件：有很多插件可以实现自动补全变量名的功能，例如 `YouCompleteMe`、`UltiSnips`、`Neocomplete` 等等。这些插件可以根据你输入的文本内容和上下文，自动补全变量名、函数名等等。这些插件需要进行配置才能使用，具体可以参考插件的文档。
> 3. 使用外部工具：有一些外部工具可以与 Vim 集成，实现自动补全变量名的功能，例如 `ctags`、`cscope` 等等。这些工具可以生成代码的索引文件，然后在 Vim 中使用插件或者自定义命令来进行关键字补全。这些工具需要进行配置才能使用，具体可以参考工具的文档。



#### Vim查找替换

- 搜索：`/ + <你要找的字符> + Enter`
- 退出搜索高亮（https://blog.csdn.net/wangjun5159/article/details/51190668）

> vim搜索后，匹配的文字会高亮，再次打开文件，还是高亮状态，
>
> 退出高亮使用命令，:nohl
>
> 推测是no high light的缩写

source: https://harttle.land/2016/08/08/vim-search-in-file.html

以及：

>在 Vim 中，你可以使用 `/` 命令来查找文档中的文本，然后使用 `n` 命令在文档中跳转到下一个匹配项。对于选中的一块区域，你可以使用 `y` 命令将其复制到剪贴板中，然后将其用作搜索字符串。
>
>以下是具体步骤：
>
>1. 使用 `v` 键选中一块区域。
>2. 按下 `y` 键将选中的内容复制到剪贴板中。
>3. 按下 `/` 键进入查找模式。
>4. 按下`Ctrl + R + "`粘贴剪贴板中的内容，然后按下回车键进行搜索。
>5. 使用 `n` 命令在文档中跳转到下一个匹配项，使用`N`回到上一项。
>
>如果你想要搜索整个文档而不是当前屏幕，可以在搜索命令前加上 `%`，例如 `/%pasted_text%`。这将搜索整个文档而不是当前屏幕。
>
>另外，如果你想要查找并替换匹配项，可以使用 `:%s/search_string/replace_string/g` 命令。其中 `search_string` 是要查找的字符串，`replace_string` 是要替换的字符串，`g` 表示全局替换。
>
>
>
>- 我想查找文档里所有的 /* YOUR CODE HERE */，但是好像不太奏效.
>
>
>
>如果你想在 Vim 中查找 `/* YOUR CODE HERE */`，需要注意到这个字符串中包含了正则表达式的特殊字符 `/` 和 `*`，需要使用反斜杠 `\` 进行转义。
>
>你可以使用以下命令在 Vim 中查找这个字符串：
>
>```
>/\/\*\s*YOUR CODE HERE\s*\*\/
>```
>
>其中：
>
>- `\/` 匹配 `/` 字符。
>- `\*` 匹配 `*` 字符，需要使用反斜杠转义。
>- `\s*` 匹配任意数量的空格字符（包括空格、制表符等）。
>- `YOUR CODE HERE` 是要查找的字符串。
>- `\*\/` 匹配 `*/` 字符序列，需要使用反斜杠转义。
>
>这个命令会在文档中查找所有形如 `/* YOUR CODE HERE */` 的字符串，无论它们是否在同一行上。如果你只想查找当前行中是否存在这个字符串，可以使用 `/\* YOUR CODE HERE \*/` 命令。注意这里字符串前后的空格字符需要精确匹配。

#### C语言排版

您可以使用以下步骤来设置 vim 的 C 语言缩进选项，并确保所有缩进都是 4 个空格：

1. 打开您要编辑的 C 语言源代码文件，并进入 vim 编辑器。
2. 按下 `Esc` 键，以确保您处于命令模式。
3. 输入以下命令，以设置缩进选项：

```
:set expandtab
:set tabstop=4
:set shiftwidth=4
```

`set expandtab` 命令将制表符转换为等效的空格，并使用空格进行缩进。

`set tabstop=4` 命令将制表符宽度设置为 4 个空格。

`set shiftwidth=4` 命令将缩进宽度设置为 4 个空格。

1. 按下 `Esc` 键，然后输入 `:wq` 命令，以保存更改并退出 vim 编辑器。

现在，您应该可以在 vim 中使用这些选项来编辑 C 语言源代码，并确保所有缩进都是 4 个空格。

更多设置请见：<a href="https://blog.csdn.net/weixin_44070137/article/details/107294439">this link</a>

##### 一劳永逸

您可以将这些 vim 编辑器选项添加到您的 vim 配置文件中，以便每次打开 vim 编辑器时都自动遵循这些规定。

1. 打开您的 vim 配置文件。如果您使用的是 Linux 或 macOS，您可以使用以下命令打开 `~/.vimrc` 文件：

```
vim ~/.vimrc
```

如果您使用的是 Windows，您可以打开 `~/_vimrc` 文件。

**找不到.vimrc？**

看<a href="https://stackoverflow.com/questions/10921441/where-is-my-vimrc-file">这里</a>，把vimrc复制到自己的目录下并重命名为`.vimrc`：

```
cp /etc/vim/vimrc ~/.vimrc
```

2. 在文件的末尾，添加以下行：

```
set expandtab
set tabstop=4
set shiftwidth=4
```

3. 保存并关闭文件。

现在，每次您打开 vim 编辑器时，它都会自动遵循这些选项，确保所有缩进都是 4 个空格。



### Vim分屏

> - 我现在正在使用vim编辑test.c文件，请教我如何切换到state.c查看里面的内容
>
> 
>
> 您可以使用vim的内置命令来切换到另一个文件。在vim的命令模式下，输入`:e state.c`，然后按下回车键即可打开state.c文件。
>
> 如果您想在当前vim窗口中打开state.c文件，则可以使用水平分割窗口的命令`:sp state.c`或垂直分割窗口的命令`:vsp state.c`。这将在当前vim窗口中创建一个新的分割窗口，并在其中打开state.c文件。
>
> 要在不同的窗口之间移动，请使用vim的窗口命令。例如，要在水平分割的窗口之间移动，请使用`Ctrl-w j`和`Ctrl-w k`，其中`j`和`k`是向下和向上移动的方向键。要在垂直分割的窗口之间移动，请使用`Ctrl-w h`和`Ctrl-w l`，其中`h`和`l`是向左和向右移动的方向键。
>
> 注意，为了使用这些命令，您需要先进入vim的命令模式，通过按下`Esc`键来退出插入模式或其他模式。
>
> 
>
> - 我执行了:e src/state.c，但是E37: No write since last change (add ! to override),怎么回事？
>
> 
>
> 这个错误消息通常是因为您在当前文件中进行了更改，但没有保存更改，因此Vim不允许您切换到另一个文件，以防止因此丢失更改。
>
> 为了解决这个问题，您可以执行以下两个操作之一：
>
> 1. 保存当前文件并切换到另一个文件：在命令模式下，输入`:w`保存当前文件，然后再次输入`:e src/state.c`以切换到另一个文件。
> 2. 放弃对当前文件的更改并切换到另一个文件：在命令模式下，输入`:e! src/state.c`。这将放弃对当前文件的更改并强制打开另一个文件。
>
> 请注意，在第二种情况下，您将失去对当前文件的任何更改，因此在执行此操作之前，请确保您不再需要对当前文件进行任何更改。
>
> 
>
> - 我使用了`:vsp state.c`，但是现在state.c在左边，test.c在右边，我该怎么交换它们的位置？
>
> 
>
> 要交换水平分割窗口中两个窗口的位置，您可以使用vim的窗口命令。在命令模式下，将光标移到要交换的窗口上，然后按下`Ctrl-w x`。这将交换当前窗口和相邻窗口的位置，从而改变它们在水平分割窗口中的顺序。
>
> 在您的情况下，您可以按下`Ctrl-w x`来交换左右两个窗口的位置，将state.c窗口移动到右边。
>
> 请注意，在使用水平分割窗口时，`Ctrl-w`是一个前缀键，用于执行窗口命令。在这种情况下，您需要按下`Ctrl-w`并保持按下状态，然后按下`x`来交换窗口的位置。
>
> 
>
> - 执行命令`:vsp state.c`之后怎么更改窗口之间的大小比例？
>
> 
>
> 在命令模式下，您可以使用`Ctrl-w`命令和数字键来指定窗口大小的增量。例如，如果您想将当前窗口向右增加5个字符的宽度，可以按下`Ctrl-w 5 >`。如果您想缩小窗口，可以使用`Ctrl-w`命令和`-`键，例如`Ctrl-w 5 -`会将当前窗口减小5个字符的宽度。
>
> 您还可以使用`Ctrl-w`命令和箭头键来调整窗口大小。例如，要将当前窗口向右移动3个字符，可以按下`Ctrl-w 3 l`。类似地，`Ctrl-w 3 h`将向左移动窗口，`Ctrl-w 3 j`将向下移动窗口，`Ctrl-w 3 k`将向上移动窗口。
>
> 如果您想要更自由地调整窗口大小，可以使用鼠标拖动窗口边缘的方法。在命令模式下，将光标移到窗口边缘上，然后按住左键并拖动即可。
>
> 
>
> - 能不能输入一个命令让它们的窗口各占50%？
>
> 
>
> 在命令模式下，将光标移到要调整大小的窗口上（在您的情况下，应该是test.c窗口或state.c窗口中的任意一个），然后按下`Ctrl-w`键并按住不放，接着按下`=`键两次，即`Ctrl-w = =`。这将使两个窗口各占50%的宽度，从而实现水平分割窗口的均分。
>
> 请注意，在使用水平分割窗口时，`Ctrl-w`是一个前缀键，用于执行窗口命令。在这种情况下，您需要按下`Ctrl-w`并保持按下状态，然后按下`=`键两次来实现窗口大小的均分。
>
> 希望这可以帮助您让两个窗口各占50%的宽度。



### 打造Vim C IDE

check <a href="https://github.com/WilsonQ1n/VIM_C_IDE">this link</a>



### C debugger in command line

#### **CGBD**

You will find the [GDB reference card useful](https://inst.eecs.berkeley.edu/~cs61c/sp21/resources-pdfs/gdb5-refcard.pdf). GDB stands for “GNU De-Bugger.” 

To use the debugger, compile `hello.c` with the `-g` flag:

```
$ gcc -g -o hello hello.c
```

This causes `gcc` to store information in the executable program for `gdb` to make sense of it. Now start our debugger, (c)gdb:

```
$ cgdb hello
```

##### switch mode

In cgdb, you can press `ESC` to go to the code window (top) and `i` to return to the command window (bottom) — similar to vim. The bottom command window is where you’ll enter your gdb commands.

##### **Quit**

To quit, use `q` command.

To quit GDB, you can use the `quit` command or its shortcut `q` in GDB. This will exit GDB and terminate the program being debugged. If you want to quit GDB without terminating the program, you can use the `detach` command first, which will detach GDB from the program and let it continue running.

Alternatively, you can also attach GDB to a running program using the `--pid` option when launching GDB. For example, `gdb --pid=1234` will attach GDB to the program with process ID 1234. In this case, quitting GDB will not terminate the program.

##### **Set Args**

- Using **Redirection**:

```bash
echo "args" > filename.txt
cgbd xxx.c
# after cgbd is open:
run < filename.txt
```



- You can use the `set args` command in GDB before running the program. For example, `set args arg1 arg2 arg3` will set the arguments to `arg1`, `arg2`, and `arg3`. You can also use `show args` to see the current arguments.
- Or you can use the `--args` option when launching GDB with the program name. For example, `gdb --args executablename arg1 arg2 arg3` will start GDB with the program `executablename` and the arguments `arg1`, `arg2`, and `arg3`.

##### Kill

 you can also use the `kill` command to terminate the program being debugged. This will send a SIGKILL signal to the program and end its execution. You can then restart it with the `run` command or its shortcut `r`.

##### **Breakpoint**

- To set a breakpoint at a specific line of source code, you can use the break command with the line number as an argument:

```
break 10
```

- This will create a breakpoint with an ID number and show some information about it. You can also use the shortcut `F8` to set a breakpoint at the current line of source code.
- To set a breakpoint at a specific function, you can use the break command with the function name as an argument:

```
break main
```

- This will create a breakpoint with an ID number and show some information about it. You can also use the shortcut `F9` to set a breakpoint at the current function.
- To set a breakpoint at a specific address or offset, you can use the break command with an asterisk (*) followed by the address or offset as an argument. For example, if you want to set a breakpoint at address 0x4005d4, you can type:

```
break *0x4005d4
```

- This will create a breakpoint with an ID number and show some information about it.
- To set a conditional breakpoint, you can use the break command with an if clause followed by an expression as an argument. For example, if you want to set a breakpoint at line 10 of hello.c only if x is equal to 5, you can type:

```
break 10 if x == 5
```

- This will create a breakpoint with an ID number and show some information about it. The breakpoint will only trigger if the expression evaluates to true.
- To list all the breakpoints that you have set, you can use the info breakpoints command. This will show the ID number, type, location, condition, and status of each breakpoint. You can also use the shortcut `F2` to toggle the display of breakpoints in the source code window.
- 查看所有断点：

```
info breakpoints
```

- To delete a breakpoint, you can use the delete command with the ID number of the breakpoint as an argument. For example, if you want to delete breakpoint 1, you can type:

```bash
delete 1  #数字代表第"n"个断点（用info breakpoints查看）
delete #删除所有断点
```

- This will delete the breakpoint and show a confirmation message. You can also use the shortcut `F7` to delete all breakpoints.

##### **Single step cmd**

To use the single-step command in CGDB, you need to switch to GDB mode first. You can do this by pressing the `cgdbmodekey`, which is defaulted to the `ESC` key. Then you can use the same commands as in GDB to single-step through the program. The most common ones are:

- `next` or `n` to execute the next line of code, <u>stepping over function calls</u>
- `step` or `s` to execute the next line of code, <u>stepping into function calls</u>
- `finish` or `f` to execute until the current function returns
- `continue` or `c` to resume execution until the next breakpoint or end of program

To switch back to source mode, you can press the `cgdbmodekey` again.

##### **Debug**

- To print the value of a variable or an expression in GDB, you can use the `print` command or its shortcut `p` followed by the variable name or the expression. For example, `print x` will print the value of the variable `x`, and `print 1+2` will print the value of the expression `1+2`.
- To configure GDB so it displays the value of a variable after every step, you can use the `display` command followed by the variable name. For example, `display x` will display the value of the variable `x` after every step. You can also use expressions with the `display` command. To remove a display, you can use the `undisplay` command followed by the display number.
- To show a list of all local variables and their values in the current function, you can use the `info locals` command in GDB. This will print all the local variables that are in scope and their values. Note that you need to compile your program with debugging symbols (e.g. using `-g` option with gcc) for this command to work.
- **回溯错误发生的代码处**：If you see "Segmentation fault (core dumped)", this means that your program crashed. One way to start debugging is by starting CGDB, `run`ning the program with no breakpoints, and then typing `backtrace` or `bt` to see what line of code the program crashed at.

##### 设置条件断点

- 要设置条件断点，您可以使用以下语法：

```c
break <location> if <condition>
```

其中，`<location>`表示要设置断点的位置，可以是函数名、行号、地址等；`<condition>`表示要满足的条件，可以是任何有效的C表达式。

例如，如果您想在main函数的第10行设置一个断点，只在变量x等于5时停止程序，您可以这样写：

```c
break main:10 if x == 5
```



- 如果您已经设置了一个断点，想给它添加一个条件，您可以使用以下语法：

```c
condition <breakpoint number> <condition>
```

其中，`<breakpoint number>`表示要添加条件的断点的编号；`<condition>`表示要满足的条件，可以是任何有效的C表达式。

例如，如果您想给第2个断点添加一个条件，只在字符串x等于"hello"时停止程序，您可以这样写：

```c
condition 2 $_streq(x, "hello")
```

#### 进程卡死

当你按下 `Ctrl-Z` 键后，cgdb 进程就会被挂起，并且返回一个终端提示符。此时，你可以使用 `fg` 命令将 cgdb 进程重新激活并恢复到前台。具体步骤如下：

1. 按下 `Ctrl-Z` 键。
2. 输入 `bg` 命令将 cgdb 进程放入后台。
3. 输入 `jobs` 命令查看后台任务的状态和编号。
4. 输入 `fg` 命令将 cgdb 进程重新激活并恢复到前台。



如果你想彻底结束 cgdb 进程，可以按下 `Ctrl-C` 键或者使用 `kill` 命令来结束进程。

你可以使用以下方法彻底结束 cgdb 进程：

1. 在 cgdb 的命令窗口中按下 `Ctrl-C` 键，该命令可以终止正在运行的程序并退出 cgdb。

2. 在终端中使用 `kill` 命令结束 cgdb 进程。首先，你需要使用 `ps` 命令查找 cgdb 进程的 PID（进程ID），然后使用 `kill` 命令结束该进程。具体步骤如下：

   a. 打开终端并输入 `ps aux | grep cgdb` 命令查找 cgdb 进程的 PID。

   b. 在输出结果中找到 cgdb 进程的 PID，并记录下来。

   c. 使用 `kill <PID>` 命令结束 cgdb 进程，其中 `<PID>` 为进程的 PID。

   注意：如果 cgdb 进程无法正常结束，你可以使用 `kill -9 <PID>` 命令来强制结束进程。

3. 如果以上方法都无法结束 cgdb 进程，你可以尝试重启操作系统来结束所有进程。

## Other Useful GDB Commands (Recommended)

### Command: `info locals`

Prints the value of all of the local variables in the current stack frame

### Command: `command`

Executes a list of commands every time a break point is reached. For example:

Set a breakpoint:

```txt
b 73
```

Type `commands` followed by the breakpoint number:

```txt
commands 1
```

Type the list of commands that you want to execute separated by a new line. After your list of commands, type `end` and hit Enter.

```txt
p var1
p var2
end
```

## Valgrind

检查内存泄漏。

https://valgrind.org/docs/manual/mc-manual.html

## Makefile

以`lab02`为例：

1. Which target is part of a rule that deletes all the compiled programs?
   这个问题的中文翻译是：“哪个目标是一个规则的一部分，用于删除所有已编译的程序？”
   答案是：clean。
   解释：Makefile 中的规则通常包括一个或多个目标和相关的命令。在这个 Makefile 中，第 46 行的规则定义了一个名为 "clean" 的目标，它的命令行将删除所有已编译的程序。在命令行中，使用了通配符`*`来匹配所有的已编译程序，以及一些其他文件，如生成的 core 文件和临时文件。因此，运行 `make clean` 将会删除所有已编译的程序和其他生成的文件，以便重新编译整个程序。
2. Which target is part of a rule that makes all the compiled programs?
   这个问题的中文翻译是：“哪个目标是一个规则的一部分，用于编译所有的程序？”
   答案是：all。
   解释：Makefile 中有一个默认目标 `all`，它是在没有指定目标时执行的默认目标。在这个 Makefile 中，第 26 行的规则定义了一个名为 `all` 的目标，它依赖于所有的可执行文件（在第 24 行定义），一旦所有的可执行文件都被编译成功，`all` 目标的命令行就会被执行。因此，运行 `make` 或 `make all` 将会编译所有的程序，包括 `vector-test`、`bit_ops` 和 `lfsr`。
3. Which compiler is currently being used?
   这个问题的中文翻译是：“当前正在使用哪个编译器？”
   答案是：gcc。
   解释：在 Makefile 中，第 2 行定义了编译器变量 `CC` 为 `gcc`。变量 `CC` 被用于编译 `.c` 文件。因此，所有的 `.c` 文件都将通过 `gcc` 编译器进行编译。
4. What C standard are we currently using?
   这个问题的中文翻译是：“我们目前正在使用哪个 C 标准？”
   答案是：C99 标准。
   解释：在 Makefile 中，第 4 行定义了 CFLAGS 变量，其中包括 `-std=c99` 选项。这个选项告诉编译器按照 C99 标准进行编译。因此，我们目前正在使用 C99 标准。
5. How would we reference a variable “FOO” in a makefile?
   这个问题的中文翻译是：“我们如何在 Makefile 中引用变量“FOO”？”
   答案是：使用 `$FOO` 或 `$(FOO)`。
   解释：在 Makefile 中，我们可以定义变量并在规则中使用它们。要在规则中引用变量 FOO，我们可以使用 `$FOO` 或 `$(FOO)` 的形式。例如，如果我们在 Makefile 中定义了变量 `FOO`，可以在规则中使用 `$(FOO)` 来引用它。
6. What operating system does the term “Darwin” represent?
   这个问题的中文翻译是：“术语“Darwin”代表哪个操作系统？”
   答案是：macOS。
   解释：在 Makefile 中，第 7 行使用 `uname` 命令获取当前操作系统的名称，并将其存储在变量 `UNAME_S` 中。在第 8 行，我们检查变量 `UNAME_S` 是否等于 `Darwin`，如果是，则说明当前操作系统是 macOS。Darwin 是 macOS 的底层操作系统内核，因此在 Makefile 中，我们使用 `Darwin` 来代表 macOS 操作系统。
7. What line creates the lfsr program from its object files? (Give its line number.)
   这个问题的中文翻译是：“哪一行从目标文件创建 lfsr 程序？（给出行号。）”
   答案是：第 42 行。
   解释：在 Makefile 中，第 42 行定义了一个规则来创建 `lfsr` 程序。这个规则指定了 `lfsr` 目标，它依赖于 `lfsr.o` 目标和 `bit_ops.o` 目标，并且在命令行中使用这些目标来创建可执行文件 `lfsr`。因此，运行 `make lfsr` 将会创建 `lfsr` 可执行文件。

- Makefile清理之前生成的文件：`make clean`

 

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

## Bit Operations

https://www.runoob.com/cprogramming/c-operators.html

**异或**：

- `0 ^ x`：x不变

- `1 ^ x` :  x取反

应用：

```c
// Flip the nth bit of the value of x.
// Assume 0 <= n <= 31
void flip_bit(unsigned * x,
              unsigned n) {
    // YOUR CODE HERE
    *x ^= (1u << n);
}
```

**置位**：

- 先用掩码处理对应的位，然后再位与 / 位或：

```c
// Set the nth bit of the value of x to v.
// Assume 0 <= n <= 31, and v is 0 or 1
void set_bit(unsigned * x,
             unsigned n,
             unsigned v) {
    // 法一：先置1，再位与
    unsigned mask = 1u << n;
    *x = (*x | mask) & (v << n);
    
    // 法二：先置0，再位或
    unsigned mask2 = ~(1u << n);
    *x = (*x & mask2) | (v << n);
}
```





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

**Optional: `typedef`s**

Sometimes, you may see a `typedef` when declaring a struct:

```c
typedef struct {
    int id;
} Student;
```

In these cases, you may use `Student` as the type instead of `struct Student`. We won't go into detail here, but feel free to check out [this link](https://stackoverflow.com/questions/1675351/typedef-struct-vs-struct-definitions) if you're interested.

## Undefined Behavior

A lot of C has "Undefined Behavior":

<img src=".\cs61c_pics\UnpredictbleBehavior.png" style="zoom:75%;" />

## String

**String literal** ：C语言的string literal是一种用双引号括起来的字符序列，例如"Hello"。它表示一个字符串的常量值，也就是说，它在程序中不能被修改。string literal通常存储在只读的内存区域，如果试图改变它的内容，可能会导致错误或异常。string literal可以用来初始化字符数组或指向字符的指针，例如：

```c
char arr[] = "Hello"; // 初始化一个字符数组`
`char *ptr = "World"; // 初始化一个指向字符的指针
```

string literal还可以用来作为printf()等函数的参数，例如：

```c
printf("Hello World\n"); // 打印一个string literal
```





> - 如果我初始化了一个字符指针：char *ptr = "World"; // 初始化一个指向字符的指针，我可以这样改变它的值吗？ ptr = "hello";
>
> 
>
> 是的，你可以这样改变指针的值。这样做的意思是让指针ptr指向一个新的string literal，即"hello"。这不会改变原来的string literal，即"World"，它仍然存在于内存中，只是没有指针指向它了。你也可以用其他的指针变量来指向不同的string literal，例如：
>
> ```
> char *ptr1 = "World"; // 初始化一个指向字符的指针`
> `char *ptr2 = "hello"; // 初始化另一个指向字符的指针`
> `ptr1 = ptr2; // 让ptr1指向ptr2所指向的string literal
> ```
>
> 这样做之后，ptr1和ptr2都指向"hello"，而"World"没有任何指针指向它了。
>
> 
>
> - 那`ptr = "hello";` 和`*ptr = "hello";` 有什么区别？
>
> 
>
> ptr = "hello";是把ptr指向"hello"这个string literal，而 \*ptr = "hello";是试图把"hello"这个string literal赋值给\*ptr所指向的位置。但是，\*ptr所指向的位置是一个只读的内存区域，不能被修改，所以*ptr = "hello";会导致错误或异常。你不能用赋值语句来改变string literal的内容，只能改变指针的指向。
>
> see <a href="#immutable_string">more</a>

## Segfault

A segfault occurs when you try to access a piece of memory that "does not belong to you." There are several things that can cause a segfault including

1. Accessing an array out of bounds. Note that accessing an array out of bounds will not always lead to a segfault. The index at which a segfault will occur is somewhat unpredictable.
2. Derefrencing a null pointer.
3. Accessing a pointer that has been `free`'d (`free` is not in the scope of this lab).
4. Attempting to write to read-only memory. For example, strings created with the following syntax are read only. This means that you cannot alter the value of the string after you have created it. In other words,**<span id ="immutable_string"> it is immutable</span>**.

```c
char *my_str = "Hello";
```

However, a string created using the following syntax is mutable.

```c
char my_str[] = "hello";
```

Why is the first string immutable while the second string is mutable? The first string is stored in the data portion of memory which is read-only while the second string is stored on the stack.



## Pointer

**Address**: An address points to a particular memory location.

**Pointer**: A variable that contains the address of a variable.

**Pointer Syntax**:

```c
int *p; // variable p is aaddress of an int

p = &y; // assign address of y to p

z = *p // assign value at address in p to z
    
int *ptr = &x;
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
int h = p1.x;
p2.y = p1.y;

/* arrow notation */
int h = paddr->x; //mostly used
int h = (*paddr).x;

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

**Dereference**: The dereference operator is also known as an indirection operator, which is represented by (*). When indirection operator (*) is used with the pointer variable, then it is known as **dereferencing a pointer.** When we dereference a pointer, then the value of the variable pointed by this pointer will be returned.

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



### Double pointer

> - 请告诉我C语言什么时候使用double pointer比使用single pointer更好？
>
> C语言中使用double pointer比使用single pointer更好的情况有以下几种：
>
> 1. 如果你想要在一个函数中修改一个指针变量的值，你需要传递一个指向指针的指针，也就是double pointer。例如，如果你想要在一个函数中为一个指针变量分配内存，你需要传递一个double pointer，否则你只能修改函数内部的指针副本，而不会影响函数外部的指针变量。例如：
>
> ```c
> void allocate(int **ptr) { // 接收一个double pointer`
> 	*ptr = malloc(sizeof(int)); // 修改指向的指针的值`
> }
> 
> int main() {
> 	int *p = NULL; // 定义一个single pointer`
> 	allocate(&p); // 传递一个double pointer`
> 	// 现在p指向了一块分配的内存`
> }
> ```
>
> 2. 如果你想要创建一个二维数组或者一个指针数组，你需要使用double pointer。例如，如果你想要创建一个3x4的二维数组，你可以这样做：
>
> ```c
> int **arr = malloc(3 * sizeof(int *)); // 分配三个指针的空间`
> for (int i = 0; i < 3; i++) {
> 	arr[i] = malloc(4 * sizeof(int)); // 分配四个整数的空间`
> }
> // 现在arr是一个double pointer，可以用arr[i][j]来访问元素
> ```
>
> 3. 如果你想要实现一些复杂的数据结构，如链表，树，图等，你可能需要使用double pointer来操作节点之间的连接。例如，如果你想要删除一个链表中的某个节点，你可以这样做：
>
> ```c
> void delete(struct node **head, int value) { // 接收一个double pointer
> 	struct node *current = *head; // 获取头节点
> 	struct node *prev = NULL; // 获取前驱节点
>     
> 	while (current != NULL && current->data != value) { // 遍历链表
> 		prev = current; // 更新前驱节点
> 		current = current->next; // 更新当前节点
>  	}
>     
> 	if (current != NULL) { // 找到了要删除的节点
> 		if (prev == NULL) { // 要删除的节点是头节点
> 			*head = current->next; // 修改头节点的值
> 		} else { // 要删除的节点不是头节点
> 			prev->next = current->next; // 修改前驱节点的next指针
> 		}
>         
> 		free(current); // 释放当前节点的内存
>     }
> }
> ```
>
> 
>
> - 我想要知道为什么使用double pointer比使用single pointer更好的这些情况的原因，请通俗易懂一点
>
> 
>
> 好的，我会尽量用简单的语言来解释给你。你可以把指针想象成一个箭头，它指向某个内存地址，也就是某个变量的位置。如果你想要改变指针的指向，你就需要改变箭头的方向。但是，如果你把指针作为一个参数传递给一个函数，函数只能拿到一个箭头的副本，也就是一个新的箭头，它和原来的箭头指向同一个位置。如果你在函数中改变这个新箭头的方向，它不会影响原来的箭头，因为它们是两个不同的箭头。所以，如果你想要在函数中改变指针的指向，你需要传递一个指向指针的指针，也就是一个double pointer。这样，函数就能拿到一个指向箭头的箭头，也就是一个新的double pointer，它和原来的double pointer指向同一个single pointer。如果你在函数中改变这个新double pointer所指向的single pointer的方向，它就会影响原来的single pointer，因为它们是同一个箭头。
>
> 同理，如果你想要创建一个二维数组或者一个指针数组，你需要使用double pointer。因为二维数组或者指针数组其实就是一个数组，它的每个元素都是一个single pointer。如果你想要访问二维数组或者指针数组中的某个元素，你需要两个索引，一个表示行号，一个表示列号。这两个索引其实就是两个single pointer，第一个single pointer用来找到对应行的single pointer，第二个single pointer用来找到对应列的值。所以，你需要一个double pointer来存储这些single pointer。
>
> 最后，如果你想要实现一些复杂的数据结构，如链表，树，图等，你可能需要使用double pointer来操作节点之间的连接。因为这些数据结构都是由一些节点组成的，每个节点都有一些数据和一些指向其他节点的single pointer。如果你想要修改节点之间的连接关系，比如插入或删除某个节点，你需要改变一些single pointer的方向。但是，如果你只有单层指针，你只能访问到当前节点和它所指向的下一个节点。如果你想要访问到当前节点的前驱节点或者其他相关节点，你就需要有一个double pointer来存储这些single pointer。
>
> 我希望这样能让你理解为什么使用double pointer比使用single pointer更好的这些情况。如果你还有其他问题，请随时提出。



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



> In C, you can create an array using either the `malloc` function or the array declaration syntax `[]`. However, the choice between the two depends on your specific use case and requirements.
>
> Here are some factors to consider:
>
> 1. Size: If you need to create an array of a fixed size, you can use the array declaration syntax, such as `int a[10];`, where `a` is an array of 10 integers. This is useful when you know the size of the array at compile time. If you need to create an array of a variable size, you can use the `malloc` function to allocate the memory at runtime, based on the size you need.
> 2. Memory management: When you use the array declaration syntax, the memory for the array is allocated on the stack, which means it is automatically deallocated when the function that contains the array exits. On the other hand, when you use `malloc`, the memory is allocated on the heap, and you need to explicitly free the memory using the `free` function when you are done with it. This makes `malloc` more flexible, but also requires more careful memory management.
> 3. Pointer arithmetic: When you use the array declaration syntax, you can use pointer arithmetic to access and manipulate the elements of the array. For example, `a[3]` is equivalent to `*(a+3)`. When you use `malloc`, ~~you need to use pointer arithmetic to access the elements of the array, which can be more complex~~.(这个错了，两种方法的pointer arithmetic syntax都一样)
>
> In summary, if you know the size of the array at compile time and don't need to do complex pointer arithmetic, you can use the array declaration syntax. If you need to create an array of a variable size at runtime, or need more flexible memory management, you can use `malloc`.

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
ptr = (int *) malloc(n *sizeof(int));
// check after malloc!
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

## Float Pointer

<img src=".\cs61c_pics\DP.png" style="zoom:75%;" />



![](.\cs61c_pics\FPex&si.png)

<img src=".\cs61c_pics\FP7.5.png" style="zoom:75%;" />

<img src=".\cs61c_pics\FP13.png" style="zoom:75%;" />

<img src=".\cs61c_pics\associative.png" style="zoom:75%;" />

<img src=".\cs61c_pics\precision&accuracy.png" style="zoom:75%;" />

<img src=".\cs61c_pics\round.png" style="zoom:75%;" />

**妙！**

```c
void baz(int x, int y) {
	x = x ˆ y;
    y = x ˆ y;
    x = x ˆ y;
}
```

 How do you write the bitwise exclusive-nor (XNOR) operator in C?

```c
~(x ˆ y);
// better:
x == y;
```

Copies the string src to dst. 

```c
void copy(char* src, char* dst) {
	while (*dst++ = *src++); 
 }
```

(a) An array arr of k integers

`arr = (int *) malloc(sizeof(int) * k); `

(b) A string str containing p characters 

`str = (char *) malloc(sizeof(char) * (p + 1));`

Don’t forget the null terminator! 

(c) An n × m matrix mat of integers initialized to zero. 

`mat = (int *) calloc(n * m, sizeof(int));`

Alternative solution. This might be needed if you wanted to efficiently permute the rows of the matrix. 1 

```c
mat = (int **) calloc(n, sizeof(int *)); 
for (int i = 0; i < n; i++) 
    mat[i] = (int *) calloc(m, sizeof(int));
```



## What is stream in C?

> Okay, let me try to explain it in a simpler way. A stream is like a pipe that connects your program to a source or destination of data. For example, when you type something on your keyboard, the data goes through a pipe called stdin (standard input) and reaches your program. When you want to print something on your screen, the data goes through another pipe called stdout (standard output) and reaches your monitor. There are other pipes that connect your program to files, networks, devices, etc. These pipes are called streams in C. You can use different functions to send or receive data through these streams. For example, printf() is a function that sends data to stdout, and scanf() is a function that receives data from stdin.



## Read Files

**Steps To Read A File:**

- Open a file using the function fopen() and store the reference of the file in a FILE pointer.
- Read contents of the file using any of these functions fgetc(), fgets(), fscanf(), or fread().
- File close the file using the function fclose().

[C programming language ](https://www.geeksforgeeks.org/c-programming-language/)supports four pre-defined functions to read contents from a file, defined in [stdio.h header file](https://www.geeksforgeeks.org/whats-difference-between-and/):

1. [**fgetc()**](https://www.geeksforgeeks.org/fgetc-fputc-c/)**–** This function is used to read a single character from the file.
2. [**fgets()**](https://www.geeksforgeeks.org/fgets-gets-c-language/)**–** This function is used to read strings from files.
3. [**fscanf()**](https://www.geeksforgeeks.org/scanf-and-fscanf-in-c-simple-yet-poweful/)**–** This function is used to read formatted input from a file.
4. [**fread()**](https://www.geeksforgeeks.org/fread-function-in-c/)**–** This function is used to read the block of raw bytes from files. This is used to read binary files.

# RISC-V Assembly

> "... the key difference between mediocre and excellent programmers is whether they know assembly language. "
>
> ​						**-- slashdot.org comment, 2004-02-05**

## Variables

**assembly operands** are registers.

**assembly language has no variable!**

## RISC-V registers

RISC-V has **32 registers**, numbering from 0 ~ 31.  

You can refer them by number **x0** ~ **x31**. Each register can be referred by number or name.

In RV32 variant , each RISC-V register is 32 bits wide (a word wide). 

**x0** is special, always holds value 0;

## Comments

You can use `#` (hash, pound, sharp, octothorpe...) as `//` in C.

## Instructions

In assembly language, each statement is called an **instruction**, and executes exactly one of a short list of simple command.

Each line of assembly contains **at most** 1 instruction.

## Add and Sub

```assembly
add x1, x2, x3 
# add: operation by name 
# x1: destination
# x2: source 1
# x3: source 2
# equal to x1 = x2 + x3

sub x1, x2, x3
# equal to x1 = x2 - x3
```

## Add Immediates

- Numerical constants in assembly is called **Immediates**

- There is only add immediates in RISC-V

```assembly
addi x3, x4, 20
# equal to x3 = x4 + 20

# if you one to sub a immediate:
addi x3, x4, -20
```

- One particular immediate, the number zero:

```assembly
add x3, x4, x0
# equal to x3 = x4

# x0 can be changed IN NO CIRCUMSTANCE!
add x0, x1, x2 # nothing will happen!
```

- Why `addi` exists:

<img src=".\cs61c_pics\whyAddiExist.png" style="zoom:67%;" />

## Data Transfer

**Processor centric**:  Store to Memory or Load from Memory. All the main action happens inside the processor, and the memory is just out there.

**Processor** has data path with the rigisters and ALU inside.

**Memory** stores our program and the data that we work on. It can be viewed as an 1D array starting at 0 with address acting like its index.

**How this work?**

To access a word in memory, processor must: 

- Supply an address calculated by processor; The address is typically specified as **an offset to a base pointer**. So each data array that is laid out in the memory will have its base pointer, and when we would like to access a particular element in that array, we will have to calculate an offset with respect to that base pointer.

<img src=".\cs61c_pics\Data_Transfer.png" style="zoom:80%;" />

**memory address is in bytes!**

<img src=".\cs61c_pics\mmraddrisinbytes.png" style="zoom:67%;" />

## Endian

**RISC-V is little-endian!**

<img src=".\cs61c_pics\little-endian.png" style="zoom:67%;" />

more interesting details about different endian concept in rrl, see <a href="https://www.youtube.com/watch?v=wXGhuhLKkqg&list=PLnvUoC1Ghb7xlWo9AKariMUtROWHjnPiC&index=5">this video</a>!

<img src=".\cs61c_pics\endian-battle.png" style="zoom:80%;" />

## Principle of locality / Memory Hierarchy

<img src=".\cs61c_pics\mmrHierarchy.png" style="zoom:87%;" />

**register v.s. DRAM**

<img src=".\cs61c_pics\DRAMvsRegister.png" style="zoom:67%;" />

## Load from Memory to Register

`lw`: Load Word:

```assembly
lw x10, 12(x15)		# Have to be multiple of 4
add x11, x12, x10

# equal to :
# 	int A[100];
# 	g = h + A[3];
# Note: 
# 	x15 - base register(pointer to A[0])
# 	12 - offset in bytes
# 	offset must be a constant known at assembly time
```

**Processor**     		<img src=".\cs61c_pics\lw_dataflow.png" style="zoom:67%;" />   	**Memory**

## Store from Register to Memory

`sw`: save word:

```assembly
lw x10, 12(x15)	# Have to be multiple of 4
add x10, x12, x10
sw x10, 40(x15)	# Have to be multiple of 4
# equal to :
# 	int A[100];
#	A[10] = h + A[3];
```

Dataflow: Processor -> Memory



## Loading and Storing Bytes

`lb`: load byte;

`sb`: store byte;

```assembly
lb x10, 3(x11)
# equal to :
# 	copy the byte of register x11  whose address offset is 3 
# 	to the low byte position of x10 
```

### Sign Extension

Although we don't know what kind  of data types we are operating, in many cases we will handle `signed` numbers. We have to preserve the sign by **sign extension**.

To implement sign extension, you simply take the most significant bit in the copied byte and smear it all over the upper bytes.

<img src=".\cs61c_pics\sign_extension.png" style="zoom:80%;" />

- In case you don't want sign extension, then there `lbu` (load byte unsigned) is also provided for ya'll. (Warning: no `sbu`  at all!)





## Decision Making / Branch

### Conditional Branch

- `beq`:  branch if equal

```assembly
beq reg1, reg2, L1
# equal to :
# 	if(value in rg1 == value in rg2)
# 		goto statement labeled L1
```

- `bne`: branch if not equal

```assembly
bne reg1, reg2, L1
# equal to :
# 	if(value in rg1 != value in rg2)
# 		goto statement labeled L1
```

- `blt`: if less than

```assembly
blt reg1, reg2, L1
# equal to :
# 	if(value in rg1 < value in rg2)
# 		goto statement labeled L1
```

- `bge`: if greater than or equal
- `bltu` : unsigned version of if less than
- `bgeu`: unsigned version of if greater than or equal

**Note**: No `bgt`or `ble` ! ! !  You can try to memorize this with <u>Sandwich Theory</u>:  

> "There doesn't exist a type of **BGT** sandwich, but there does exist a type of  **BLT** sandwich，where 'BLT' stands for bacon, lettuce and tomato."

### Unconditional Branch

`j`: jump to label

```assembly
j L1  # jump to label L1
```

### Examples

1. `if` Statement :
	
	 |  f   |  g   |  h   |  i   |  j   |
	 | :--: | :--: | :--: | :--: | :--: |
	 | x10  | x11  | x12  | x13  | x14  |

```assembly
# 注意：下面用的是bne命令：		
# ↓ no	yes→
bne x13, x14, Exit 		# if(i == j)
	add x10, x11, x12   	#   f = h + g
Exit: ...
```



2. `if-else` Statement:

|  f   |  g   |  h   |  i   |  j   |
| :--: | :--: | :--: | :--: | :--: |
| x10  | x11  | x12  | x13  | x14  |

**不要忘记 `j Exit` !!!**

```assembly
bne x13, x14, Else
	add x10, x11, x12
	j Exit	# Never forget this jump to Exit!
Else:
	sub x10, x11, x12
Exit:...
```

equivalent in C:

```c
if(i == j) {
    f = g + h;
} else {
    f = g - h;
}
```



### Loop

The three types of loops in C can be rewritten to each other, so the same branching method can be applied to them as well. We can use conditional branching to implement loops in RISC-V.

Considering the C loop as below:

```c
int A[20];
int sum = 0;
for(int i=0; i<20; i++){
    sum += A[i];
}
```

In assembly aspect, we can implement it like this:

```assembly
add x9, x8, x0 		# x9 = &A[0]
add x10, x0, x0 	# x10 = sum
add x11, x0, x0		# x11 = i
addi x13, x0, 20	# x13 = 20
Loop: 
	bge x11, x13, Done
	lw x12, 0(x9)		# x12 = A[i]
	add x10, x10, x12	# sum += A[i]
	addi x9, x9, 4		# x9 = &A[i + 1]
	addi x11, x11, 1	# i++
	j Loop
Done: ...
```

注意，在RISC-V里，我们没有用来处理immediate的branching，所以我们无法做含有immediate的比较。所有比较都必须在register之间完成。

此外，当数组前进到下一个元素的时候，<u>增加的地址偏移量为4</u> !



## Bitwise Operations

|  C   |   RISC-V   |
| :--: | :--------: |
|  &   |    and     |
|  \|  |     or     |
|  ^   |    xor     |
|  <<  | sll / slli |
|  >>  | srl / srli |

**Example**

- Register:

```assembly
and x5, x6, x7 # x5 = x6 & x7;
```

- Immediate:

```assembly
andi x5, x6, 3 # x5 = x6 & 3;
```



**Masks:** 

<img src=".\cs61c_pics\masks.png" style="zoom:80%;" />



**No logical "NOT"**

Use `xor`  with `1111 1111` instead.



**Logical Shifting**

`sll` : shift left logical

`slli` : shift left logical immediate

```assembly
slli x11, x12, 2 # x11 = x12 << 2; inserting 0's on right.
```

`srl` : shift right logical

`srli` : shift right logical immediate

- Question: How to get 12 ?
  - Ans: shift to the left by 3 add shift to the left by 2. This is commonly done in DSP.



**Arithmetic Shifting**

`sra`: Shift right arithmetic.

`srai`: Shift right arithmetic immediate.

Those two instruction move *n* bits to the right, for example:

![](.\cs61c_pics\arithmetic_shift.png)

<img src=".\cs61c_pics\arithmetic_shift2.png" style="zoom:87%;" />



## Assembler to Machine Code

<img src=".\cs61c_pics\assembler2machinecode.png" style="zoom:80%;" />

## How Program is stored

<img src=".\cs61c_pics\How_program_is_stored.png" style="zoom:67%;" />

## Program Execution

**PC**: program counteris a register internal to the processor that holds bytes address of next instruction to be executed.

<img src=".\cs61c_pics\program_exec.png" style="zoom:90%;" />

1. Instruction is fetched from memory

2. then control unit executes instruction using datapath and memory system, and update PC(default add +4 byte to PC, to move to next sequential instruction; branches, jumps alter)

## Symbolic Register Names

e.g. a0 ~ a7 for **argument registers**(x10 ~ a17) for function calls;

e.g. **zero** for x0

## Pseudo-instructions

![](.\cs61c_pics\pseudo-instructions.png)

`mv`: move value in a register to another;

`li`: load a immediate to a register.

`nop`: Do nothing, used when you need to wait for something happens.

## Function

**Six fundamental steps in calling a function**

1. Put <u>arguments</u> in a place where function can access them;
2. Transfer control to function;
3. Acquire (local) storage resources needed for function;
4. Perform desired task of the function;
5. Put <u>return value</u> in a place where calling code can access it and restore any registers you used; release local storage;
6. Return control to point of origin, since a function can be called from several points in a program.

### RISC-V Function Call Conventions

- Registers faster than memory, so use them;
  - a0 ~ a7 (x10 ~ x17): eight <u>argument</u> registers to pass parameters and <u>two return values</u>(a0 ~ a1)
- **ra**: one <u>return address</u> register to return to the point of origin(x1)
- **s0 ~ s1**(x8 ~ x9) and **s2 ~ s11**(x18 ~ x27): saved regsters.



### **RISC-V Function Instructions**

say we have a piece of C code:

```c
... sum(a,b) {
    return x + y
}
```

Convert it into RISC-V is like:

<img src=".\cs61c_pics\RISCV_func.png" style="zoom:67%;" />



- why use `jr` when return?

<img src="\cs61c_pics\Y_use_jr.png" style="zoom:50%;" />

**Important Note:**

> **`j label` is a pseudo-instruction for `jal x0, label`.** 
>
> `jalr` is used to return to the memory address specified in the second argument. 
>
> Keep in mind that jal jumps to a label (which is translated into an immediate by the assembler), whereas jalr jumps to an address stored in a register, which is set at runtime.

- `jal`: make jump easier:

<img src=".\cs61c_pics\jal.png" style="zoom:67%;" />

`jal`: jump and link, but rather "link and jump":

<img src=".\cs61c_pics\jal_and_jr.png" style="zoom:67%;" />

**Actually...**:

<img src=".\cs61c_pics\real_jal.png" style="zoom:67%;" />

### Stack: saves old register values

<img src=".\cs61c_pics\old_reg_value_save2.png" style="zoom:67%;" />

`sp`(Stack Pointer): x2



**Stack**:

<img src=".\cs61c_pics\Stack2.png" style="zoom:67%;" />

Stack when function is called:

<img src=".\cs61c_pics\satck_when_func_called.png" style="zoom:50%;" />



### Function Call Example

```c
int Leaf(int g, int h, int i, int j) {
    int f;
    f = (g+h) - (i+j);
    return f;
}
```

Parameter variables `g`, `h`, `i`, `j` are in argument register a0 ~ a3, and `f`  in s0; Assuming we need one more return register s1;

```assembly
Leaf:
	addi sp, sp, -8
	sw s1, 4(sp)
	sw s0, 0(sp)
	
	add s0, a0, a1
	add s1, a2, a3
	sub s0, s0, s1
	
	lw s0, 0(sp)
	lw s1, 4(sp)
	addi sp, sp, 8
	jr ra
```

<img src=".\cs61c_pics\code_foe_leaf.png" style="zoom:67%;" />

## Register Conventions

<img src=".\cs61c_pics\register_conventions_1.png" style="zoom:67%;" />

<img src=".\cs61c_pics\register_conventions_2.png" style="zoom:67%;" />

### RISC-V Registers

<img src=".\cs61c_pics\RISC_V_registers_name.png" style="zoom:67%;" />

## Allocating Space on Stack

<img src=".\cs61c_pics\Allocating_space_in_stack.png" style="zoom:67%;" />

<img src=".\cs61c_pics\Using_the_stack.png" style="zoom:67%;" />

## RV32 Memory

<img src=".\cs61c_pics\RV32_mmr_alloc.png" style="zoom:67%;" />

**RV32 convention**:

- Stacks starts in high memory(bfff_fff0~hex~) and grows down, and must be  16-byte boundary
- RV32 programs (*text segment*) is in low end(0001_0000~hex~)
- static data segment(constants and other static variables) above text.
  - global pointer(gp) points to static
  - RV32 gp = 1000_0000~hex~
- Heap above static for data structures that grow and shrink, grows up to high address.

**Note:** RV64 / RV128 have different memory layouts.

## RV32 Instructions Summary

<img src=".\cs61c_pics\RV32_instructions_so_far.png" style="zoom:67%;" />

<img src=".\cs61c_pics\instruction.png" style="zoom:100%;" />

ref:[disc 04](https://inst.eecs.berkeley.edu/~cs61c/sp21/pdfs/docs/discussions/disc04_sol.pdf)



