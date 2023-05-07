# Basic Things about The Course

## 课程资源

- video：fa20：https://inst.eecs.berkeley.edu/~cs61c/fa20/
- lab: sp21：https://inst.eecs.berkeley.edu/~cs61c/sp21/
- lab: 建议选最新的。
- project：sp23：https://cs61c.org/sp23/
- discussion: su20: https://inst.eecs.berkeley.edu/~cs61c/su20/
- source: sp21:https://inst.eecs.berkeley.edu/~cs61c/sp21/resources/
- lab：
  - lab00：基本配置以及git和vim等，23看起来比较全面
  - lab01，lab02：
    - 推荐先做sp21的lab01或者sp23的lab02，对debug工具比较熟悉以后再做sp21的lab02；
    - 对C语言不熟悉的话可以选择sp23的lab01，练习更多更基础。sp21的lab02更高级；
    - sp23的lab02和sp21的lab01内容类似，内容是教你使用工具来debug之类的东西，不过看起来sp23更全面一些：https://cs61c.org/sp23/labs/lab02/#other-useful-gdb-commands-recommended
- lab03：要用到Venus，因为版本问题建议选最新的。



**Project:**

Project的仓库是和lab分开的，每个project都有一个独立的仓库

要初始化project的仓库，操作如下：

- 新建一个目录，用git命令行工具进入这个目录内
- 使用`git init`初始化这个文件夹
- 设置远程仓库，以sp-23的project 2为例: 

```bash
git remote add starter https://github.com/61c-teach/sp23-proj2-starter.git
```

- 拉取仓库到本地，分支名可能是`main`或者`master`，你可以去对应的仓库里查看：

```bash
git pull starter <分支名>
```

- 在github里新建一个仓库，然后把自己的远程仓库添加进来：

在Git终端里运行：

```bash
git remote add origin <自己仓库的地址>
```

然后push：

```bash
git push -u origin master
```



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

## **Unsigned number **

numbers that only represents positive number from 0 to 2^n^ - 1.

## **Two's Complement** (补码)

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

  

## **Bias Encoding**

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

  <img src=".\cs61c_pics\everyBaseIsBase10!.png" style="zoom:35%;" />
  
  

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

我的理解：

- compiled code的执行速度更快，当代码量大的时候编译时间较长，compiler把高级语言转换为机器码。
- interpreter每次只翻译一个语句，且大小一般比compiler来的小，而且比compiler更灵活。但是运行代码的速度不如compiler。

**1. Which is better: Interpreter or Compiler?**

The Interpreter is useful in the case of debugging, but it is slower and a Compiler goes for full code, error resolution becomes challenging. Therefore, which one is better, totally depends on what work has to be performed by the user.

**2. Which is faster: Interpreter or Compiler?**

Whenever any process is considered, the interpreter is faster than the compiler. But, whenever any program is already compiled, in that case, execution of the compiled program is faster than an interpreted program.

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



**取相反数**

对于补码，可以<u>先按位取反，再加一</u>:

```assembly
lw t0, 0(s0)
xori t0, t0, 0xFFF
addi t0, t0, 1
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

### Init An Array

```assembly
sw x0, 0(s0)	# *p = 0, p-->s0
addi s1, x0, 2	# int a = 2
sw s1, 4(s0)	# p[1] = a
```



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

<img src=".\cs61c_pics\Y_use_jr.png" style="zoom:50%;" />

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
	# prolouge
	addi sp, sp, -8
	sw s1, 4(sp)
	sw s0, 0(sp)
	
	#"meat"
	add s0, a0, a1
	add s1, a2, a3
	sub s0, s0, s1
	
	# epilogue
	lw s0, 0(sp)
	lw s1, 4(sp)
	addi sp, sp, 8
	jr ra
```

<img src=".\cs61c_pics\code_foe_leaf.png" style="zoom:67%;" />

- 在RISC-V中，add s0, a0, x0和 lw s0, 0(a0)的效果是一样的吗？
  - 不一定。这两个指令的效果取决于 a0 和 x0 的值。如果 a0 存储的是一个内存地址，而 x0 存储的是 0，那么这两个指令的效果是一样的，都是将 a0 指向的内存中的值赋给 s0。但是，如果 a0 存储的是一个普通的整数，而 x0 存储的是非零的值，那么这两个指令的效果就不一样了，前者是将 a0 和 x0 的值相加赋给 s0，后者是将 a0 作为内存地址，从 a0 + 0 处加载一个 32 位的字赋给 s0。

- 一般来说a0作为argument register的时候存储的是参数的值而不是地址，因此要使用add指令。

### Summary

