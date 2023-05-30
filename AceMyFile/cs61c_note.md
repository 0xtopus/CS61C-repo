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

- lab04：
- lab05：请使用最新的（sp-23）logisim
  - 如何放置subcircuit：

**Project:**

Project的仓库是和lab分开的，每个project都有一个独立的仓库

要初始化project的仓库，操作如下：

- 新建一个目录，用git命令行工具进入这个目录内
- 使用`git init`初始化这个文件夹
- 设置远程仓库的地址，你可以去各个project的页面查看对应的地址链接，这里以sp-23的project 2为例: 

```bash
git remote add starter https://github.com/61c-teach/sp23-proj2-starter.git
```

- 拉取仓库到本地，`<分支名>`可能是`main`或者`master`，你可以去对应的仓库里查看，或者使用`git remote show starter`命令，在输出中找到类似于这样的一行：`HEAD branch: main`，这就表示远程仓库starter的分支名是main:

```bash
git pull starter <分支名>
```

- 在自己的github里新建一个仓库，然后把自己新建的仓库添加进来：

在Git终端里运行：

```bash
git remote add origin <自己仓库的地址>
```

然后push即可完成设置：

```bash
git push -u origin master
```

注：一些Project会让你在设置好仓库后再下载完成project所要用到的工具，一般你只要运行现成的脚本（运行类似`bash test.sh download_tools`这样的命令）就可以自动完成下载，这部分内容在Project的页面都会有详细的说明，跟着做就行。

**Project 3**：

- Hard-wired control: for signals like ALUSel, where you might want to output a certain number depending on multiple potential input signals, a Priority Encoder might be helpful!
- 有用的图片：

- 一定要注意tunnel的命名！注意各种大小写！
- 23版和21版有一些区别，实现的指令有一点不太一样，此外21版推荐使用hard wired 的control logic，23版则会给你一个表格让你用ROM实现，但这个表格需要权限，所以你还是得用hard wired的control logic。在21版里对hard wired方法有更多提示，比如推荐你使用Priority Encoder等等，可以在做control logic的时候参考一下：https://inst.eecs.berkeley.edu/~cs61c/sp21/projects/proj3/#info-control-logic-1

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

#### **CGDB**

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

Dynamic variable storage, data lives until deallocated by programmer.

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

C语言中的内存可以分为四个部分：

- **代码段**：存放程序的指令，通常是只读的。
- **数据段**：存放全局变量和静态变量，分为初始化和未初始化两种。
- **堆**：存放动态分配的内存，由程序员管理。
- **栈**：存放局部变量和函数调用的信息，由系统管理。

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



### disc06:

https://inst.eecs.berkeley.edu/~cs61c/su20/pdfs/discussions/disc06_sol.pdf

**clk-to-q ≥ hold time**

- Hold time is generally included in clk-to-q delay, so clk-to-q time will usually be greater than or equal to hold time. Logically, the fact that clk-to-q ≥ hold time makes sense since it only takes clk-to-q seconds to copy the value over, so there’s no need to have the value fed into the register for any longer.

**Appropriate CLK**

- Clock cycle time must be small enough that inputs to registers don’t change within the hold time and large enough to account for clk-to-q times, setup times, and combinational logic delays.



**1. 波形图绘制：**

验证violation：从setting time到hold time这段时间里，input应该保持不变，否则输出将不确定。

<img src=".\cs61c_pics\hold_time_violation.png" style="zoom:67%;" />

- 检查绿线到紫线和紫线到黄线的A是否一直保持稳定。



**2. 计算最大的hold time：**

max hold time = prev reg clk-to q + shortest combinational circuit gate path delay

如果hold time超过了这个时间，那么在下一次信号传递过来后reg C还会保持原状态而无法及时更新。

<img src=".\cs61c_pics\max_hold_time.png" style="zoom:70%;" />

**3. 最小的CLK：**

min clk = prev reg clk-to-q + longest CL + ending reg setup time

<img src=".\cs61c_pics\min_clk.png" style="zoom:70%;" />

**4. 绘制状态图（FSM）：**

找到所有状态，以及它们之间的转换关系，记得设置start状态



### **Max CLK Frequency**

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



# The CPU

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

### 完整的datapath

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

## Control and Status Registers

**CSRs** are separate from the register file (x0-x31) 

- Used for monitoring the status and performance 
- There can be up to 4096 CSRs 

CSRs are not in the base ISA, but almost mandatory in every implementation 

- ISA is modular 
- Necessary for counters and timers, and communication with peripherals

**CSR instructions**:

<img src=".\cs61c_pics\csr-instructions.png" style="zoom:60%;" />

**Note that all uimm in <u>csr uimm instruments are zero-extended to 32 bits</u>!**

<img src=".\cs61c_pics\csr-uimm-instructions.png" style="zoom:50%;" />

Basically what these instructions do is put the current csr value into rd and write rs1 value into csr.

### Pseudo-instruction

Use write enable and clock.

`csrw csr, rs1` is `csrrw x0, csr, rs1`

- rd=x0, just writes rs1 to CSR 

`csrwi csr, uimm` is `csrrwi x0, csr, uimm` 

- rd=x0, just writes uimm to CSR 

### System Instrutions

`ecall`

`ebreak`

`fence`

<img src=".\cs61c_pics\system-instru.png" style="zoom:67%;" />

### Control Timing

- A **state element** is an element connected to the clock (denoted by a triangle at the bottom). The input signal to each state element must stabilize before each rising edge. •
- The **critical path** is the longest delay path between state elements in the circuit. The circuit cannot be clocked faster than this, since anything faster would mean that the correct value is not guaranteed to reach the state element in the alloted time. If we place registers in the critical path, we can shorten the period by reducing the amount of logic between registers.

选择最长的路径(critical path)：

![](.\cs61c_pics\timing-for-add.png)

**lw:**

<img src=".\cs61c_pics\timing-for-lw.png" style="zoom:80%;" />

**Instruction Timing**

<img src=".\cs61c_pics\instruction-timing.png" style="zoom:67%;" />

<img src=".\cs61c_pics\instruction-timing2.png" style="zoom:67%;" />

### Control Logic Design

首先我们有control logic truth table，

每个指令执行时需要设置的control位如下：

<img src=".\cs61c_pics\control-logic-truth-table.png" style="zoom:67%;" />

我们可以根据指令的机器码来设置指令的控制位：

两种方法：

1. ROM --- Popular when designing control logic manually.
2. 组合逻辑电路 --- Today, chip designers use logic synthesis tools to convert truth tables to networks of gates.

<img src=".\cs61c_pics\instru-bits-to-set-ctrl-bits.png" style="zoom:100%;" />

每个control位都对应着指令机器码里的一些位。

- 如果基于ROM进行控制位设置：

<img src=".\cs61c_pics\Rom-based-control.png" style="zoom:67%;" />

<img src=".\cs61c_pics\Rom-based-control-implementation.png" style="zoom:67%;" />

- 基于组合逻辑电路：

大概的方法就是对于特定的控制位设置电路，找出所需指令与其他指令在机器码上不同的位，逻辑与上和指令类型相应的opcode即可：

<img src=".\cs61c_pics\control-logic-to-decode-add.png" style="zoom:67%;" />



### Anecdote

