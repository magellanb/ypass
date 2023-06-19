#!/bin/bash

clear

#Custom Functions
fncDrawLine() {
    printf '%.s-' $(seq 1 $(tput cols)); echo ""
}

fncFileExists() {
    [ -f "$1" ]
}

fncFileMissing() {
    echo "• Error: The file '"$1"' is missing. Unable to proceed. Aborting setup."
    echo ""
    fncDrawLine
    echo ""
    exit
}

fncDateTime() {
    varDateTime=`date +"%A, %B %d, %Y - %I:%M %p"`
}

fncLogProcess() {
    fncDateTime
    echo ${varDateTime} "-" $varProcessStatus "- Process" $varProcessCount "-" $varProcessDescription >> ./ypass-log
}

fncSaveProcessNumber() {
    echo $varProcessCount > ./ypass-count
}

fncLowerCase() {
    echo $1 | sed 's/./\L&/g'
}

fncAlignCenter() {
    echo $1 | sed  -e :a -e "s/^.\{1,$(tput cols)\}$/ & /;ta" | tr -d '\n' | head -c $(tput cols); echo ""
}


#Print header
echo ""
fncDrawLine
echo ""
fncAlignCenter "WELCOME TO YPASS - YOUR PERSONAL ASSISTED SETUP SCRIPT"
fncAlignCenter "By Bruce Magellan"
echo ""
fncDrawLine
echo ""
echo "• ABOUT THE SCRIPT"
echo ""
echo "This script will guide you through some installation and configuration using presets that you can find in the 'ypass-preset-files' folder."
echo ""
echo "The presets are basically text files filled with commands that you would normarlly type in the terminal, one by one."
echo ""
echo "You can create your own presets. To help you with that, there is a spreadsheet (a LibreOffice Calc file called 'ypass-presets-creator.ods') that you can use to automate the process. When you open the file, you will see that it is pretty self-explanatory. Once you have everything already filled in the spreadsheet, run the two macros available in it: mcrCreatePresetFiles and mcrCreatePresetList. By the way, feel free to audit the code of the macros before you run them. The same goes for this script itself."
echo ""
echo "When you run this script, it will read the 'ypass-preset-list' file and execute each process, line by line, according to its matching file in the 'ypass-preset-files' folder. Simple like that!"
echo ""
echo "It also has Resume and Log functions. You can quit the script at any point you want and resume from that point on when you run the script again. And if you want to choose a random number of process to start from, that is possible as well. The 'ypass-log' file keeps track of all the processes that have been executed, no matter if it was completed or skipped."
echo ""
echo "This script has been tested on Xubuntu 23.04 and it works flawlessly. Some of the presets that I have already created are targeted to XFCE only, but as you know, all the rest can also be used with any other desktop environment. During the process, you can simply skip the ones related to XFCE only and/or any others that you wish, according to your needs. Or, like I said, you can use the speadsheet and create your own scripts targeting the desktop environment of your choice. Fell free."
echo ""
fncDrawLine
echo ""
read -rsn1 -p "Press any key to continue."; echo ""
echo ""
fncDrawLine
echo ""

#Check if ypass-preset-list exists. If so, get total number of processes. If not, abort setup.
fncFileExists "./ypass-preset-list" && varProcessTotal=$(awk 'END { print NR }' < ./ypass-preset-list) || fncFileMissing "ypass-preset-list"

#Print list of processes
echo "• LIST OF PROCESSES"
echo ""
echo "# - PROCESS TYPE - PROCESS DESCRIPTION"
echo ""
for varProcessCount in $(seq 1 $varProcessTotal)
do
    #Get process name
    varProcessDescription=$(sed "${varProcessCount}q;d" ./ypass-preset-list | awk -F'|' '{print $1}')

    #Get process action
    varProcessPresetName=$(sed "${varProcessCount}q;d" ./ypass-preset-list | awk -F'|' '{print $2}')

    #Print process line
    echo $varProcessCount "-" $varProcessDescription
done
echo ""
fncDrawLine
echo ""
echo "• LET'S GET STARTED!"
echo ""
echo "• As you can see, according to the list above, there are" $varProcessTotal "processes available. It is up to you whether you are going to execute or skip each one of them, according to your needs."
echo ""

#Check if ypass-count exists. If so, get the number of the last completed process. If not, assume 1.
fncFileExists "./ypass-count" && varProcessStart=$(sed '1q;d' ./ypass-count) || varProcessStart=1

