#!/bin/bash 


function folderFinder() {
	local folder=$1
	if [ ! -d $folder ]; then 
		mkdir ./$folder 
		return $?
	else 
		echo "Folder $folder already exists"
		exit 2
	fi 
}


function movepdfs() {
	folderFinder "pdf"
	status=$(mv *.pdf ./pdf)


}

function move_image() {
	mkdir ./images 
	status=$(mv *.png ./images)
	echo $status 
}

function move_xlsx() {
	mkdir ./Excel 
	status=$(mv *.xlsx ./Excel)
}

function move_docx() {
	mkdir ./docx
	status=$(mv *.docx ./docx)
}

function move_svg() {
	command=$(mkdir ./svg)
	if [command -eq 0]; then
		echo "Carpeta creada con exito"
	else 
		echo "Ya existe una carpeta con el nombre svg"
	fi 

	status=$(mv *.svg ./svg)
}

function move_cdr() {
	mkdir ./cdr_files 
	status=$(mv *.cdr ./cdr_files)
}


while getopts "pish" opt; do 
	case "${opt}" in 
		p) echo "Moving PDF files $OPTARG option enabled"
		movepdfs ;;

	 	i) echo "Moving img files $OPTARG option enabled"
	 	move_image ;;

	 	s) echo "Moving svg files $OPTARG option enabled"
	 	move_svg ;;

	 	h) echo "[?] HELP MODE
	 	[!] Set execution mode with -> chmod +x 

	 	./script.sh -[command]
	 	-p Move pdf files 
	 	-i Move image files .png files 
	 	-h Help Mode (this view)" ;;
	esac 
done 


