控制位的Flag起源于以前的邮箱，当有信要寄的时候，就在把信件放进邮箱后升起一面旗子告诉邮差；当邮差取走信件的之后，就把旗子降下来，告诉主人信已寄出。

# Pipelining

In real life, nobody uses single-cycle-CPU cauze it is ineffecient!

Instead, we use pipelining!

## Performance Iron Laws

Processor Performance iron law: 

Time per program = Instructiond per Program * Cycles per Instruction * Time per Cycle

- **Instruction per Program**

Determined by:

- 
  - Task
  - Algorithm
  - Language
  - compiler
  - ISA	

- **CPI**
  - ISA
  - microarchitecture
- **Time per Cycle**
  - microarchitecture
  - Technology(5nm, 7nm...)
  - Power Budget(lower voltages reduce transistor speed)

<img src=".\cs61c_pics\speed-tradeoff-example.png" style="zoom:67%;" />

## Energy Efficiency

In CMOS :

- Leakage(30%)
- Sparse

**Energy per Task**

Energe per Program = Instruction per Program * Energy per Instruction 正比于  Instruction per Program * CV^2^

V是电压，C是电容。



### Energy Iron Law

Performance = Power * Energy Efficiency

- Energy efficiency (e.g., instructions/Joule) is key metric in all computing devices.
- For power-constrained systems (e.g., 20MW datacenter), need better energy efficiency to get more performance at same power.
- For energy-constrained systems (e.g., 1W phone), need better energy efficiency to prolong battery life.

## Pipelining

- Pipelining doesn’t help latency of single task, it helps throughput of entire workload 

- Multiple tasks operating simultaneously using different resources 
- Potential speedup = Number of pipe stages

- Pipeline rate limited by slowest pipeline stage 
- Unbalanced lengths of pipe stages reduce speedup

### Pipelining RISC-V Datapath

<img src=".\cs61c_pics\pipelined-risc-v-datapath.png" style="zoom:67%;" />

与Single-Cycle-CPU不同，Pipelined方式的单条指令运行时间由于要照顾到所有同时进行的流程里最慢的部分所以会更长一些。

但得益于同时可以处理多条指令，在总体的运行速度上，Pipeline更胜一筹：

<img src=".\cs61c_pics\pipeline-vs-single-cycle.png" style="zoom:67%;" />  

通过牺牲单条指令的运行速度，pipeline通过提高指令的吞吐量（putthrough）取胜。

由于CPU里同时有多条指令在调试执行，所以需要在datapath里加入一些寄存器来存储当前阶段所需的数据和所需的指令控制位。

- Pipeline registers separate stages, hold data for each instruction in flight.
- We make copies of the previous instructions all the way down the stream(By using registers).
  - Each one of these pipeline registers will holds the bits that correspond to the instruction that  being executed in that particular stage.
  - And that stage has to also keep the control bits.


<img src=".\cs61c_pics\pipeline-datapath.png" style="zoom:50%;" />

<img src=".\cs61c_pics\pipeline-control.png" style="zoom:57%;" />



### Hazards

A hazard is a situation that prevents starting the next instruction in the next clock cycle 

1. Structural hazard 
   - A required resource is busy (e.g. needed in multiple stages) 
2. Data hazard Data 
   - dependency between instructions 
   - Need to wait for previous instruction to complete its data read/write 
3. Control hazard 
   - Flow of execution depends on previous instruction

#### Structural Hazard

Problem: Two or more instructions in the pipeline compete for access to a single physical resource

Solution 1: Instructions take it in turns to use resource, some instructions have to stall 

Solution 2: Add more hardware to machine (Can always solve a structural hazard by adding more hardware)

#### Data Hazard

试想下面的程序：

<img src=".\cs61c_pics\data-hazard.png" style="zoom:70%;" />

发现当add处于WB阶段将结果写入t0时，sw正在读取t0的数据。

为了避免冲突，我们利用寄存器操作的速度比其他操作快这一特性，让寄存器在一个CLK周期里执行两步操作：

- 在前半段写寄存器，在后半段读寄存器
- 这样，sw就能读取到正确的t0值了

如果出现更复杂的情况，如下图所示：

<img src=".\cs61c_pics\data-hazard2.png" style="zoom:67%;" />

发现：Without some fix, sub and or will calculate wrong result!

