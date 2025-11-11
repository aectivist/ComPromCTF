#!/bin/bash
CTFDirectory=~/Desktop/CTF

#only external command is wl-clipboard, pls install it

taskdone="T" #I LOVE FUCKING UNOPTIMIZED CODE!!!!!!!!!!!! 
#Idk what the FUCK Im doing but ts is fun so why the fuck not
while [ $taskdone="T" ]; do #written by .4ct.
	
	echo " ____  ____  _      ____  ____  ____  _     "
	echo "/   _\/  _ \/ \__/|/  __\/  __\/  _ \/ \__/|"
	echo "|  /  | / \|| |\/|||  \/||  \/|| / \|| |\/||"
	echo "|  \__| \_/|| |  |||  __/|    /| \_/|| |  ||"
	echo "\____/\____/\_/  \|\_/   \_/\_\|____|\_/  \|"
	echo "                                            "
	echo "  /ZZZZZZ  /ZZZZZZZ /ZZZZZZZZ               "
	echo " /ZZ__  ZZ|__  ZZ__/| ZZ_____/              "
	echo "| ZZ  \__/   | ZZ   | ZZ                    "
	echo "| ZZ         | ZZ   | ZZZZZ                 "
	echo "| ZZ         | ZZ   | ZZ__/                 "
	echo "| ZZ    ZZ   | ZZ   | ZZ                    "
	echo "|  ZZZZZZ/   | ZZ   | ZZ                    "
	echo " \______/    |__/   |__/                    "
	echo "                                            "
	echo "Tool written by .4ct.                        "
	echo "This tool automates the sorting of challenges for CTF events or sites. Note however that any information that is copied onto your clipboard requests that the user will move from one directory to the one specified. "
	echo "                                            "
	echo "                                            "
	
	
	
	echo "0: Delete a CTF event folder"
	echo "1: Make a CTF event folder (ex: PicoCTF, DEFCON)"
	echo "2: Make CTF categories for a CTF event folder"
	echo "3: View CTF folders (event/site, or CTF categories)"
	echo "4: Make a CTF problem folder (/PicoCTF/WebExploitation/CTFProblem1)"
	echo "5: Edit a CTF problem folder (rename, delete)"
	echo "E: Exit the program"
	
	read -p "Choose an option: " optionchosen
	if [[ "$optionchosen" =~ ^[+-]?[0-9]+$ ]]; then 
		clear
		if [ $optionchosen -gt -1 ]; then		
			if [ $optionchosen -lt 6 ]; then
				echo "You have chosen: $optionchosen"
				#OPTION 1 
				if [[ $optionchosen -eq 0 ]]; then 
					echo "Choose an event to delete"
					select CTFEvents in ~/Desktop/CTF/*/; do #selects a folder to write and add more categories upon
						if [[ -n $CTFEvents ]]; then
							rm -rf $CTFEvents
							break
						else
							echo "Invalid choice. Exiting"
							break
						fi
					done
				
				elif [[ $optionchosen -eq 1 ]]; then 
					read -p "What would the name be? " NameOfCTFEvent
					NewMadeDir=$CTFDirectory/$NameOfCTFEvent
					mkdir $NewMadeDir
					echo "Request is done!"
					
				#OPTION 2
				elif [[ $optionchosen -eq 2 ]]; then
					clear
					echo "Select which event folder to add categories on: "
					select foldermax in ~/Desktop/CTF/*/; do #selects a folder to write and add more categories upon
						if [[ -n $foldermax ]]; then
							clear
							echo "All folders within the category: " 
							ls $foldermax 
							read -p "How many categories would you want to place?" CatNum 
							
							if [[ "$optionchosen" =~ ^[+]?[0-9]+$ ]]; then 
								if [[ $optionchosen -lt 10 ]]; then
									echo "NOTE! do not place a space, as it will make two folders:"
									CTFCategories=()
									for CatIn in $( eval echo {1..$CatNum} ) 
									do 
										echo "Amount of times: $CatIn"
										read -p "Category to be added: " CatDir
										CTFCategories+=($CatDir)
										mkdir $foldermax/"$CatDir"
										echo $foldermax"$CatDir" | wl-copy
													
									done
									echo "These are all of the categories you placed: "
									echo "${CTFCategories[@]}"
									
									echo "All categories copied to clipboard!"
									break
								fi
							else 
								echo "Invalid choice. Exitting. "
								break
							fi
						else
							echo "Invalid choice. Exitting."
							break
						fi
					done
					
					
					
					
					
				#OPTION 3
				elif [[ $optionchosen -eq 3 ]]; then
					clear
					echo "E: View event folders"
					echo "C: View category folders"
					echo "P: View challenge folders and files"
					read -p "Choose an option: " option3op
					clear
					echo "Choose an event: "
					if [[ "$option3op" = "E" ]]; then
						ls -la ~/Desktop/CTF
						
					elif [[ "$option3op" = "C" ]]; then 
						select foldermaxx in ~/Desktop/CTF/*/; do
							if [[ -n $foldermaxx ]]; then
								clear
								echo ": $foldermaxx"
								break
							else
								echo "Invalid choice. Exitting."
								break
							fi
						done
					elif [[ "$option3op" = "P" ]]; then 
						select foldermaxx in ~/Desktop/CTF/*/; do
							if [[ -n $foldermaxx ]]; then
								clear
								echo "ALL CTF CATEGORIES"
								echo "for: $foldermaxx"
								
								
								echo "Choose a category"
								select folderCategory in $foldermaxx*; do
									ls $folderCategory
										
										
									ProblemFolderChecker=$(ls -F $folderCategory | grep / | wc -l)
									read -p "Do you want to see the problem files? [Y/ any other key]: " PfoC
									clear
									#PfoC means problem file choice
									if [[ "$PfoC" = "Y" && "$ProblemFolderChecker">"-1" ]]; then
										select problemFiles in $folderCategory/*; do
											echo "Chosen problem folder: $problemFiles"
											echo "provided below are the files:."
											ls $problemFiles
											break
										done
										
										
									elif [[ $ProblemFolderChecker -le 0 ]]; then
										echo "No problem folders!"
									fi
									break
								
								done
								
								
								echo "Task completed."
								
								break
							else
								echo "Invalid choice. Exitting."
								break
							fi
						done
						
					fi
					read -p "Tap enter to continue. "
					clear
				#OPTION 4
				elif [[ $optionchosen -eq 4 ]]; then
					select foldermaxx in ~/Desktop/CTF/*/; do
							if [[ -n $foldermaxx ]]; then
								clear
								echo "ALL CTF CATEGORIES"
								echo "for: $foldermaxx"
								
								
								echo "Choose a category"
								select folderCategory in $foldermaxx*; do
									ls $folderCategory
									clear
									read -p "Provide the challenge's name: " challengefoldername
									mkdir $folderCategory/$challengefoldername
									echo "Challenge made! Change to directory copied in cliboard."
									echo "$folderCategory/$challengefoldername" | wl-copy
									#WL CLIBOARD WAS USED HERE
									#Now it checks whether or not there is a problem in it
									
									break
								
								done
								
								
								echo "Task completed."
								read -p "Click enter to continue: " 
								
								break
							else
								echo "Invalid choice. Exitting."
								break
							fi
						done
				
				#OPTION 5
				elif [[ $optionchosen -eq 5 ]]; then
					select foldermaxx in ~/Desktop/CTF/*/; do
							if [[ -n $foldermaxx ]]; then
								clear
								echo "ALL CTF CATEGORIES"
								echo "$foldermaxx"
								
								testifthereareCategories=$(ls -F $foldermaxx | grep / | wc -l)
								if [[ $testifthereareCategories -gt 0 ]]; then
									echo "Choose a category"
									select folderCategory in $foldermaxx*; do
										ls $folderCategory #shows all the problem folders
										clear
										echo "Choose which one to edit: "
										echo "NOTE! will show $folderCategory/* if there is nothing within the folder."
										select folderProblem in $folderCategory/*; do
											echo "What do you want to do with the folder? "
											#with the chosen problem
											echo "D: Delete folder"
											echo "R: Rename folder"
											echo "M: Move folder"
											read -p "Choose an option: " problemoption
											
											clear
											if [[ "$problemoption" = "D" ]]; then
												rm -rf $folderProblem
												break
												
											elif [[ "$problemoption" = "R" ]]; then
												echo "Current name: $folderProblem" 
												read -p "Provide a new name for the folder: " newproblemname
												
												mv $folderProblem $folderCategory/$newproblemname
												break
												
											elif [[ "$problemoption" = "M" ]]; then
												echo "Which directory to move it to?"
												read -p "Please provide full directory location here: " FullDirLoca
												mv $folderProblem $FullDirLoca		
												echo "New location can be found at: $FullDirLoca"
												break									
												
											else
												echo "Not an option! exitting.."
												break
											fi
										done
											
										break
									
									done
								else 
									clear
									echo "No categories mentioned!"
								fi 
								
								echo "Task completed."
								
								break
							else
								echo "Invalid choice. Exitting."
								break
							fi
						done
				
								
				fi	#This ends the options
				
			fi #this fi is for greater than
		else #this else is for "less than 
			clear
			echo "Your option is out of bounds. Try again."
		fi
		
	else
		if [[ "$optionchosen" = "E" ]]; then
			clear
			echo "Exitting!"
			break
		else
			clear
			echo "Invalid input. Please enter a valid option."
		fi
	fi
done
	

