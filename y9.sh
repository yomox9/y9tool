#!/bin/sh -eu

mmenu()
	{
	ls -1|grep -v -e 'README.md' -e `basename $0`| grep -n -v '^$'
	menumax=`ls -1|grep -v -e 'README.md'| grep -n -v '^$'|wc -l`
	read inputnum
	# echo inputnum=${inputnum}_
	if [ "$inputnum" = "" ]; then mmenu ; fi
	if [ ! $inputnum -gt $menumax ] && [ ! $inputnum -eq 0 ];
	then
		# echo $inputnum
		selectMenu=`ls -1|grep -v -e 'README.md'| grep -n -v '^$' | sed -n ${inputnum}p | awk -F: '{print $2}'`
		echo $selectMenu
		$selectMenu;
	fi
}

mmenu