- Solution1：Stalling

  - 当检测到下一条指令的rs是上一条指令的rd时，插入bubble（无实际意义的指令, 比如 `nops` (`addi x0, x0, 0`）等待直到上条指令的rd寄存器被正确写入之后再执行下条指令。
  - 问题：牺牲性能
  - <img src=".\cs61c_pics\stalling.png" style="zoom:67%;" />

- Solution2: Forwarding

  - 对前后指令的rd和rs进行比较，控制一个Mux进行选择，如果检测到冲突，不再直接调用register file里的寄存器，而是利用用另外的寄存器把ALU计算的结果直接送回给ALU进行下次计算。

  - <img src=".\cs61c_pics\forwarding.png" style="zoom:67%;" />

    

  - Compare destination of older instructions in pipeline with sources of new instruction in decode stage. 

  - Must ignore writes to x0!

  - <img src=".\cs61c_pics\forwarding-control.png" style="zoom:67%;" />

    

##### Load Data Hazard

如果有下面这样一段程序：

<img src=".\cs61c_pics\load-data-hazard.png" style="zoom:50%;" />

发现由于时光不可倒流，所以即使使用了一个寄存器来存储从memory里取出的数据来forward，lw依然需要stalling一个CLK周期来等待数据从memory里取出。

- Solution1：当前一条指令是lw，且在第二条指令（比如上图里的`and`）decode后发现这条指令需要用到前面加载数据到的目的寄存器时，放弃后续的所有操作，直到下一个周期在执行一模一样的指令
  - 缺点：损失性能
  - <img src=".\cs61c_pics\load-data-hazard-stalling.png" style="zoom:67%;" />

- Solution2：让编译器发现问题，解决问题
  - 出现load data hazard的时候，编译器把一条无关痛痒的指令换到lw后面填充这一个周期。
  - <img src=".\cs61c_pics\load-data-hazard-avoid-stall.png" style="zoom:67%;" />

#### Control Hazard

在执行分支指令时，我们发现由于不确定分支是否需要跳转，后面的两条指令无法确定是否需要执行，需要stalling。

<img src=".\cs61c_pics\control-hazard.png" style="zoom:67%;" />

- If branch not taken, then instructions fetched sequentially after branch are correct 
- If branch or jump taken, then need to flush incorrect instructions from pipeline by converting to NOPs

<img src=".\cs61c_pics\control-hazard2.png" style="zoom:60%;" />

使用预测来提高performance：直接猜测下一个PC的位置，然后等到分支结果出来后校对是否猜错，如果猜错再flush寄存器的结果。

- Every taken branch in simple pipeline costs 2 dead cycles 
- To improve performance, use “branch prediction” to guess which way branch will go earlier in pipeline 
- Only flush pipeline if branch prediction was incorrect

# Cache

## Binary prefix

- IEC Standard

| Name | Factor |
| :--: | :----: |
|  KB  | 2^10^  |
|  ME  | 2^20^  |
|  GB  | 2^30^  |
|  TB  | 2^40^  |
|  PB  | 2^50^  |
|  EB  | 2^60^  |
|  ZB  | 2^70^  |
|  YB  | 2^80^  |

- How to remember them?

- **K**issing **m**e **g**ives **t**en **p**ercent **e**xtra **z**eal & **y**outh! 



### Convert binary prefix quickly

<img src=".\cs61c_pics\convert-binary-prefix.png" style="zoom:67%;" />

## Memory Hierarchy

> 存储器按速度、容量和成本的不同分为不同的层级，常见的存储器层次结构如下：
>
> - 寄存器 (Register)：寄存器是位于CPU 内部的最快速的存储器，用于存储CPU 指令和数据。
> - 缓存 (Cache)：缓存是一种高速存储器，通常位于CPU 和主存之间，用于缓存最常用的指令和数据，以提高CPU 访问这些数据的速度。缓存分为L1、L2 和L3 三级，容量依次递增，但访问速度逐级递减。
> - 主存 (RAM)：主存是一种随机访问存储器 (RAM)，用于
> - 存储操作系统、应用程序和用户数据等内容。主存速度较快，但容量有限。
> - 虚拟内存 (Virtual Memory)：虚拟内存是一种使用磁盘空间来扩展主存容量的机制。虚拟内存将主存中暂时不用的数据和程序存储到磁盘中，以释放主存空间供其他程序使用。
> - 辅助存储器 (Secondary Storage)：辅助存储器是一种容量较大、速度较慢、但价格较便宜的存储器，常见的类型包括硬盘、固态硬盘、光盘和闪存盘等。它们主要用于存储操作系统、应用程序和用户数据等内容。辅助存储器与主存和虚拟内存一起构成了计算机的存储器层次结构。
>
> 存储器层次结构的设计旨在平衡存储器的速度、容量和成本。较快、较小的存储器用于缓存最常用的数据和指令，以提高CPU 访问速度，而较慢、较大的存储器则用于存储大量的数据和文件，以提供持久性的存储。

Great Idea #3: Principle of Locality / Memory Hierarchy

金字塔形结构：层级越高，速度越快，价格越贵，容量越小。

## Locality

- Cache contains **copies of data** in memory that are being used. 
- Memory contains **copies of data** on disk that are being used. 
- Caches work on the principles of **temporal and spatial locality**. 
  - Temporal locality (locality in time): If we use it now, chances are we’ll want to use it again soon. 
  - Spatial locality (locality in space): If we use a piece of memory, chances are we’ll use the neighboring pieces soon.

> 缓存的工作原理基于数据的空间局部性和时间局部性。也就是说，缓存会尝试预测哪些数据可能在不久的将来被访问，并在缓存中存储这些数据，以便更快地访问它们。数据的空间局部性指的是在程序执行期间，对数据的访问往往集中在某些局部区域，因此缓存可以利用这种特点；而时间局部性指的是，在程序执行期间，对某些数据的访问可能会重复出现，因此缓存可以利用这种特点，将数据存储在缓存中以供快速访问。

## Hierarchy Management

- registers and memory 
  - By compiler (or assembly level programmer) 
- cache and main memory 
  - By the cache controller hardware
- main memory and disks (secondary storage)
  - By the operating system (virtual memory) 
  - Virtual to physical address mapping assisted by the hardware (‘translation lookaside buffer’ or TLB)
  - By the programmer (files) 

## Cache Design

- How do we organize cache? 
- Where does each memory address map to? 
  - (Remember that cache is subset of memory, so multiple memory addresses map to the same cache location.) 
- How do we know which elements are in cache? 
- How do we quickly locate them? 

## Direct Mapped Caches

In a direct-mapped cache, each memory address is associated with one possible block within the cache

- Therefore, we only need to look in a single location in the cache for the data if it exists in the cache 
- Block is the unit of transfer between cache and memory

**Tips:** 画内存（memory）的时候，使其宽度和缓存（cache）保持一致。比如下图的cache是8位宽（注：宽度 = block size ，在这里是2 Bytes），内存也画成8位宽。

<img src=".\cs61c_pics\draw-memory-width-as-cache.png" style="zoom:60%;" />

### Index

对于来自memory的数据，要怎么知道放在cache里的哪个block里呢（即：which row of cache should the data go？）？

如上图所示，我们一般把memory按block划分，利用求余的思想，即图中颜色相同的block应该存放在对应的同一cache位置。

实际上，我们只需读取memory地址里中间的一段bits（由block的size和cache的高度决定），就能准确地知道数据在cache里应该存放的位置，比如对于上面的8位block，只需读取数据的memory地址的低2、3位即可确定其在cache里的位置。（注：“Cache Index”这个词是Dan生造的)

<img src=".\cs61c_pics\cache-index.png" style="zoom:77%;" />

### Offset

在cache里确定了数据的row(block)之后，还需要确定column，这可以通过数据的memory地址的低位来确定。在上图的例子中，如果最低位为0则是block右边的数据，如果最低位为1则是左边。

<img src=".\cs61c_pics\divide-memory-addr-for-cache.png" style="zoom:67%;" />

### Tag

在实际中，我们还需要知道cache里存储的数据来自memory的哪个地方，因此，还需要一个tag来指示：

<img src=".\cs61c_pics\cache-tag.png" style="zoom:80%;" />

如果把memory按cache大小分块，以上图为例，cache为8个字节，那么发现每块memory里所有字节的地址去掉低三位后得到的数字是一样的，比如最上方初始的0~7个字节，去掉地址的低三位后得到的二进制数全是0，即可确定他们的tag是0.

之后，我们就可以根据tag来知道cache里存储的某块数据来自memory的哪个部分了。

### 总结：TIO

<img src=".\cs61c_pics\divide-memory-addr-for-cache.png" style="zoom:67%;" />

要确定一个memory里的数据所对应的cache地址，我们将它的地址拆成三份，t, i , o。首先我们可以通过index来确定它在cache的哪一行，然后通过offset知道它在cache的哪一列，最后我们给它加上tag，以便我们知道它来自memory的哪个部分。

举例：下图memory地址为14的数据在cache中是什么样的？

先算row：14 mod 4 = 2，所以在cache第2行（黄色，cache行号从0开始）；其次，因为14的最低位是0，所以在右列；最后，tag由 14/4 - 1 = 2算出。

<img src=".\cs61c_pics\cache-tag.png" style="zoom:80%;" />

All fields are read as unsigned integers. 

- Index specifies the cache index (which “row”/block of the cache we should look in) 
- Offset：once we’ve found correct block, specifies which byte within the block we want 
- Tag：the remaining bits after offset and index are determined; these are used to distinguish between all the memory addresses that map to the same location

fun fact：tio，西班牙语uncle的意思。

<img src=".\cs61c_pics\tio-cache-mnemonic.png" style="zoom:67%;" />

### 补充

巧妙计算：

11101的十进制数是多少？

答：111是十进制的7，左移两位就是乘以4，即11100是28，最后再加一，得11101是十进制里的29.



cache并非只存在于memory hierarchy中，实际上，还有web cache， recent phone call cache等等。

### Tag, Index, Offset的计算

知block的宽度，可求Offset所需要的位数：比如2个字节宽的block就只需要一位，即最低位来标识出column；而16个字节宽的block就需要低四位bit来标识column（因为16 = 2^4^）。

知道block宽度和cache的总大小后，我们可以计算出row（行数）：比如一个大小为8 Bytes，block size = 2 bytes的cache，由8 / 2 = 4可知这个cache的高度（行数）为4。因为2^2^ = 4，所以在memory address里index占2个bit。