see more in [disc 04](https://inst.eecs.berkeley.edu/~cs61c/sp21/pdfs/docs/discussions/disc04_sol.pdf)

- How do we pass arguments into functions?

  - Use the 8 arguments registers a0 - a7.

  

- How are values returned by functions? 

  - Use a0 and a1 as the return value registers.

  

- What is sp and how should it be used in the context of RISC-V functions? 

  - sp stands for stack pointer, and it represents the boundary between stored data and free space on the stack. Because the stack grows downward, we subtract from sp to create more space (moving the stack pointer down), and add to sp to free space (moving the stack pointer back up). The stack is mainly used to save (and later restore) the value of registers that may be overwritten.

  

- Which values need to saved by the caller, before jumping to a function using jal?

  -  Registers a0 - a7, t0 - t6, and ra.

  

- Which values need to be restored by the callee, before returning from a function? 

  - Registers sp, gp (global pointer), tp (thread pointer), and s0 - s11. Note that we don’t use gp and tp very often in this course.

  

- In a bug-free program, which registers are guaranteed to be the same after a function call? Which registers aren’t guaranteed to be the same? 

  - Registers a0 - a7, t0 - t6, and ra <u>are not guaranteed to be the same</u> after a function call (which is why they must be saved by the caller). Registers sp, gp, tp, and s0 - s11 <u>are guaranteed to be the same</u> after a function call (which is why the callee must restore them before returning).

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

## Lab03 Supplement

### Venus

ref:https://cs61c.org/sp23/resources/venus-reference/#the-editor-tab

sp-23的lab: 使用GIt命令行切换到仓库目录里运行： 

```bash
java -jar tools/venus.jar . -dm
```

到Venus的网页上运行，把本地文件挂载到Venus上：

```bash
 mount local vmfs
```



如果你想要做之前学期的lab，那么有可能会发现由于Venus更新之后旧版的lab无法被挂载到新版的Venus上。

解决方法：以sp-21为例：

把sp-23的仓库clone到本地，然后把sp-23仓库里的`tools`文件夹拷贝到你的sp-21的仓库文件夹里，然后在Git命令行里运行：

```bash
java -jar tools/venus.jar . -dm
```

到Venus的网页上运行，把本地文件挂载到Venus上：

```bash
 mount local vmfs
```

新旧版本不兼容的原因可能是sp-21使用的是python来挂载，而现在最新版的Venus使用Java来挂载。



如果你需要使用命令行运行Venus，请参考<a href="https://cs61c.org/sp23/resources/venus-reference/#the-venus-cli">最新版(sp-23的Venus)使用说明</a>

对于某些在sp-21里使用python运行的命令，比如lab04里的convention checker：

```bash
./tools/venus -cc lab04/cc_test.s
```

使用下列命令代替：

```bash
java -jar ./tools/venus.jar -cc lab04/cc_test.s
```



#### Venus支持伪指令

> - 请问Risc-V里可以直接使用mv, j之类的伪指令吗?
>
>   - 在RISC-V汇编语言中,不可以直接使用伪指令如mv(移动指令)和j(跳转指令)。这是因为RISC-V是一种精简指令集计算机(Reduced Instruction Set Computer),其指令集设计遵循精简和统一的原则。
>
>     总的来说,RISC-V体系结构为了追求设计的简单化和效率,避免了提供专用的伪指令或非统一的指令集,而是通过已有指令的组合来实现相同的功能,这是RISC-V作为精简指令集计算机的一个典型特征。
>
> 
>
> - 可是，我在Venus里编辑代码的时候，似乎可以使用伪指令？
>   - 你说的对,在Venus这款RISC-V的汇编编辑器中,确实支持使用伪指令"mv"和"j"。这似乎与我们前面讨论的RISC-V理念相悖。其实,这是因为Venus作为一款开发编辑器,考虑到方便开发人员使用,提供了这些伪指令,但它会自动将这些伪指令翻译成RISC-V真正支持的指令。例如,当您编写代码"mv t0, t1"时,Venus会自动翻译成真正的RISC-V指令"add t0, t1, x0"。
>     同样,当您编写"j label"时,Venus会翻译成"jal x0, offset"的形式,其中offset是label对应位置的偏移地址。所以,尽管Venus提供了这些伪指令以方便开发人员使用,但最终它还是会将这些伪指令翻译成RISC-V体系结构真正支持的指令集。这不会影响最终编译出的Machine Code。这种做法相当于一种语法糖,在不改变最终结果的前提下,方便了开发人员的编码过程。但开发人员在理解RISC-V体系结构和指令集时,还是需要理解RISC-V支持的是什么指令,怎样组合这些指令来实现各种功能。伪指令只是一个编辑器层面的简化,并不属于RISC-V体系结构本身。
>
> 

#### Derectives

- `.data` : In RISC-V global variables are declared under the `.data` directive. This represents the data segment. It will look like this:

```assembly
.data
n: .word 12
```



- `.text` :Everything under this directive is our code.



**<span id="all-directives">All directives</span>**:

<img src=".\cs61c_pics\directives.png" style="zoom:87%;" />



### New Instructions

- `la`: 

```assembly
la t3, n # load the address of the label n
lw t3, 0(t3) # get the value that is stored at the adddress denoted by the label n
```

This instruction loads the address of a label. The first line essentially sets `t3` to be a pointer to `n`. Next, we use `lw` to dereference `t3` which will set `t3` to the value stored at `n`.

<span id="load-variables">You can think of the code above as doing something along the lines of:</span>

```c
t3 = &n;
t3 = *n;
```

> Now, you're probably thinking, "Why can't we directly set `t3` to `n`?" In the `.text` section, there is no way that we can directly access `n`. (Think about it. We can't say `add t3, n, x0`. The arguments to `and` must be registers and `n` is not a register.) The only way that we can access it is by obtaining the address of `n`. Once we obtain the address of `n`, we need to dereference it which can be done with `lw`. `lw` will reach into memory at the address that you specify and load in the value stored at that address. In this case, we specified the address of `n` and added an offset of `0`.



- `ecall`: 

Printing is a system call. You'll learn more about these later in the semester, but a system call is essentially a way for your program to interact with the Operating System. To make a system call in RISC-V, we use a special instruction called `ecall`. To print out an integer, we need to pass two arguments to `ecall`. The first argument specifies what we want `ecall` to do (in this case, print an integer). To specify that we want to print an integer, we pass a `1`. The second argument is the integer that we want to print out.

```assembly
finish:
    addi a0, x0, 1 # argument to ecall to execute print integer
    addi a1, t0, 0 # argument to ecall, the value to be printed
    ecall # print integer ecall
```

In C, we are used to functions looking like `ecall(1, t0)`. In RISC-V, we cannot pass arguments in this way. To pass an argument, we need to place it in an argument register (`a0`-`a7`). When the function executes, it will look in these registers for the arguments. (If you haven't seen this in lecture yet, you will soon). The first argument should be placed in `a0`, the second in `a1`, etc.

To set up the arguments, we placed a `1` in `a0` and we placed the integer that we wanted to print in `a1`.

Next, let's **terminate our program**! This also requires `ecall`

```assembly
addi a0, x0, 10 # argument to ecall to terminate
ecall # terminate ecall
```

In this case, `ecall` only needs one argument. Setting `a0` to `10` specifies that we want to terminate the program.



### Venus载入变量

```assembly
.data
n: .word 12	# variable n

.text
main:
    la t3, n # load the address of the label n
    lw t3, 0(t3) # get the value that is stored at the address denoted by the label n
```

also is described <a href="#load-variables">above</a>.

### 小技巧 - 取数组的某个元素

```assembly
# 假设a0表示要的是数组的第a0个元素
# x1是数组的基地址
	add t0 a0 x0    # get index 
    slli t0 t0 2    # get index * 4
    add t0 a1 t0    # get address of correspond output
    lw a0 0(t0)     # load value
```



## RISC-V Instruction Format

Traditional computers led to some consequences:

-  Everything has a memory address

  - And one register keeps address of instructions: PC

  

- Binary Compatibility

  - Programs are distributed in binary form
    - Programs bound to specific instruction set
    - Different version for phones and Computers
  - New machines want to run old programs as well as programs compiled to new instructions and it leads to "backward-compatible" instruction set evolving over time.

### Instructions as Numbers

<img src=".\cs61c_pics\instructions-as-numbers.png" style="zoom:80%;" />

<img src=".\cs61c_pics\instructions-as-numbers2.png" style="zoom:80%;" />



### R-Format Instruction Layout

R-Format for register-register arithmetic operations.

<img src=".\cs61c_pics\R-instruction-layout.png" style="zoom:67%;" />

- **opcode:**  partially specifies what instruction it is.
  - Note: This field is equal to 0110011~bin~ for all R-Format register-register arithmetic instructions 
- **funct7 + funct3:** combined with opcode, these two fields describe what operation to perform 
  - Question:  Why aren’t opcode and funct7 and funct3 a single 17- bit field? 

<img src=".\cs61c_pics\R-intruction-example.png" style="zoom:67%;" />

**All RV-32 R-format instructions**:

<img src=".\cs61c_pics\all-R-instruc.png" style="zoom:67%;" />

You may note that `add` and `sub` are similar to each other, and this is because they use the same hardware to perform their functions. And the 2nd `1` in func7 part of `sub` means to do *sign extension*, and you can spot `sra` has a `1` in its 2nd bit of func7 part as well.



### I-Format

<img src=".\cs61c_pics\I-format.png" style="zoom:67%;" />

**All RV-32 I-format instructions**:

<img src=".\cs61c_pics\all-i-format-at-once.png" style="zoom:67%;" />

### Load

Load instructions have a similar layout to I-Format:

<img src=".\cs61c_pics\load-layout.png" style="zoom:70%;" />

All load format:

<img src=".\cs61c_pics\all-Load-format.png" style="zoom:67%;" />

### Store

- Store needs to read two registers, `rs1` for base memory address, and `rs2` for data to be stored, as well immediate offset! 
- Can’t have both `rs2` and `immediate` in same place as other instructions! 
- Note that stores don’t write a value to the register file, no rd!
- RISC-V design decision is to move low 5 bits of immediate to where rd field was in other instructions – keep rs1/rs2 fields in same place 
  - Register names more critical than immediate bits in hardware design.

<img src=".\cs61c_pics\Save-format.png" style="zoom:67%;" />

**All Store Formats**:

<img src=".\cs61c_pics\all-store-instruction-format.png" style="zoom:67%;" />

generate a pic for me: an asian thin person sitting at a desk with their back facing the viewer, using a smartphone chatting with his friend on wechat. The person is in their mid-20s. The person is sitting in a black swivel chair and is leaning slightly to the right while holding the phone with their left hand.



### B-format

Branches read two registers but don’t write to a register (similar to stores).

使用immediate field作为PC指针的偏移量。

为了照顾compacted指令集（每个指令只有16bits），当：

- 不需要分支的时候：PC = PC + 4
- 需要分支的时候： PC = PC + **immediate * 2**

(immediate是要跳转到的指令的位置，可以在前也可以在后，在32字长的系统里，此时的immediate都是偶数)

<img src=".\cs61c_pics\b-format.png" style="zoom:67%;" />

因为在32位字长的系统中，immediate都是偶数，所以最低位都是0，可以忽略不写，因此可以只存储 1 ~ 12位（imm[1] ~ imm[12]），而不存储0位（imm[0]）。

**Example:**

<img src=".\cs61c_pics\b-format-example.png" style="zoom:50%;" />

imm低位： 前四位0100 : 省略最低位的0，且因为最终是immediate * 2，所以从16变成4（1000(0) -> 0100(0)）,第五位0是imm[11]，为0.

<img src=".\cs61c_pics\b-format-example-2.png" style="zoom:67%;" />



**指令中的immediate是如何编码成一个32位的字的？**：

<img src=".\cs61c_pics\instruction-imm-encoding.png" style="zoom:67%;" />

注：图中的 inst[num] 代表对应instruction里的第num位。



**All B-format instructions**

<img src=".\cs61c_pics\all-b-format-instructions.png" style="zoom:67%;" />



### U-format

 Upper Immediate instructions:

<img src=".\cs61c_pics\u-format.png" style="zoom:67%;" />

- Has 20-bit immediate in upper 20 bits of 32-bit instruction word
- One destination register, rd
- Used for two instructions
  - lui – Load Upper Immediate 
  - auipc – Add Upper Immediate to PC

#### lui

LUI writes the upper 20 bits of the destination with the immediate value, and clears the lower 12 bits.

<img src=".\cs61c_pics\u-format.png" style="zoom:67%;" />

Together with an addi to set low 12 bits, can create any 32-bit value in a register using two instructions (lui/addi).

> "So when we would like to put in a 32-bit immediate into a destination register, we need to chop that immediate into halves. This happened to some other Louis, which was a French king. Any similarities are accidental here."

```assembly
# Set x10 = 0x87654321
lui x10, 0x87654
addi x10,0x321
```

But there will be a bug if:

```assembly
lui x10, 0xDEADB 		# x10 = 0xDEADB000
addi x10, x10, 0xEEF 	# x10 = 0xDEADAEEF
```

You wil find that the result is  0xDEAD**A**EEF instead of desiring 0xDEAD**B**EEF. Why? Because `addi` does sign extension for 0xEEF and so the real number we use in process is <u>0x11111EEF</u>, and thus 0xDEADB is deduct by one to become 0xDEADA.

To get around this, use 0xDEAD**C**:

```assembly
lui x10, 0xDEADC 		# x10 = 0xDEADC000 
addi x10, x10, 0xEEF 	# x10 = #0xDEADBEEF
```

or use Assembler pseudo-op handles all of this:

```assembly
li x10, 0xDEADBEEF # Creates two instructions
```

#### auipc

Adds upper immediate value to PC and places result in destination register.

Used for PC-relative addressing.

```assembly
Label: auipc x10, 0 # Puts address of Label in x10
```



### J-format

#### jal

<img src=".\cs61c_pics\j-format.png" style="zoom:67%;" />

- jal saves PC+4 in register `rd` (the return address) .
  - Assembler “j” jump is pseudo-instruction, uses jal but sets rd=x0 to discard return address.

- Set PC = PC + offset (PC-relative jump) .
- Target somewhere within ±2^19^ locations, 2 bytes apart .
  - ±2^18^ 32-bit instructions.
- Immediate encoding optimized similarly to branch instruction to reduce hardware cost.

```assembly
# j pseudo-instruction
j Label = jal x0, Label # Discard return address

# Call function within 218 instructions of PC
jal ra, FuncName
```

#### jalr(I-format)

<img src=".\cs61c_pics\jalr-I-format.png" style="zoom:67%;" />

```assembly
jalr rd, rs, immediate
```

- Writes PC+4 to rd (return address) 
- Sets PC = rs + immediate 
- Uses same immediates as arithmetic and loads 
- no multiplication by 2 bytes 
- In contrast to branches and jal

**Example**:

```assembly
# ret and jr psuedo-instructions
ret = jr ra = jalr x0, ra, 0

# Call function at any 32-bit absolute address
lui x1, <hi20bits>
jalr ra, x1, <lo12bits>

# Jump PC-relative with 32-bit offset
auipc x1, <hi20bits>
jalr x0, x1, <lo12bits>
```

### Format Summary

<img src=".\cs61c_pics\format-summary.png" style="zoom:67%;" />



### Disc.05

link: https://inst.eecs.berkeley.edu/~cs61c/su20/pdfs/discussions/disc05_sol.pdf

关于范围的讨论：

- What is the range of 32-bit instructions that can be reached from the current PC using a branch instruction? 

  - The immediate field of the branch instruction is 12 bits. This field only references addresses that are divisible by 2, so the immediate is multiplied by 2 before being added to the PC. Since it is signed, the branch immediate can therefore move the PC in the range of [−2^12^ , 2^12^ − 1] bytes. If we’re in a version of RISC-V that has 2-byte instructions, then this corresponds to a range of [−2^11^ , 2^11^ − 1] instructions. The instructions we use, however, are 4 bytes so they reside at addresses that are divisible by 4 not 2. Therefore, we can only reference half as many 4-byte instructions as 2-byte instructions, and the range of 4-byte instructions is [−2^10^ , 2^10^ − 1]
  - 简单来说，B-format的命令码里有11位imm（从1 ~12），可以表示的范围字面上是 -2^11^ ~ 2^11^- 1， 但是由于imm[0]是省略的，所以实际上是有多了一位，是 -2^12^ ~ 2^12^- 1。如果在字长为16位（两个字节）的机器上，那么由于实际上要除以二(因为有一些码是在字的地址中间，不能使用)所以范围为-2^11^ ~ 2^11^- 1，在四个字节为字长的机器上，要除以四，为-2^10^ ~ 2^10^- 1

- What is the maximum range of 32-bit instructions that can be reached from the current PC using a jump instruction? 

  - The immediate field of the jal instruction is 20 bits, while that of the jalr instruction is only 12 bits, so jal can reach a wider range of instructions. Similar to above, this 20-bit immediate is multiplied by 2 and added to the PC to get the final address. Since the immediate is signed, we have a range of [−2 20 , 2 20 − 1] bytes, or [−2 19 , 2 19 − 1] 2-byte instructions. As we actually want the number of 4-byte instructions, we can reference those within [−2 18 , 2 18 − 1] instructions of the current PC.

  

**关于生成可执行文件的过程**：

1.1 The compiler may output pseudoinstructions.

- true. 编译器可能会输出伪指令。编译器生成的汇编代码可能包含伪指令,伪指令不会翻译成实际的机器指令。



1.2 The main job of the assembler is to generate optimized machine code.

- false. 汇编器的主要工作不是产生优化的机器代码。**汇编器的工作是将汇编语言翻译成机器代码**,优化通常在编译和链接阶段完成。



1.3 The object files produced by the assembler are only moved, not edited, by the linker.

- false 链接器不仅移动汇编器生成的目标文件,也会编辑它们。链接器需要修复和重定位目标文件中的地址和符号引用。



1.4 The destination of all jump instructions is completely determined after linking.

- false. **跳转指令的最终目标在链接后不完全确定。链接器确定每个跳转指令的相对目标,但是跳转的绝对地址只有在程序加载时才能确定。**



所以总结起来:1. 编译器的输出可能包含伪指令。2. 汇编器主要工作是翻译,而不是优化。3. 链接器不仅移动也编辑目标文件。4. 跳转指令的最终目标在链接后并不完全确定,需要等到程序加载时才能确定。

# Compiler, Assembler, Linker, Loader

<a href="https://inst.eecs.berkeley.edu/~cs61c/fa20/pdfs/lectures/lec13.pdf">Lecture Slide</a>

## Compiler v.s interpreter

interpreter和compiler是两种不同的程序翻译器，它们都可以把高级语言（如Python或Java）转换成低级语言（如机器语言或汇编语言），让计算机能够执行。它们的主要区别是：

- Compiler一次性把整个源代码翻译成目标代码，然后执行目标代码。interpreter则是一边翻译一边执行源代码，每次只翻译一行或一段。
- Compiler在翻译过程中会检查所有的错误和限制，而interpreter只在执行时才发现错误。
- Compiler生成的目标代码运行速度更快，但占用更多的内存空间。interpreter生成的目标代码运行速度更慢，但占用更少的内存空间。
- Compiler适合用于编译型语言（如C或C++），而interpreter适合用于解释型语言（如Python或Ruby）。

可以参考之前的<a href="#compile vs. interpret">笔记部分</a>

When to choose?

- In general, we interpret a high-level language when efficiency is not critical （且interpreter因为更贴近高级语言，debug更容易一些）；
- translate to a lower-level language to increase performance；

> translator是一个通用术语，指的是将一种高级语言代码转换为另一种高级语言代码或低级语言代码（如机器码或汇编语言）的工具，包括compiler, assembler和interpreter[1](https://www.microcontrollertips.com/compilers-translators-interpreters-assemblers-faq/)。
>
> - compiler是编译器，将高级语言代码转换为汇编语言代码[2](https://www.cnblogs.com/zqybegin/articles/12454154.html)。
> - assembler是汇编器，将汇编语言代码转换为机器码[1](https://www.microcontrollertips.com/compilers-translators-interpreters-assemblers-faq/) [3](https://www.geeksforgeeks.org/language-processors-assembler-compiler-and-interpreter/)。
> - interpreter是解释器，直接执行高级语言代码，不生成汇编语言或机器码[2](https://www.cnblogs.com/zqybegin/articles/12454154.html)。
>
> 您可以把compiler和interpreter看作是translator的两种类型，而assembler看作是compiler的一种特例。



Lecture Slide:

**Interpreter:**

- Generally easier to write interpreter 

- Interpreter closer to high-level, so can give better error messages (e.g., VENUS)
  - Translator reaction: add extra information to help debugging (line numbers, names) 

- Interpreter slower , code smaller
- Interpreter provides instruction set independence: run on any machine

**Compiler:**

- Translated/compiled code almost always more efficient and therefore higher performance: 
  - Important for many applications, particularly operating systems 
- Translation/compilation helps “hide” the program “source” from the users: 
  - One model for creating value in the marketplace (e.g., Microsoft keeps all their source code secret)
  - Alternative model, “open source”, creates value by publishing the source code and fostering a community of developers



## Compiler

运行：

```bash
gcc -O2 -S -c foo.c
```

即可进行编译，生成`.s`文件。

编译器主要是把高级语言转换为汇编语言（可能含有伪指令）。



## Assembler

- Input: Assembly Language Code (includes pseudo ops) (e.g., foo.s for RISC-V) 

- Output: Object Code, information tables (true assembly only) (e.g., foo.o for RISC-V) 

- Reads and Uses <a href="all-directives">Directives</a> 

- Replace Pseudo-instructions 

- Produce Machine Language 

- Creates Object File 

  

**Produce Machine Language**： 

  - 在产生机器语言的时候，有"three passes"：
    - 1st pass: replaces all pseudo instructions
    - 2nd pass: make note where all the *labels* are
    - 3rd pass: use label positions to generate code when seeing label in branch
  - 在处理和PC有关的跳转和分支时：
    - `j offset` pseudo instruction expands to `jal zero, offset` 
    - Just count the number of instruction half-words between target and jump to determine the offset: *position-independent code (PIC)*
  - 在处理静态数据时：
    - `la` gets broken up into `lui` and `addi` (use `auipc`/`addi` for PIC) 
    - These require the full 32-bit address of the data
  - 但是因为还不能确定运行时各个指令和static data在内存里的具体位置，所以我们还需要创建两个表格（table），以便在Link阶段确定后让Linker可以补全信息。
    1. Symbol Table：
       - List of “items” in this file that may be used by other files 
         - Labels: function calling 
         - Data: anything in the .data section; variables which may be accessed across files
    2. Relocation Table:
       - List of “items” whose address this file needs
         - Any absolute label jumped to: `jal`, `jalr`  
           - Internal  
           - External (including lib files)  
         - Any piece of data in static section  

<img src=".\cs61c_pics\Object-file-format.png" style="zoom:70%;" />



## Linker

- Input: Object code files, information tables (e.g., foo.o,libc.o for RISC-V) 
- Output: Executable code (e.g., a.out for RISC-V) 
- Combines several object (.o) files into a single executable (“linking”) 
- Enable separate compilation of files



**Steps**:

- Step 1: Take text segment from each .o file and put them together 

- Step 2: Take data segment from each .o file, put them together, and concatenate this onto end of text segments 

  <img src=".\cs61c_pics\Linker.png" style="zoom:67%;" />

- Step 3: Resolve references 

  - Go through Relocation Table; handle each entry, I.e., fill in all absolute addresses
  - <img src=".\cs61c_pics\4-types-address.png" style="zoom:67%;" />

**Static vs. Dynamically linked libraries**

Static: 

- Library is now part of the executable, so if the library updates, we don’t get the fix (have to recompile if we have source) 
- Includes the entire library even if not all of it will be used 
- Executable is self-contained

Dynamic:

- Space/time issues
  + \+ Storing a program requires less disk space 
  + \+ Sending a program requires less time 
  + \+ Executing two programs requires less memory (if they share a library) 
  + \- At runtime, there’s time overhead to do link 

- Upgrades 
  - \+ Replacing one file (libXYZ.so) upgrades every program that uses library “XYZ” \
  - – Having the executable isn’t enough anymore(if sth is off in libraries, your executable will crash too)

## Loader

- Input: Executable Code (e.g., a.out for RISC-V) 
- Output: (program is run) 
- Executable files are stored on disk 
- When one is run, loader’s job is to load it into memory and start it running 
- In reality, loader is the operating system (OS) 
  - Loading is one of the OS tasks



## Conclusion

<img src=".\cs61c_pics\CALL_conclusion.png" style="zoom:87%;" />

> This is a summary of the whole lecture in one minute.
>
> You typically interpret high-level language
>
> when you don't care about performance,
>
> and you typically translate to a lower-level language
>
> 
>
> Interpreter directly executes the program
>
> in whatever the language it is.
>
> Here's Scheme, high-level language,
>
> and let's run it right there.
>
> Here's Python, run it right there.
>
> 
>
> Okay, so those are different assembler languages.
>
> We're living in the RISC-V world now.
>
> **Assembler** removes the pseudoinstructions.
>
> It sets up two tables, a symbol table
>
> of all the symbols it knows about in that file,
>
> and a relocation table of all the things
>
> that need to be fixed in the linker stage.
>
> **The linker** goes to the symbols, takes all of them in aggregate,
>
> figures out, are there any duplicate symbols?
>
> **Loader:**
>
> Copies all that text and data from a.out into that memory.
>
> Sets the stack pointer with any arguments on the command line.
>
> Sets up a0 and a1 to be the value of argc and argv,
>
> and sets the stack pointer, clears the registers,
>
> and says go, and watches back, happily as a clam,
>
> as this thing continues to run.
>
> And when it's all done, whatever the return value was,
>
> it passes it back through, through the OS
>
> to the top level, and we're all done.
>
> Shoo, amazing.



# Synchronous Digital System

Hardware of a processor, e.g., RISC-V, is a **Synchronous Digital System**.

**Synchronous**: All operations coordinated by a central clock.

## Transistor

**CMOS**: Modern digital systems designed in CMOS . MOS transistors act as **voltage controlled switches**.

- MOS: Metal-Oxide on Semiconductor 
- C for complementary: normally-open and normally-closed switches

<img src=".\cs61c_pics\MOS_transistors.png" style="zoom:67%;" />

<img src="\cs61c_pics\mos_not_gate.png" style="zoom:67%;" />

模电：N型栅极高电平导通， P型栅极低电平导通。

- Block Diagram / Truth table: 真值表

## **SDS** 

Synchronous Digital Systems are made up of **two basic types of circuits**: 

- Combinational Logic (CL) circuits 
  - Our previous adder circuit is an example. 
  - Output is a function of the inputs only. 
  - Similar to a pure function in mathematics, y = f(x). (No way to store information from one invocation to the next. No side effects) 
- State Elements 
  - circuits that store information.

## Delay

**Propagation Delay**

## Flip-Flop

D触发器:

 “D-type Flip-Flop” 

<img src=".\cs61c_pics\flip-flop.png" style="zoom:80%;" />

- n instances of a “Flip-Flop” 
- Flip-flop name because the output flips and flops between and 0,1 
- D is “data”, Q is “output” ==(Qu==)
- Edge-triggered d-type flip-flop 
  - This one is “rising edge-triggered”, also called “positive edge” 

<img src=".\cs61c_pics\flip-flop-time.png" style="zoom:100%;" />

- Setup time
- Hold time
- CLK-to-q delay

![](.\cs61c_pics\accumulator.png)

可以看出，在某些时候，output的值并不正确，但只要在采样处（上升沿）保证output正确，即可使系统稳定运行。这也是为什么CLK太快（超频）有可能会导致系统崩溃的原因（因为此时output还没来得及变为正确的值，register采集到了错误的output）。

**Max CLK Frequency**:

<img src=".\cs61c_pics\max-clk-frequency.png" style="zoom:80%;" />

## Pipeline

Pipeline to improve performance:

<img src=".\cs61c_pics\pipeline.png" style="zoom:80%;" />

<img src=".\cs61c_pics\pipeline-2.png" style="zoom:67%;" />

## Finite State Machine

数电状态图：

- You have seen FSMs in other classes 

- The function can be represented with a “state transition diagram” 
- With combinational logic and registers, any FSM can be implemented in hardware.

<img src=".\cs61c_pics\hardware-implement-of-fsm.png" style="zoom:80%;" />

## 数电知识大集合

**真值表**

**逻辑器件图**：记住，当输入有奇数个1的时候，异或（xor）输出为1

**布尔代数**

<img src=".\cs61c_pics\laws_of_boolean_algebra.png" style="zoom:80%;" />

**Cononical Form**: 标准与或式



## MUX

Use muxes(multiplexers) to select among input 

- S input bits selects 2^S^ inputs 
- Each input can be n-bits wide, independent of S

<img src=".\cs61c_pics\2input-mux.png" style="zoom:80%;" />

You can cascade mux to expand its inputs:

<img src=".\cs61c_pics\cascade-mux.png" style="zoom:80%;" />

## ALU

Most processors contain a special logic block called “Arithmetic and Logic Unit” (ALU).

We’ll show you an easy one that does signed/unsigned ADD, SUB, bitwise AND (&), bitwise OR (|)

<img src=".\cs61c_pics\ALU.png" style="zoom:97%;" />



### Unsigned adder implementation:

- 半加器(no carrier to add in input):

<img src=".\cs61c_pics\one-bit-adder.png" style="zoom:80%;" />

- 全加器：

  <img src=".\cs61c_pics\one-bit-adder-with-carrier.png" style="zoom:80%;" />

  <img src=".\cs61c_pics\one-bit-adder-with-carrier-implementation.png" style="zoom:80%;" />

  对于N-bit：

  <img src=".\cs61c_pics\one-N-bit-adder.png" style="zoom:80%;" />

  



### Signed adder implementation

以2-bit为例，处理符号数时，一位为符号位，另一位为数据位：

<img src=".\cs61c_pics\2-bit-adder.png" style="zoom:97%;" />

发现与无符号加法**不同**的是：只有在C~1~和C~2~之间有且只有一个为1时，overflow才有效。因此，可知有符号加法运算的overflow位可以用 C~n~ xor C~n-1~来表示。

### Extrmely Smart Subtracter

<img src=".\cs61c_pics\Extremely-clever-Subtractor.png" style="zoom:80%;" />

因为 a - b 就是 a + (-b)，所以对输入b取反（使用一个SUB输入端控制，当SUB=1时，所有 b ⊕ SUB = b' ，然后再把SUB输入进最低位的C~0~ (进位位)，模拟对补码取反（翻转所有bit然后加1）的过程得到-b。

上图即为ALU的加减法模块全图。



## The CPU

**Processor (CPU)**: the active part of the computer that does all the work (data manipulation and decision-making)

**Datapath**: portion of the processor that contains hardware necessary to perform operations required by the processor (the brawn)

**Control**: portion of the processor (also in hardware) that tells the datapath what needs to be done (the brain)

## Building a RISC-V Processor

**One-Instruction-Per-Cycle RISC-V Machine**

- On every tick of the clock, the computer executes one instruction. 
- Current state outputs drive the inputs to the combinational logic, whose outputs settles at the values of the state before the next clock edge.
- At the rising clock edge, all the state elements are updated with the combinational logic outputs, and execution moves to the next clock cycle.

### Datapath

break up the process of “executing an instruction” into stages, and then connect the stages to create the whole datapath: 

- smaller stages are easier to design 
  - easy to optimize (change) one stage without touching the others (modularity)

#### Five Stages

Stage 1: Instruction Fetch (IF) 

Stage 2: Instruction Decode (ID) 

Stage 3: Execute (EX) - ALU (Arithmetic-Logic Unit) 

Stage 4: Memory Access (MEM) 

Stage 5: Write Back to Register (WB)

**Basic Phases of Instruction Execution:**

<img src=".\cs61c_pics\basic-phase-of-instr-exec.png" style="zoom:70%;" />

#### Datapath Elements

- Combinational elements

  <img src=".\cs61c_pics\combination-elements.png" style="zoom:70%;" />

- Register

<img src="F:\awsl\cs61c\AceMyFile\cs61c_pics\register.png" style="zoom:67%;" />

- Register File

  <img src="F:\awsl\cs61c\AceMyFile\cs61c_pics\register-file.png" style="zoom:67%;" />

  Register file (regfile, RF) consists of 32 registers: 

  - Two 32-bit output busses: busA and busB 
  - One 32-bit input bus: busW 

  Register is selected by: 

  - RA (number) selects the register to put on busA (data) 
  - RB (number) selects the register to put on busB (data) 
  - RW (number) selects the register to be written via busW (data) **when Write Enable is 1**. 

  Clock input (Clk) 

  - Clk input is a factor **ONLY during write operation** 
  - During read operation, behaves as a combinational logic block:  RA or RB valid ⇒ busA or busB valid after “access time.”(acess time就是物理上的延迟时间啦)

- Memory

  <img src=".\cs61c_pics\memory.png" style="zoom:67%;" />

  - Clock input (CLK) 
    - CLK input is a factor **ONLY during write operation** 
    - During read operation, behaves as a combinational logic block: Address valid ⇒ Data Out valid after “ access time”

#### State Required by RV32I ISA

Each instruction during execution reads and updates the state of : (1) Registers

(2) Program counter

(3) Memory

- DMEM
- IMEM

#### R-Type ADD Datapath

<img src=".\cs61c_pics\datapath-for-add.png" style="zoom:80%;" />

下面的 Control Logic是作为Control来控制WriteEnable端口的。

#### SUB Datapath

<img src=".\cs61c_pics\add-sub-datapath.png" style="zoom:67%;" />

**You can implemente all R-Type Instruction by decoding funct3 and funct7 fields and selecting appropriate ALU function!!!**



#### Implementing I-Format Instruction

- **addi**

<img src=".\cs61c_pics\addi-datapath.png" style="zoom:70%;" />

<img src=".\cs61c_pics\I-format.png" style="zoom:67%;" />

- Imm. Gen:

<img src=".\cs61c_pics\imm-gen.png" style="zoom:70%;" />

Works for all other I-format arithmetic instructions (slti,sltiu,andi, ori,xori,slli,srli, srai) just by changing ALUSel.

#### 完整的datapath

<img src=".\cs61c_pics\complete-RV32-datapath.png" style="zoom:80%;" />

#### lw指令(I-Format)

<img src=".\cs61c_pics\lw-i-format.png" style="zoom:80%;" />

步骤：

1. 取指令(Fetch)
2. 解码指令(Decode)，设置控制模块：ImmSel = I，Bsel = 1，ALUSel = Add，MemRW = Read，WBSet=0
3. 执行阶段(Execution)，把RS1的地址送到ALU里与偏移量Imm相加得到读出数据的内存地址
4. 内存操作步骤：把读出的值写入RD的地址里。
5. 更新PC寄存器。

#### JALR指令(I-Format)

<img src=".\cs61c_pics\i-format-jalr.png" style="zoom:80%;" />

```assembly
jalr rd, rs, imm
```

1. 取指令(Fetch)

2. 解码指令(Decode)，设置控制模块：PCSel = 1，RegWEn = 1，ImmSel = I，Bsel = 1，ASel = 0，ALUSel = Add，WBSel = 2

3. 执行阶段(Execution)，把PC+4的值放入rd，把PC的地址送到rs1里，然后在ALU里与偏移量Imm相加得到要跳转的指令地址存到PC寄存器里，

4. 更新PC寄存器。

   

#### S-Format Instruction

 S指令：

<img src=".\cs61c_pics\Save-format.png" style="zoom:67%;" />

流程：

1. 取指令(Fetch)
2. 解码指令(Decode)，设置控制模块：ImmSel = S，Bsel = 1，ALUSel = Add，MemRW = Write
3. 执行阶段(Execution)，把RS1的地址送到ALU里与偏移量Imm相加得到写入的内存地址，把RS2里的数据送入DEME模块
4. 内存操作步骤：把RS2的值写入得到的地址里。
5. 更新PC寄存器。

因为I-Format和S-Format的机器码存储立即数的方式不太一样，所以：

<img src=".\cs61c_pics\I+S-Immediate-Generation.png" style="zoom:80%;" />



#### B-Format Instruction

<img src=".\cs61c_pics\b-format.png" style="zoom:80%;" />

1. 取指令(Fetch)
2. 解码指令(Decode)，设置控制模块：ImmSel = B，Bsel = 1，ASel = 1，ALUSel = Add，以及Branch Comp。
3. 执行阶段(Execution)，比较RS1和RS2的大小，然后把PC当前地址和Imm相加；
4. 根据Branch Comparator的比较结果设置PCSel，更新PC寄存器。

#### J-Format Instruction

<img src=".\cs61c_pics\j-format.png" style="zoom:80%;" />

Two changes to the state 

- jal saves PC+4 in register rd (the return address) 
- Set PC = PC + offset (PC-relative jump) 

Target somewhere within ±2^19^ locations, 2 bytes apart 

- ±2^18^ 32-bit instructions

Immediate encoding optimized similarly to branch instruction to reduce hardware cost

<img src=".\cs61c_pics\j-format-datapath.png" style="zoom:80%;" />

#### U-Format Instruction

<img src=".\cs61c_pics\u-format.png" style="zoom:80%;" />

Has 20-bit immediate in upper 20 bits of 32-bit instruction word 

One destination register, rd 

Used for two instructions 

- lui – Load Upper Immediate 
- auipc – Add Upper Immediate to PC

<img src=".\cs61c_pics\lui-datapath.png" style="zoom:80%;" />

<img src=".\cs61c_pics\AUIPC-data-path.png" style="zoom:80%;" />
