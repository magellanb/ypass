
# YPASS - Your Personal Assisted Setup Script

Script to automate some installation and configuration processes for Linux, using custom presets.
## Some words

I'm always dealing with my family members' computers, and my own of course, when it comes to formatting, installing things, setting them up and etc., and you know, it can be a real pain sometimes.

I've created this script to help myself with the tedious and time-consuming setup of a fresh Linux distribution installation (nowadays, I use Xubuntu). That's really the only purpose for this script.

I'm not a programmer. To be honest, three days ago I didn't even know what to do, how to start coding this. I'm not kidding at all! But I had the idea on my mind and after hours of research (Bash Script and LibreOffice Basic), countless cups of coffee and a lot of trial an error, the script is finally ready.

I decided to share it with anyone that cares; first because I think other people might want to do the same, but don't know how (just like me, days ago); and second because, although this already works as expected, it is far from perfect. Actually, I'm pretty sure many things here could have been coded differently. So, if anyone wants to fork this and make it simpler, smoother, smarter, better, etc.; feel free, be my guest! I would love to see what you could do to improve this script and, mainly, I will love to learn more from you, guys, if you don't mind sharing your knowledge.

To many people, this can be a very poor piece of code and I do not disagree. But, to me -- oh, boy! -- this is a masterpiece! (lol) I hope it can be useful to you as much as it is to me, and I also hope you can enjoy it just as much as I am.

Cheers.
## About the script

This script will guide you through some installation and configuration using custom presets.

The presets are basically text files filled with commands that you would normarlly type in the terminal, one by one.

I've been using Xubuntu for while now, so all the presets I created and shared here are basically targeting this distribution.

However, as long as you use Bash in your terminal, this script can be used with any Linux distribution. All you have to do is create your own presets with the suitable commands you need.

It also has Resume and Log functions. You can quit the script at any point you want and resume from that point on when you run the script again. And if you want to choose a random number of process to start from, that is possible as well. The 'ypass-log' file keeps track of all the processes that have been executed, no matter if it was completed or skipped.

This script has been tested on Xubuntu 23.04 and it works flawlessly. Some of the presets that I have already created are targeted to XFCE only, but as you know, all the rest can also be used with any other desktop environment. During the process, you can simply skip the ones related to XFCE only and/or any others that you wish, according to your needs. Or, like I said, you can use the speadsheet and create your own scripts targeting the desktop environment of your choice. Fell free.
## How the script works

The script has a very simple approach.

You have a text file (ypass-preset-list) with a list of presets and a folder (ypass-preset-files) with other text files which are the presets themselves.

When you run the script, it will read the 'ypass-preset-list' file and execute each process, line by line, according to its matching file in the 'ypass-preset-files' folder.

For example, in the 'ypass-preset-list' file, you have this:

```bash
Install Firefox|install-firefox
```

The text on the left side of the pipe symbol (|) is the description of the process and the text on the right side is the name of its matching preset file in the 'ypass-preset-files' folder.

In the 'install-firefox' preset file, you'll find the following command:

```bash
sudo apt install firefox
```

Then, the script will run that command. Simple like that!
## Download

```bash
  git clone https://github.com/magellanb/ypass.git
  cd ypass
```
## Usage

```bash
./ypass.sh
```

Then, follow the prompts on your screen.

You can create your own preset files. To help you with that, there is a spreadsheet (a LibreOffice Calc file called 'ypass-presets-creator.ods') that you can use to automate the process. When you open the file, you will see that it is pretty self-explanatory. Once you have everything already filled in the spreadsheet, run the macro available in it: mcrCreatePresets. By the way, feel free to audit the code of the macros before you run them. The same goes for this script itself.
## Author

- [@magellanb](https://www.github.com/magellanb)