最后知道了Offset和Index在memory address里占的位数后，剩下的位数就是Tag的值。

**补充**：为了知道cache里的某个block是否存储的是garbage还是valid value，我们还需要一位valid bit来告诉我们。

> When start a new program, cache does not have valid information for this program 
>
> - Need an indicator whether this tag entry is valid for this program 
> - Add a “valid bit” to the cache tag entry 
> - 0 - cache miss, even if by chance, address = tag
> - 1 - cache hit, if processor address = tag

cache的结构大致如下图所示：

<img src=".\cs61c_pics\16kb-direct-mapped-cache.png" style="zoom:67%;" />

例：如上图所示，我们已知cache总大小为16kb，block宽度为16 Bytes，那么我们可以计算出Offset占4位，由16KB / 16 Byte我们知道这个cache有2^10^(1K)行，所以需要10位Index，最后剩下的位数全部是Tag。

## Cache Terminology

When reading memory, 3 things can happen:

- **cache hit**: cache block is valid and contains proper address, so read desired word
- **cache miss**: nothing in cache in appropriate block, so fetch from memory 
- **cache miss, block replacement**: wrong data is in cache at appropriate block, so discard it and fetch desired data from memory (cache always copy)

Some informal terminology:

- **Cold**: Cache empty 
- **Warming**: Cache filling with values you’ll hopefully be accessing again soon
- **Warm**: Cache is doing its job, fair % of hits 
- **Hot**: Cache is doing very well, high % of hits

More terminology...

- **Hit rate**: fraction of access that hit in the cache 
- **Miss rate**: 1 – Hit rate 
- **Miss penalty**: time to replace a block from lower level in memory hierarchy to cache 
- **Hit time**: time to access cache memory (including tag comparison) 

**Abbreviation for cache**: “$” = cache (a Berkeley innovation!)

## Memory Access with Cache

<img src=".\cs61c_pics\mmr-access-without-cache.png" style="zoom:67%;" />



<img src=".\cs61c_pics\mmr-access-with-cache.png" style="zoom:67%;" />

### Read Cache

**IVTO**

读取cache中的数据时，我们遵循“IVTO”原则：

根据给出的memory address，首先检查Index确定数据在cache的哪一行；然后读取valid bit看数据是否有效；再检查tags确认数据是否匹配；如果匹配，即Hit，就根据offset找到相对应的column读出数据，如果不匹配，执行miss with replacement。

<img src=".\cs61c_pics\cache-logic.png" style="zoom:77%;" />

(如上图，如果你只是按字（32-bit）来读取cache，那么你可以只读offset的高两位)

### Write Cache

 为了保证cache和memory的一致性，有两种写cache的方式：

- Write-through
  - 在processor运算后，每更新一次cache的值的同时，同时也更新memory对应的值
- Write-back
  - 在processor运算后，只更新cache的值，同时在block里添加一个标志位（dirty bit），置位这个标志位表示memory的值“stale”了，只有cache里的值才是“fresh”的。如此一来，只有当这个block被替换后才需要向memory ”write back“。注：由于一位一位地对比检查写入的新值和旧值比较浪费时间，所以只要processor返回一个新值，不管新旧值是否一致，dirty bit都会被置位。
  - 当erase cache的时候，你需要把所有的valid bits置零，但在置零之前，请检查dirty bit：如果dirty bit为高位，你需要先把里面的数据写入对应的memory里。

## Block Size Tradeoff

- **Benefits of Larger Block Size** 
  - Spatial Locality: if we access a given word, we’re likely to access other nearby words soon 
  - Very applicable with Stored-Program Concept
  - Works well for sequential array accesses 
- **Drawbacks of Larger Block Size** 
  - Larger block size means <u>larger miss penalty</u> 
    - on a miss, takes longer time to load a new block from next level 
  - If block size is too big relative to cache size, then there are too few blocks  
    - Result: miss rate goes up

- If you stride by cache size, you typically have the worst performance!
- See diagrams below, considering miss penalty and miss rate and the product of them(average access time), you can find a sweet spot and that's the point we want!

<img src=".\cs61c_pics\block-size-tradeoff.png" style="zoom:67%;" />

## Types of Cache Misses

“Three Cs” Model of Misses 

- 1st C: Compulsory Misses 
  - occur when a program is first started 
  - cache does not contain any of that program’s data yet, so misses are bound to occur 
  - can’t be avoided easily, so won’t focus on these in this course 
  - Every block of memory will have one compulsory miss (NOT only every block of the cache)

- 2nd C: Conflict Misses 
  - miss that occurs because two distinct memory addresses map to the same cache location 
  - two blocks (which happen to map to the same location) can keep overwriting each other 
  - big problem in direct-mapped caches 
  - how do we lessen the effect of these?
    - Solution 1: Make the cache size bigger -- Fails at some point 
    - Solution 2: Multiple distinct blocks can fit in the same cache Index?

- 3rd C: Capacity Misses 
  - miss that occurs because the cache has a limited size 
  - miss that would not occur if we increase the size of the cache 
  - sketchy definition, so just get the general idea 
  - This is the primary type of miss for <a href="#Fully Associative caches">Fully Associative caches</a>.
- How to catagorize these misses?
  - Run an address trace against a set of caches: 
    - First, consider an infinite-size, <a href="#Fully Associative caches">fully-associative cache</a>. For every miss that occurs now, consider it a compulsory miss. 
    - Next, consider a finite-sized cache (of the size you want to examine) with full-associativity. Every miss that is not in #1 is a capacity miss. 
    - Finally, consider a finite-size cache with finite-associativity. All of the remaining misses that are not #1 or #2 are conflict misses. (Thanks to Prof. Kubiatowicz for the algorithm)

## Fully Associative caches

没有index：

- no “rows”: any block can go anywhere in the cache 
- must compare with all tags in entire cache to see if data is there

<img src=".\cs61c_pics\fully-associative-cache.png" style="zoom:67%;" />

**Benefit of Fully Assoc Cache** :

- No Conflict Misses (since data can go anywhere) 

**Drawbacks of Fully Assoc Cache**: 

- Need hardware comparator for every single entry: if we have a 64KB of data in cache with 4B entries, we need 16K comparators: infeasible

## N-Way Set Associative Cache

这是一种介于Fully Associative Cache和Direct Mapped Cache的Cache：Tag和Offset都是一样的，但Index现在不指向一个特定的row，而是一个set，这个set可以视为一个Fully Associative Cache。

<img src=".\cs61c_pics\2-way-set-associative-cache.png" style="zoom:67%;" />

这样一来，既可以降低<a href="Types of Cache Misses">Conflict Misses</a>的概率，而又可以使在一个较小的set里查询tag的时间不至于到Fully Associative Cache那样长久，非常实用。

注：N-Way里的N都是2的指数。

- Basic Idea 

  - cache is direct-mapped w/respect to sets 

  - each set is fully associative with N blocks in it 

- Given memory address: 
  - Find correct set using Index value. 
  - Compare Tag with all Tag values in that set. 
  - If a match occurs, hit!, otherwise a miss. 
  - Finally, use the offset field as usual to find the desired data within the block

In fact, for a cache with M blocks:

