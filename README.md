<hr>
<center>
  <b>WELCOME TO YPASS - YOUR PERSONAL ASSISTED SETUP SCRIPT</b>
  <br>
  <b>By Bruce Magellan</b>
</center>
<br>
<hr>
<b>SOME WORDS</b>
<br><br>
I am always dealing with my family members' computers, and my own of course, when it comes to formatting, installing things, setting them up and etc., and you know, it can be a real pain sometimes.
<br><br>
I have created this script to help myself with the tedious and time-consuming setup of a fresh Xubuntu (or any other Ubuntu derivative) installation. That's really the only purpose for this script.
<br><br>
I am not a programmer. To be honest, three days ago I did not even know what to do, how to start coding this. I am not kidding at all! But I had the idea on my mind and after hours of research (Bash Script and LibreOffice Basic), countless cups of coffee and a lot of trial an error, it is finally ready.
<br><br>
I decided to share it with anyone that cares; first because I think other people might want to do the same, but do not know how (just like me, days ago); and second because, although this already works as expected, it is far from perfect. Actually, I am pretty sure many things here could have been coded differently. So, if anyone wants to fork this and make it simpler, smoother, smarter, better, etc.; feel free, be my guest! I would love to see what you could do to improve this script and, mainly, I would love to learn more from you, guys, if you were also willing to share your knowledge.
<br><br>
To many people, this can be a very poor piece of code and I do not disagree. But, to me -- oh, boy! -- this is a masterpiece! (lol) I hope it can be useful to you as much as it is to me, and I also hope you can enjoy it just as much as I am.
<br><br>
Cheers.
<br><br>
Bruce Magellan
<br>
<hr>
<b>ABOUT THE SCRIPT</b>
<br><br>
This script will guide you through some installation and configuration using presets that you can find in the 'ypass-preset-files' folder.
<br><br>
The presets are basically text files filled with commands that you would normarlly type in the terminal, one by one.
<br><br>
You can create your own presets. To help you with that, there is a spreadsheet (a LibreOffice Calc file called 'ypass-presets-creator.ods') that you can use to automate the process. When you open the file, you will see that it is pretty self-explanatory. Once you have everything already filled in the spreadsheet, run the two macros available in it: mcrCreatePresetFiles and mcrCreatePresetList. By the way, feel free to audit the code of the macros before you run them. The same goes for this script itself.
<br><br>
When you run this script, it will read the 'ypass-preset-list' file and execute each process, line by line, according to its matching file in the 'ypass-preset-files' folder. Simple like that!
<br><br>
It also has Resume and Log functions. You can quit the script at any point you want and resume from that point on when you run the script again. And if you want to choose a random number of process to start from, that is possible as well. The 'ypass-log' file keeps track of all the processes that have been executed, no matter if it was completed or skipped.
<br><br>
This script has been tested on Xubuntu 23.04 and it works flawlessly. Some of the presets that I have already created are targeted to XFCE only, but as you know, all the rest can also be used with any other desktop environment. During the process, you can simply skip the ones related to XFCE only and/or any others that you wish, according to your needs. Or, like I said, you can use the speadsheet and create your own scripts targeting the desktop environment of your choice. Fell free.
<br>
<hr>