#Check if the last completed process is less than the total number of processes.
if [ "$varProcessStart" -ge 1 ] && [ "$varProcessStart" -lt "$varProcessTotal" ]; then
    echo "• Last time you ran this setup, you completed process" $varProcessStart"."
    echo ""
    echo "• Obs.: If you have made any changes to the preset list and/or the preset files since the last time you ran this setup," $varProcessStart "might not be the same process from before anymore. In this case, it is recommended to choose a specific process to start from or start over from process one."
    echo ""
    echo "• What do you want to do now?"
    echo ""
    echo "1. Resume from where I stopped."
    echo "2. Choose a specific process to start from / Start over from process one."
    echo "3. Cancel and exit setup."
    echo ""
    while true; do
        read -p "• Type the number of your choice: " varAnswer
        echo ""
        case $varAnswer in
            [1]*)
                varProcessStart=$(( $varProcessStart + 1 ))
                break
                ;;
            [2]*)
                varProcessStart=0
                break
                ;;
            [3]*)
                echo "• SETUP ABORTED AS REQUESTED."
                echo ""
                fncDrawLine
                echo ""
                exit
                ;;
            *)
                echo "• Wrong answer."
                echo ""
                ;;
        esac
    done
   fncDrawLine
   echo ""
fi

#Check if the last completed process is one or the total number of processes.
if [ "$varProcessStart" -eq 0 ] || [ "$varProcessStart" -ge "$varProcessTotal" ]; then
    echo "• What do you want to do now?"
    echo""
    echo "1. Type the number of the process I want to start from."
    echo "2. Start over from process one."
    echo "3. Cancel and exit setup."
    echo ""
    while true; do
        read -p "• Type the number of your choice: " varAnswer
        echo ""
        case $varAnswer in
            [1]*)
                while true; do
                read -p "• Type the number of the process you want to start from. It has to be between 1 and "$varProcessTotal": " varAnswer
                echo ""
                    case $varAnswer in
                        ''|*[!0-9]*)
                            echo "• Wrong answer."
                            echo ""
                            ;;
                        *)
                            if [ "$varAnswer" -ge 1 ] && [ "$varAnswer" -le "$varProcessTotal" ]; then
                                varProcessStart=$varAnswer
                                break
                            else
                                echo "• Wrong answer."
                                echo ""
                            fi
                            ;;
                    esac
                done
                break
                ;;
            [2]*)
                varProcessStart=1
                break
                ;;
            [3]*)
                echo "• SETUP ABORTED AS REQUESTED."
                echo ""
                fncDrawLine
                echo ""
                exit
                ;;
            *)
                echo "• Wrong answer."
                echo ""
                ;;
        esac
    done
   fncDrawLine
   echo ""
fi

#Start process
for varProcessCount in $(seq $varProcessStart $varProcessTotal)
do
    #Get process name
    varProcessDescription=$(sed "${varProcessCount}q;d" ./ypass-preset-list | awk -F'|' '{print $1}')

    #Get process action
    varProcessPresetName=$(sed "${varProcessCount}q;d" ./ypass-preset-list | awk -F'|' '{print $2}')

    #Begin process
    echo "• PROCESS" $varProcessCount "OF" $varProcessTotal
    echo "•" $varProcessDescription
    fncFileExists "./ypass-preset-files/$varProcessPresetName" && echo "• Before you proceed, check out what this process is going to perform:" || fncFileMissing "./ypass-preset-files/"$varProcessPresetName
    echo ""
    cat ./ypass-preset-files/$varProcessPresetName
    echo ""
    echo "• What do you want to do?"
    echo ""
    echo "1. Proceed with this process."
    echo "2. Skip this process."
    echo "3. Cancel and exit setup."
    echo ""
    while true; do
        read -p "• Type the number of your choice: " varAnswer
        echo ""
        case $varAnswer in
            [1]*)
                bash ./ypass-preset-files/$varProcessPresetName
                echo ""
                varProcessStatus="Completed"
                echo -n "• Process" $varProcessCount "" & fncLowerCase $varProcessStatus"."
                fncLogProcess
                break
                ;;
            [2]*)
                varProcessStatus="Skipped"
                echo -n "• Process" $varProcessCount "" & fncLowerCase $varProcessStatus"."
                fncLogProcess
                break
                ;;
            [3]*)
                echo "• SETUP ABORTED AS REQUESTED."
                echo ""
                fncDrawLine
                echo ""
                exit
                ;;
            *)
                echo "• Wrong answer."
                echo ""
                ;;
        esac
    done
    echo ""
    if [ "$varProcessCount" -eq "$varProcessTotal" ]; then
        echo "• YOU HAVE REACHED THE END OF THIS SETUP."
        echo ""
    fi
    fncDrawLine
    echo ""
    fncSaveProcessNumber
done