- it’s Direct-Mapped if it’s 1-way set assoc, 
- It’s Fully Assoc if it’s M-way set assoc 
- so these two are just special cases of the more general set associative design

<img src=".\cs61c_pics\4-way-set-associative-cache-circuit.png" style="zoom:67%;" />

上图里的Set是横着画的。

## Block Replacement Policy

<img src=".\cs61c_pics\block-replacement-policy.png" style="zoom:67%;" />

三种按常见顺序从上到下排列的BRP。

<img src=".\cs61c_pics\cache-simulator.png" style="zoom:80%;" />

一个simulator，可以模拟cache。http://www.ecs.umass.edu/ece/koren/architecture/Cache/frame1.htm

## AMAT

average memory access time.

- How to choose between associativity, block size, replacement & write policy? 
- Design against a performance model 
  - Minimize: $Average Memory Access Time = Hit Time + Miss Penalty * Miss Rate$  
    - 为什么不是hit rate * hit time: 因为即使miss了，你也要在取回后hit你需要的数据，所以无论怎样都会hit一次。
  - Influenced by technology & program behavior



一个提高性能的方法是使用多级缓存：

<img src=".\cs61c_pics\memory-hierarchy.png" style="zoom:99%;" />

计算公式如下图所示:

<img src=".\cs61c_pics\multi-level-cache.png" style="zoom:80%;" />

例：

Assume：

- Hit Time = 1 cycle 
- Miss rate = 5% 
- Miss penalty = 20 cycles
- Calculate AMAT… Avg mem access time = 1 + 0.05 x 20 = 1 + 1 cycles = 2 cycles



例2：

**with L2 cache**

Assume 

- L1 Hit Time = 1 cycle 
- L1 Miss rate = 5% 
- L2 Hit Time = 5 cycles 
- L2 Miss rate = 15% (% L1 misses that miss) 
- L2 Miss Penalty = 200 cycles

L1 miss penalty = 5 + 0.15 * 200 = 35 

Avg mem access time = 1 + 0.05 x 35 = 2.75 cycles

**without L2 cache**：

Assume 

- L1 Hit Time = 1 cycle 
- L1 Miss rate = 5% 
- L1 Miss Penalty = 200 cycles 

Avg mem access time = 1 + 0.05 x 200 = 11 cycles 

**4x faster with L2 cache! (2.75 vs. 11)**

### Reduce miss rate

1. Larger cache 

   - limited by cost and technology 

   - hit time of first level cache < cycle time (bigger caches are slower) 

2. More places in the cache to put each block of memory – associativity 

   - fully-associative  
     - any block any line 

   - N-way set associated  
     - N places for each block  
     - direct map: N=1

### Typical Scale

L1 ：

- size: tens of KB 
- hit time: complete in one clock cycle 
- miss rates: 1-5% 

L2: 

- size: hundreds of KB 
- hit time: few clock cycles 
- miss rates: 10-20% 

L2 miss rate is fraction of L1 misses that also miss in L2.

why so high? 因为L1把hit rate高的"好东西"都拿走了！

# OS

当需要运行多个程序时，我们在软件层面使用OS来解决这个问题。在启动计算机的时候，OS是第一个启动的。在加载BIOS和BootLoader之后，我们不会直接启动应用程序，而是加载OS。

## What Does the OS do

- OS is the (first) thing that runs when computer starts 
- Finds and controls all devices in the machine in a general way 
  - Relying on hardware specific “device drivers” 
- Starts services (100+) 
  - File system, 
  - Network stack (Ethernet, WiFi, Bluetooth, …), 
  - TTY (keyboard), 
  -  … 
- Loads, runs and manages programs: 
  - Multiple programs at the same time (time-sharing) 
  - Isolate programs from each other (isolation) 
  - Multiplex resources between applications (e.g., devices)

OS使得每个程序都能够各自**独立地运行**，并**与各种设备（Device）进行互动**。

## What Does OS Need from Hardware?

- Memory translation 
  - Each running process has a mapping from "virtual" to "physical" addresses that are different for each process 
  - When you do a load or a store, the program issues a virtual address... But the actual memory accessed is a physical address 
- Protection and privilege 
  - Split the processor into at least two running modes: "User" and "Supervisor" 
  - RISC-V also has "Machine" below "Supervisor" 
  - Lesser privilege can not change its memory mapping 
  - But "Supervisor" can change the mapping for any given program 
  - And supervisor has its own set of mapping of virtual->physical 
- Traps & Interrupts 
  - A way of going into Supervisor mode on demand

## What Happens at Boot?

当启动时，我们会跳转到一些提前设定好的地址，PC会被设置为一些提前指定的值，然后开始执行一些特殊的指令帮我们启动OS。

<img src=".\cs61c_pics\boot.png" style="zoom:67%;" />

> 计算机的启动过程涉及到多个阶段。首先，BIOS初始化并检测硬件设备，然后加载并执行引导加载程序（Bootloader）。Bootloader负责搜索操作系统的引导加载程序，加载操作系统的内核，最终将控制权交给内核，使操作系统启动。

## OS Functions

### Launching Applications

Applications are called “processes” in most OSs 

- Thread: shared memory 
- Process: separate memory 
- Both threads and processes run (pseudo) simultaneously

Apps are started by another process (e.g., shell) calling an OS routine (using a “syscall”) 

- Depends on OS; Linux uses fork to create a new process, and execve (execute file command) to load application 

Loads executable file from disk (using the file system service) and puts instructions & data into memory (.text, .data sections), prepares stack and heap 

Set argc and argv, jump to start of main 

Shell waits for main to return (join)

> 进程和线程： 你可以把进程想象成一个工厂，它有自己的场地、设备、原料和产品。工厂可以生产不同的东西，比如玩具、衣服、食品等。每个工厂都是独立的，不会和其他工厂混淆或者干扰。
>
> 你可以把线程想象成工厂里的工人，他们共享工厂的资源，但是各自有自己的任务和进度。工人可以同时进行不同的工作，比如有的在装配零件，有的在检查质量，有的在包装产品等。每个工人都是协作的，为了完成工厂的目标。
>
> 所以，进程是一个程序运行的实例，它拥有自己的内存空间和系统资源；线程是进程内部的执行单元，它共享进程的内存空间和系统资源，但是有自己的程序计数器和栈空间。
>
> 假设你的电脑上有一个浏览器程序，它是一个进程，它有自己的内存空间和系统资源。当你打开浏览器时，它就开始运行。
>
> 假设你在浏览器里打开了三个标签页，分别访问了百度、知乎和Bing。每个标签页都是一个线程，它们共享浏览器的内存空间和系统资源，但是各自有自己的任务和进度。你可以同时在不同的标签页里搜索、浏览和切换。每个标签页都是协作的，为了完成浏览器的目标。

### Supervisor Mode

OS为了保护自己不被程序错误所影响，会给运行的程序加上一些限制 (e.g., access to memory, devices)

To help protect the OS from the application, CPUs have **a supervisor mode** (e.g., set by a status bit in a special register)

如果在supervisor mode下发生了错误，那么后果往往非常严重，比如Windows的蓝屏或者对磁盘驱动（disk driver）造成不恰当的修改。

