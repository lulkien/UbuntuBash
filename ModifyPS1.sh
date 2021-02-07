#! /bin/bash

# '\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]@\u:\[\033[01;34m\]\w\[\033[31m\]$(parse_git_branch)\[\033[00m\]\$ '

# function declare

gr='\033[1;32m'
yl='\033[1;33m'
blue='\033[1;34m'
wh='\033[0;37m'

function get_format() {
	case $1 in
		"B" | "b") 	# black case 30m
			case $2 in
				"Y" | "y")
					RET='\033[1;30m'
					;;
				*)
					RET='\033[0;30m'
					;;
			esac
			;;
		"R" | "r")	# red case 31m
			case $2 in
				"Y" | "y")
					RET='\033[1;31m'
					;;
				*)
					RET='\033[0;31m'
					;;
			esac
			;;
		"G" | "g")	# green case 32m
			case $2 in
				"Y" | "y")
					RET='\033[1;32m'
					;;
				*)
					RET='\033[0;32m'
					;;
			esac
			;;
		"E" | "e")	# blue case 34m
			case $2 in
				"Y" | "y")
					RET='\033[1;34m'
					;;
				*)
					RET='\033[0;34m'
					;;
			esac
			;;
		"P" | "p")	# purple case 35m
			case $2 in
				"Y" | "y")
					RET='\033[1;35m'
					;;
				*)
					RET='\033[0;35m'
					;;
			esac
			;;
		"Y" | "y")	# yellow case 33m
			case $2 in
				"Y" | "y")
					RET='\033[1;33m'
					;;
				*)
					RET='\033[0;33m'
					;;
			esac
			;;

		*)		# default case(white) 37m
			case $2 in
				"Y" | "y")
					RET='\033[1;37m'
					;;
				*)
					RET='\033[0;37m'
					;;
			esac
			;;
	esac

	echo "\[$RET\]"
}

# main script

prefix='\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}' 

echo 'Prefix structure looks like this: '
echo -e "${gr}<Name>:${blue}<Current Directory>${yl}<Every shit you want>${wh}$ <commands shit>"
echo
echo 'Allow to use color(Y/n)?'
read choice

while [ -z $choice ]
do
	read choice
done

under='\033[4;37m'
norm='\033[0;37m'
bold='\033[1;37m'

# setup name field
echo -e "Enter ${gr}<Name> ${wh}field (Default is: username@hostname): "
read name
if [ -z "$name" ]
then
	name='\u@\h'
fi

if [[ "$choice" = 'Y' || "$choice" = 'y' ]]
then
	echo
	echo -e "Choose ${gr}<Name> ${wh}color"
	echo "Bold text(Y/n)?"
        read isBold

        # get text color
        echo -e -n "${under}${bold}B${norm}lack(B),"    #B
        echo -e -n " ${under}${bold}R${norm}ed(R),"     #R
        echo -e -n " ${under}${bold}G${norm}reen(G),"   #G
        echo -e -n " Blu${under}${bold}e${norm}(E),"    #E
        echo -e -n " ${under}${bold}W${norm}hite(W),"   #W
        echo -e -n " ${under}${bold}P${norm}urple(P),"  #P
        echo -e    " ${under}${bold}Y${norm}ellow(Y)"   #Y
        read color

	nameFormat="$(get_format $color $isBold)"
else
	nameFormat=""
fi
isBold=
color=

# setup <Current directory> field
if [[ "$choice" = "Y" || "$choice" = "y" ]]
then
	echo
	echo -e "Choose ${blue}<Current Directory> ${wh}color"
	echo 'Bold text(Y/n)?'
	read isBold

	#get text color
	echo -e -n "${under}${bold}B${norm}lack(B),"    #B
        echo -e -n " ${under}${bold}R${norm}ed(R),"     #R
        echo -e -n " ${under}${bold}G${norm}reen(G),"   #G
        echo -e -n " Blu${under}${bold}e${norm}(E),"    #E
        echo -e -n " ${under}${bold}W${norm}hite(W),"   #W
        echo -e -n " ${under}${bold}P${norm}urple(P),"  #P
        echo -e    " ${under}${bold}Y${norm}ellow(Y)"   #Y
        read color

	dirFormat="$(get_format $color $isBold)"
else
	dirFormat=""
fi

isBold=
color=

# setup <Option>
echo
echo -e "Enter every shit you want to add here, ex. ${yl}git branch${wh}"
read opt

if [[ "$choice" = "Y" || "$choice" = "y" ]]
then
	echo
        echo -e "Choose ${yl}<Every Option shit> ${wh}color"
        echo 'Bold text(Y/n)?'
        read isBold

        #get text color
        echo -e -n "${under}${bold}B${norm}lack(B),"    #B
        echo -e -n " ${under}${bold}R${norm}ed(R),"     #R
        echo -e -n " ${under}${bold}G${norm}reen(G),"   #G
        echo -e -n " Blu${under}${bold}e${norm}(E),"    #E
        echo -e -n " ${under}${bold}W${norm}hite(W),"   #W
        echo -e -n " ${under}${bold}P${norm}urple(P),"  #P
        echo -e    " ${under}${bold}Y${norm}ellow(Y)"   #Y
        read color

        optFormat="$(get_format $color $isBold)"
else
        optFormat=""
fi

isBold=
color=

# setup <Commands>
echo
if [[ "$choice" = "Y" || "$choice" = "y" ]]
then
        echo 'Choose <Commands> color'
	isBold="n"

        #get text color
        echo -e -n "${under}${bold}B${norm}lack(B),"    #B
        echo -e -n " ${under}${bold}R${norm}ed(R),"     #R
        echo -e -n " ${under}${bold}G${norm}reen(G),"   #G
        echo -e -n " Blu${under}${bold}e${norm}(E),"    #E
        echo -e -n " ${under}${bold}W${norm}hite(W),"   #W
        echo -e -n " ${under}${bold}P${norm}urple(P),"  #P
        echo -e    " ${under}${bold}Y${norm}ellow(Y)"   #Y
        read color

        cmdFormat="$(get_format $color $isBold)"
else
        cmdFormat="\[\033[0;37m\]"
fi

isBold=
color=


FINALE="$prefix$nameFormat$name:$dirFormat\w$optFormat$opt$cmdFormat$ "
echo "$FINALE "