> Supervisor mode（超级用户模式）是计算机处理器的一种特权模式，也称为核心模式、系统模式或特权模式。它是处理器提供的一种权限级别，用于管理操作系统和底层系统资源。
>
> 在计算机系统中，处理器通常提供不同的特权级别，其中最高级别就是超级用户模式。在超级用户模式下，操作系统和核心系统可以执行特权指令和访问受限资源，如底层硬件、内核内存和设备寄存器等。
>
> 超级用户模式的主要目的是保护系统的安全和稳定性。通过限制应用程序的访问权限和控制系统资源的使用，操作系统可以防止恶意或无意的错误对系统的损害。只有处于超级用户模式的操作系统才能执行特权指令，控制关键资源，并进行敏感操作，如内存管理、进程管理和设备驱动程序等。
>
> 用户程序通常运行在较低的特权级别，称为用户模式或用户态。在用户模式下，应用程序只能访问自己的内存空间和有限的系统资源，无法直接操作底层硬件或执行特权指令。这种特权级别的分离确保了系统的稳定性和安全性。
>
> 总结：超级用户模式（Supervisor mode）是处理器提供的特权级别之一，用于管理操作系统和核心系统资源。在超级用户模式下，操作系统可以执行特权指令和访问受限资源，确保系统的安全性和稳定性。用户程序运行在较低的特权级别（用户模式），受限于访问权限和系统资源的限制。

### Syscalls

如果要访问一些OS Routine，比如说：

- 读取文件
- 启动新进程
- 请求更多内存
- 通过网络发送数据
- ....

我们就需要执行syscall：

- Set up function arguments in registers, 
- Raise software interrupt (with special assembly instruction)

OS will perform the operation and return to user mode.

This way, the OS can mediate access to all resources, and devices.

### Interrupts和Exceptions

We need to transition into Supervisor mode when "something" happens.

- **Interrupt**: Something external to the running program 
  - Something happens from the outside world 
- **Exception**: Something done by the running program 
  - E.g: Accessing memory it isn't "supposed" to, executing an illegal instruction, reading a csr not supposed at that privilege 
- **ECALL**: Trigger an exception to the higher privilege 
  - How you communicate with the operating system: Used to implement "syscalls" 
- **EBREAK**: Trigger an exception within the current privilege

Interrupt是由当前运行的进程以外的事件触发的，比如键盘按下；Exception是由执行当前运行程序的指令时发生的某些事件引起的，比如memory error, bus error, illegal instruction, raised exception等等。前者是异步的，后者是同步的。

对于Interruption：Can handle interrupt on any convenient instruction:  “Whenever it’s convenient, just don’t wait too long”

对于Exception：Must handle exception precisely on instruction that causes exception: “Drop whatever you are doing and act now”

**Trap** – action of servicing interrupt or exception by hardware jump to “interrupt or trap handler” code

<img src=".\cs61c_pics\trap-handling.png" style="zoom:50%;" />

**Precise Trap**

<img src=".\cs61c_pics\precise-traps.png" style="zoom:67%;" />



<img src=".\cs61c_pics\exceptions-in-a-5-stage-pipeline.png" style="zoom:67%;" />

如果发现illegal opcode，比如说没有mul这个指令，我们可以在软件层面解决这个问题。

### Trap Handling

Exceptions are handled like pipeline hazards 

1) Complete execution of instructions before exception occurred 
2) Flush instructions currently in pipeline (i.e., convert to nops or “bubbles”) 
3) Optionally store exception cause in status register (Indicate type of exception) 
4) Transfer execution to trap handler 
5) Optionally, return to original program and re-execute instruction 

# Virtual Memory

虚拟内存是一种计算机技术，它使得应用程序可以访问超过物理内存容量的数据。虚拟内存通过在硬盘上创建一个虚拟地址空间，将部分数据从内存中转移到硬盘中，从而释放出内存空间。当应用程序需要访问这些被转移到硬盘上的数据时，虚拟内存会将这些数据重新加载到内存中，以供应用程序使用。这种技术可以提高系统的内存利用率和多任务处理能力。

<img src=".\cs61c_pics\memory-hierarchy-w-virtual-memory.png" style="zoom:77%;" />

虚拟内存是一个比cache还古早的概念，大概出现在60年代。

虚拟内存可以为程序提供一个非常大的主内存的假象。虚拟内存将程序的"页面"分为两类：驻留在主内存中的"工作集"和存储在硬盘上的其他页面。虚拟内存的"按需分页"技术使得程序可以运行比主内存（DRAM）更大的程序。此外，虚拟内存还可以隐藏不同机器配置之间的差异。

虚拟内存还可以允许操作系统共享内存，并保护不同程序之间的内存不受干扰。现在虚拟内存的重要性更加体现在保护方面，而不仅仅是作为内存层次结构的另一层。每个进程都认为自己拥有全部的内存，虚拟内存会动态地将所需的页面加载到实际内存中，从而让每个进程都感觉到自己独占内存。这种隔离和保护机制可以防止不同进程之间对内存的干扰和冲突。

## Address Space

Address space = set of addresses for all available memory locations.

有两种内存地址：

1. 虚拟内存地址：Set of addresses that the user program knows about
2. 物理内存地址：
   - Set of addresses that map to actual physical locations in memory 
   - Hidden from user applications

Memory manager maps (‘translates’) between these two address spaces！

<img src=".\cs61c_pics\virtual-vs-physical-addr.png" style="zoom:67%;" />

## 存储设备类型

### Memory

DRAM，SRAM：掉电易失性，

SRAM：CPU，需要更多的晶体管来构建每个存储单元，因此相比于DRAM，它的存储密度较低，芯片面积较大，成本较高

DRAM：内存，成本较低。

- 延迟

Latency to access first word: ~10ns (~30-40 processor cycles) 

Each successive (0.5ns – 1ns) 

### Disk

无掉电易失性，作为I/O外设

SSD: 固态硬盘，Access: 40-100µs (~100k proc. cycles) ， $0.05-0.5/GB

HDD：机械硬盘，Access: <5-10ms (10-20M proc. cycles) ， $0.01-0.1/GB

HDD和SSD是常见的存储设备。HDD使用旋转的磁盘和移动的磁头，具有较大的存储容量和较低的成本。SSD使用闪存芯片，具有更快的数据访问速度、更低的能耗和更高的可靠性，但相对于HDD而言，容量可能较小且成本较高。选择HDD还是SSD取决于具体的需求，如容量、速度和成本等因素

## Virtual Memory Manager

所有的进程都由OS管理，而memory则由vm manager管理。

VMM的职责：

- Map virtual to physical addresses 
- Protection: 
  - Isolate memory between processes 
  - Each process gets dedicate ”private” memory
  - Errors in one program won’t corrupt memory of other program 
  - Prevent user programs from messing with OS’s memory 
- Swap memory to disk 
  - Give illusion of larger memory by storing some content on disk 
  - Disk is usually much larger and slower than DRAM

## Paged Memory

<img src=".\cs61c_pics\page.png" style="zoom:67%;" />

Physical memory (DRAM) is broken into pages s

- Typical page size: 4 KiB+ (on modern OSs) --- Need 12 bits to address 4KiB（这也正好是硬盘中最小的可寻址块的大小512bytes的倍数）

<img src=".\cs61c_pics\paged-memory-address-translation.png" style="zoom:80%;" />

当程序访问虚拟内存时，操作系统会通过页表来将虚拟地址转换为物理地址。页表中的每一项都包含了虚拟页和物理页之间的映射关系。当程序访问虚拟页时，操作系统会查找页表并获取相应的物理页的地址，从而完成内存访问。内存管理器负责管理物理内存，跟踪空闲页框并更新页表，以便程序可以正常访问内存。这样，计算机就可以实现虚拟内存的扩展和合理分配内存资源。

> • 页面是内存分配给程序的基本单元。为了高效利用内存,大部分程序的地址空间会分割成多个固定大小的页面。
>
> • 页表是用来跟踪和管理这些页面的。每个页面对应页表中的一个页表项(Page Table Entry)。
>
> • 页表项包含该页面的物理地址和其他信息,如:
>
> - 该页面是否存在(present bit)
> - 页面是否可读/可写(read/write bit)
> - 页面是否需要复制到二级缓存(cached bit)
>
> • 当程序访问一个虚拟地址时,CPU利用虚拟地址的一部分作为索引,找到对应的页表项。
>
> • 根据页表项中的物理页框号和虚拟地址中的页面内偏移,CPU计算出完整的物理地址。
>
> • 所以,页表负责跟踪和管理内存中的页面,它与虚拟地址到物理地址的转换密切相关。
>
> 以上就是页面和页表之间的关系。页面是内存分配的基本单位,页表负责管理和跟踪这些页面,并且用来实现虚拟地址到物理地址的转换。

Store page tables in memory (DRAM)

- Two (slow) memory accesses per lw/sw on cache miss 

- How could we minimize the performance penalty? 

- Transfer blocks (not words) between DRAM and processor cache 
  - Exploit spatial locality 

- Use a cache for frequently used page table entries …

### Protection

<img src=".\cs61c_pics\page-protection.png" style="zoom:67%;" />



<img src=".\cs61c_pics\page-protection2.png" style="zoom:67%;" />



### Common point of confusion

- Bytes
- Words 
- Blocks
- Pages
- 都只不过是memory的表示方法罢了。

<img src=".\cs61c_pics\bytes,words,blocks,pages.png" style="zoom:67%;" />

### Page Memory Access

<img src=".\cs61c_pics\page-memory-aaccess.png" style="zoom:67%;" />



### Page Fault

<img src=".\cs61c_pics\page-fault.png" style="zoom:67%;" />

- Write-Through or Write-Back?

  - DRAM acts like “cache” for disk

  <img src=".\cs61c_pics\page-write-policy.png" style="zoom:67%;" />



### Page Table Size

如果一个32位的系统的页表大小是4kb，那么一个进程的页表占4 * 2^20^ = 4 Mb，大约是一个4GB内存的0.1%。那么如果有256个进程的时候，页表的大小约为1GB，占到了内存的四分之一！

我们知道页表并非总是被数据填满，有时stack和heap之间会有很大的空隙，造成空间的浪费。为了减轻内存的占用，我们使用多级页表(Hierarchical page tables, w/ decreasing page size)来解决这个问题。

<img src=".\cs61c_pics\hierarchical-page-table.png" style="zoom:67%;" />

> 在多级页表中,较低级的页表仅在需要访问该页表对应虚拟地址范围时才会被加载到内存中。
>
> 处理器在转换虚拟地址时首先使用最高级的页表,例如一级页表。一级页表中的页表项包含指向二级页表的指针。
>
> 当处理器需要访问二级页表对应虚拟地址范围内的地址时,它才会真正读取(加载)二级页表至内存。
>
> 在这之前,二级页表只存在于磁盘或交换空间中,但并未加载到物理内存中,因此不占用内存空间。
>
> 只有在需要访问该页表对应的虚拟地址范围时,操作系统才会将二级页表读入内存,这一过程就称为"加载(该级)页表项到内存"。
>
> 处理器在读取二级页表项后,才能得到最终的物理地址。

> A hierarchical page table can save memory usage because it allows the operating system to only allocate memory for the page table entries that are actually being used. In a single-level page table, an entry must be allocated for every possible virtual page, even if many of those virtual pages are not being used. This can result in a large amount of memory being wasted on unused page table entries.
>
> In contrast, a hierarchical page table only needs to allocate memory for the top-level directory and the second-level page tables that are actually being used. If a virtual page is not being used, its corresponding second-level page table does not need to be allocated, saving memory.
>
> For example, consider a two-level page table with a top-level directory containing 1024 entries and each second-level page table also containing 1024 entries. If only 10% of the virtual address space is being used, then only 10% of the second-level page tables need to be allocated. This means that instead of allocating memory for 1024 * 1024 = 1,048,576 page table entries (as would be required in a single-level page table), only 1024 + (0.1 * 1024 * 1024) = 104,960 page table entries need to be allocated, saving a significant amount of memory.

虚拟地址到物理地址的转换过程:

1. CPU使用虚拟地址的一部分作为页表索引值。这个部分称为页表索引值。
2. 页表包含了页表项(PTE),每个虚拟页对应一个PTE。每个PTE包含一个物理页号和一些状态或权限位。
3. CPU利用页表索引值查找对应的PTE,并读取这个PTE。
4. PTE保存的物理页号与虚拟地址的偏移部分结合得到完整的物理地址。
5. PTE中的状态位表示该页是否有效、是否可写、是否可执行等。 CPU检查这些位以决定内存访问是否允许。
6. 对于非常大的虚拟地址空间,使用多级页表。页表索引值首先索引到第一级页表,它包含指向第二级页表的指针,依此类推。

### Translation Lookside Buffers

<img src=".\cs61c_pics\address-protection-and-translation.png" style="zoom:67%;" />



<img src=".\cs61c_pics\tlb.png" style="zoom:67%;" />

TLB:

Typically 32-128 entries, usually fully associative 

- Each entry maps a large page, hence less spatial locality across pages  -- more likely that two entries conflict 
- Sometimes larger TLBs (256-512 entries) are 4-8 way set-associative 
- Larger systems sometimes have multi-level (L1 and L2) TLBs 

Random or FIFO replacement policy 

“TLB Reach”: Size of largest virtual address space that can be simultaneously mapped by TLB

<img src=".\cs61c_pics\TLB-location.png" style="zoom:50%;" />

如果tlb miss发生了，那么就去memory里的page table寻找对应VA的PA。一般而言，TLB的hit rate非常高，大于99%。



<img src=".\cs61c_pics\tlb-address-translation.png" style="zoom:67%;" />

## VM and Cache

<img src=".\cs61c_pics\comparing-cache-and-vm.png" style="zoom:67%;" />



<img src=".\cs61c_pics\impact-of-paging-on-AMAT.png" style="zoom:67%;" />

## I/O

处理器与不同的外设互动，就要使用I/O接口。

处理器和I/O之间的互动主要有两类：

1. 读数据：读取一串数据；
2. 写数据：向I/O里写入一串数据；

一般来说，我们使用 **Memory mapped I/O** , 即把内存地址的低位空出来一些留给I/O设备的寄存器。操作数据时使用的指令和操作内存数据的指令是一样的：lw，sw

<img src=".\cs61c_pics\memory-mapped-io.png" style="zoom:67%;" />

不同I/O设备的速率是不一样的，见下图：

<img src=".\cs61c_pics\processor-io-speed-mismatch.png" style="zoom:50%;" />

为了解决I/O设备和处理器速率不匹配的问题，我们使用下列方法来解决这个问题：

### Polling

- 轮询（polling）：
  - Device registers generally serve two functions: 
    - Control Register, says it’s OK to read/write (I/O ready) [think of a flagman on a road] 
    - Data Register, contains data 

Processor reads from Control Register in loop 

- Waiting for device to set Ready bit in Control reg (0 → 1) 

- Indicates “data available” or “ready to accept data” 

Processor then loads from (input) or writes to (output) data register 

- I/O device resets control register bit (1 → 0) 

**Procedure called “Polling”**.

轮询适合每秒轮询次数较少的设备，如果某个设备轮询次数太多，那么CPU的开销会很大。

### Interrupts

Occurs when I/O is ready or needs attention 

- Interrupt current program 
- Transfer control to the trap handler in the operating system 

Interrupts: 

- No I/O activity: Nothing to do 
- Lots of I/O: Expensive – thrashing caches, VM, saving/restoring state

现代做法：

**Low data rate** (e.g. mouse, keyboard) ：Use interrupts. 

**High data rate** (e.g. network, disk) ： Start with interrupts... 

-  If there is no data, you don't do anything! 
- Once data starts coming... Switch to Direct Memory Access (DMA)

### DMA

Allows I/O devices to directly read/write main memory 

New hardware: The DMA Engine 

DMA engine contains registers written by CPU: 

- Memory address to place data 

- chunk of bytes

- I/O device #, direction of transfer 

- unit of transfer, amount to transfer per burst

<img src=".\cs61c_pics\DMA.png" style="zoom:80%;" />

接收数据的时候，CPU从设备那里收到一个interrupt，然后初始化传输：指示DMA把数据载入一个确定的地址中，然后DMA会执行数据的传输，传输完成后给CPU一个interrupt。

输出数据的时候，CPU先确认外设准备完毕，然后执行传输，告诉DMA数据在某个特定的地址中且可用，然后DMA执行传输，直到传输完成后，DMA给CPU一个interrupt。

#### Where is DMA

一般来说，现在的DMA大多位于最后一级cache和memory之间。这样做的好处是DMA不会扰乱cache的工作，但坏处是：Need to explicitly manage coherency。

### Networking

SW Send steps 

1: Application copies data to OS buffer 

2: OS calculates checksum, starts timer 

3: OS sends data to network interface HW and says start 



SW Receive steps 

3: OS copies data from network interface HW to OS buffer 

2: OS calculates checksum, if OK, send ACK; if not, delete message (sender resends when timer expires) 

1: If OK, OS copies data to user address space, & signals application to continue

# Flynn's Taxonomy

> 弗林分类法（Flynn's Taxonomy）是一种将计算机体系结构根据并发指令流（或“线程”）和数据流的数量进行分类的分类系统。它由迈克尔·J·弗林在1966年提出，并已成为计算机体系结构中的重要概念。
>
> - 为什么弗林分类法很重要呢？
>
> 弗林分类法提供了一个框架，用于理解和分类不同类型的计算机体系结构。它帮助研究人员、工程师和设计师分析和比较各种体系结构的能力和限制。通过将体系结构分类为不同的类别，它能更好地了解其性能特征、并行性和效率。
>
> - 弗林分类法是如何工作的呢？
>
> 弗林分类法将计算机体系结构分为四个类别：
>
> 1. 单指令流单数据流（SISD）：在这个类别中，单个指令流操作单个数据流。它代表传统的顺序计算，其中指令逐个在单个处理单元上执行，就像典型的个人计算机一样。
> 2. 单指令流多数据流（SIMD）：在这个类别中，单个指令流控制多个数据流。SIMD体系结构同时对多个数据元素执行相同的指令。它通常用于并行处理系统，例如图形处理器（GPU），其中相同的操作应用于多个数据元素。
> 3. 多指令流单数据流（MISD）：这个类别较少见，表示多个指令流操作单个数据流的体系结构。MISD体系结构具有有限的实际应用，主要是理论上的兴趣。
> 4. 多指令流多数据流（MIMD）：在这个类别中，多个指令流同时操作多个数据流。MIMD体系结构能够同时在不同的数据上执行不同的指令，实现真正的并行处理。它通常用于多核处理器、集群和分布式计算系统。
>
> 通过将计算机体系结构分为这四个类别，弗林分类法为理解各种计算机系统的并行处理能力和组织提供了基础。
>
> 需要注意的是，虽然弗林分类法是一个有用的框架，但一些现代体系结构由于复杂性和混合性质而可能不完全符合单一的分类。

## SIMD Architectures

SIMD在单指令时处理多个数据。比如进行向量的运算。

Sources of performance improvement: 

- One instruction is fetched & decoded for entire operation 
- Multiplications are known to be independent 
- Pipelining/concurrency in memory access as well

<img src=".\cs61c_pics\intels_simd.png" style="zoom:67%;" />

Intel AVX SIMD Instructions 

- One instruction fetch that operates on multiple operands simultaneously 
- 512/256/128/64-bit AVX registers 
- Use C intrinsics

# Thread-level Parallelism

自从2005年起，"顺序应用性能"(Sequential App Performance)就遇到了瓶颈，无论我们如何增加transistor的数量也无济于事。所以，提高程序的性能的希望就转移到了多核与并行处理上。

## Multiprocessor 

<img src=".\cs61c_pics\multiprocessor-execution-model.png" style="zoom:80%;" />

## Threads

A Thread stands for “thread of execution”, is a single stream of instructions.

> Thread: sequence of instructions, with own program counter and processor state (e.g., register file)

- A program / process can split, or fork itself into separate threads, which can (in theory) execute simultaneously. 
- An easy way to describe/think about parallelism 

With a single core, a single CPU can execute many threads by Time Sharing

More details:

- Sequential flow of instructions that performs some task 
- Each thread has: 
  - Dedicated PC (program counter) 
  - Separate registers 
  - Accesses the shared memory 
- Each physical core provides one (or more)
  - **Hardware threads** that actively execute instructions 
  - Each executes one “hardware thread” 
- Operating system multiplexes multiple 
  - **Software threads** onto the available hardware threads
  - All threads except those mapped to hardware threads are waiting

## OS Threads

操作系统的线程给我们造成一种“多线程同时运行”的假象：

1. 许多软件线程在硬件线程上同时运行；
2. 把软件线程从硬件线程上移除
3. 加载先前保存的寄存器并执行不同的软件线程

## Multithreading

超线程，由Intel提出的一个概念。

即把单个的物理CPU核心变成多个逻辑CPU核心来使用，每个逻辑核心可以同时执行不同的指令流，从而实现了同时执行多个线程的效果。虽然超线程可以提高CPU的执行效率，但是它也会增加CPU的功耗和热量，所以在一些高性能应用场景下可能需要关闭超线程来获得更好的性能和稳定性。

## Definitions

**Thread**: sequence of instructions, with own program counter and processor state (e.g., register file) 

**Multicore**:  

- **Physical CPU**: One thread (at a time) per CPU, in software OS switches threads typically in response to I/O events like disk read/write  
- **Logical CPU**: Fine-grain thread switching, in hardware, when thread blocks due to cache miss/memory access  
- **Hyper-Threading** aka Simultaneous Multithreading (SMT): Exploit superscalar architecture to launch instructions from different threads at the same time!
