#!/bin/bash
SCRIPT_DIR=$(cd $(dirname "${BASH_SOURCE[0]}") && pwd)
STUDENT_DIR="$SCRIPT_DIR/student.txt"
EQUIPMENT_DIR="$SCRIPT_DIR/equipment.txt"
TEMP_DIR="$SCRIPT_DIR/temp.txt"
# region Display
mainMenu_show() {
     clear
     echo " Lab Equipment Management Menu"
     echo "______________________________"
     echo ""
     echo " A - Register New Student"
     echo " B - Search Student Details"
     echo " C - Add New Lab Equipment"
     echo " D - Search Lab Equipment"
     echo " E - Loan Lab Equipment"
     echo ""
     echo " Q - Exit From Program"
     echo ""
     echo " Please Select a choice:"
     if [ $1 == 1 ]; then
          echo ""
          echo "Option not available, please select from the menu only."
     fi
     tput cup 11 24
}

menuA_show() {
     clear
     echo " Register New Student Form"
     echo "==========================="
     echo " Student ID             :"
     echo " Full Name (As per NRIC):"
     echo " Contact Number         :"
     echo " TAR UC Email Address   :"
     echo ""
     case $1 in
     0)
          tput cup 2 25
          ;;
     1)
          tput cup 2 25 && echo ${studentID^^}
          tput cup 3 25
          ;;
     2)
          tput cup 2 25 && echo ${studentID^^}
          tput cup 3 25 && echo $fullName
          tput cup 4 25
          ;;
     3)
          tput cup 2 25 && echo ${studentID^^}
          tput cup 3 25 && echo $fullName
          tput cup 4 25 && echo $contactNumber
          tput cup 5 25
          ;;
     4)
          echo "Register Another Student? (y)es or (q)uit?:"
          echo ""
          echo "Press (q) to return to Lab Equipment Management Menu."
          tput cup 2 25 && echo ${studentID^^}
          tput cup 3 25 && echo $fullName
          tput cup 4 25 && echo $contactNumber
          tput cup 5 25 && echo ${emailAddress,,}
          tput cup 7 43
          ;;
     10)
          echo "Invalid input. Please follow the correct format."
          echo "eg. 21PMR09915"
          tput cup 2 25
          ;;
     11)
          echo "Invalid name. Please try again."
          echo "eg. Cheah Pin Chee"
          tput cup 2 25 && echo ${studentID^^}
          tput cup 3 25
          ;;
     12)
          echo "Invalid Contact number. Please follow the correct format."
          echo "eg. 010-9950202"
          tput cup 2 25 && echo ${studentID^^}
          tput cup 3 25 && echo $fullName
          tput cup 4 25
          ;;
     13)
          echo "Invalid email. Please follow the correct format."
          echo "eg. exampleABC@student.tarc.edu.my"
          tput cup 2 25 && echo ${studentID^^}
          tput cup 3 25 && echo $fullName
          tput cup 4 25 && echo $contactNumber
          tput cup 5 25
          ;;
     14)
          echo "Register Another Student? (y)es or (q)uit?:"
          echo ""
          echo "Press (q) to return to Lab Equipment Management Menu."
          echo ""
          echo "Invalid input. Please enter 'y' or 'q' only."
          tput cup 2 25 && echo ${studentID^^}
          tput cup 3 25 && echo $fullName
          tput cup 4 25 && echo $contactNumber
          tput cup 5 25 && echo ${emailAddress,,}
          tput cup 7 43
          ;;
     100)
          echo "Error, following Student ID already exist. Please enter a new student ID"
          echo ${studentID^^}
          tput cup 2 25
          ;;
     esac
}

menuB_show() {
     clear
     echo "         Search Student Form"
     echo "        ====================="
     echo ""
     echo " Enter Student ID:"
     echo ""
     case $1 in
     0)
          tput cup 3 19
          ;;
     1)
          echo "Record not found"
          echo ""
          echo "Search Another Student? (y) es or (q) uit :"
          echo ""
          echo "Press (q) to return to Lab Equipment Management Menu."
          tput cup 3 19 && echo $readStudentID
          tput cup 7 43
          ;;
     2)
          echo " Full Name (auto display)     :"
          echo " Contact Number (auto display):"
          echo " Email Address(auto display)  :"
          echo ""
          echo "Search Another Student? (y) es or (q) uit :"
          echo ""
          echo "Press (q) to return to Lab Equipment Management Menu."
          tput cup 3 19 && echo $studentID
          tput cup 5 32 && echo $fullName
          tput cup 6 32 && echo $contactNumber
          tput cup 7 32 && echo $emailAddress
          tput cup 9 43
          ;;
     10)
          echo "Invalid input. Please follow the correct format."
          echo "eg. 21PMR09915"
          tput cup 3 19
          ;;
     11)
          echo "Record not found"
          echo ""
          echo "Search Another Student? (y) es or (q) uit :"
          echo ""
          echo "Press (q) to return to Lab Equipment Management Menu."
          echo ""
          echo "Invalid input. Please enter 'y' or 'q' only."
          tput cup 3 19 && echo $readStudentID
          tput cup 7 43
          ;;
     12)
          echo " Full Name (auto display)     :"
          echo " Contact Number (auto display):"
          echo " Email Address(auto display)  :"
          echo ""
          echo "Search Another Student? (y) es or (q) uit :"
          echo ""
          echo "Press (q) to return to Lab Equipment Management Menu."
          echo ""
          echo "Invalid input. Please enter 'y' or 'q' only."
          tput cup 3 19 && echo $studentID
          tput cup 5 32 && echo $fullName
          tput cup 6 32 && echo $contactNumber
          tput cup 7 32 && echo $emailAddress
          tput cup 9 43
          ;;
     esac
}

menuC_show() {
     clear
     echo "      Add New Lab Equipment Form"
     echo "     ============================="
     echo ""
     echo " Stock Code                 :"
     echo " Manufacturer               :"
     echo " Model                      :"
     echo " Item Description           :"
     echo " Serial Number              :"
     echo " Status (default-Available) : Available"
     echo ""
     case $1 in
     0)
          tput cup 3 30
          ;;
     1)
          tput cup 3 30 && echo ${stockCode^^}
          tput cup 4 30
          ;;
     2)
          tput cup 3 30 && echo ${stockCode^^}
          tput cup 4 30 && echo $manufacturer
          tput cup 5 30
          ;;
     3)
          tput cup 3 30 && echo ${stockCode^^}
          tput cup 4 30 && echo $manufacturer
          tput cup 5 30 && echo $model
          tput cup 6 30
          ;;
     4)
          tput cup 3 30 && echo ${stockCode^^}
          tput cup 4 30 && echo $manufacturer
          tput cup 5 30 && echo $model
          tput cup 6 30 && echo $itemDesc
          tput cup 7 30
          ;;
     5)
          echo "Add Another New Equipment? (y) es or (q) uit :"
          echo ""
          echo "Press (q) to return to Lab Equipment Management Menu."
          tput cup 3 30 && echo ${stockCode^^}
          tput cup 4 30 && echo $manufacturer
          tput cup 5 30 && echo $model
          tput cup 6 30 && echo $itemDesc
          tput cup 7 30 && echo $serialNumber
          tput cup 10 46
          ;;
     10)
          echo "Invalid input. Please follow the correct format."
          echo "eg. S10000, S20022"
          tput cup 3 30
          ;;
     11)
          echo "Invalid input. Please input alphabets only."
          echo "eg. HP, Agilent, Cisco"
          tput cup 3 30 && echo ${stockCode^^}
          tput cup 4 30
          ;;
     12)
          echo "Invalid input. Only alphanumeric characters accepted."
          echo "eg. FPS1000, K50F"
          tput cup 3 30 && echo ${stockCode^^}
          tput cup 4 30 && echo $manufacturer
          tput cup 5 30
          ;;
     13)
          echo "Invalid input. Only alphanumeric characters accepted."
          echo "eg. Silent Wireless Mouse, Gaming Keyboard with LED"
          tput cup 3 30 && echo ${stockCode^^}
          tput cup 4 30 && echo $manufacturer
          tput cup 5 30 && echo $model
          tput cup 6 30
          ;;
     14)
          echo "Invalid input. Please follow the correct format."
          echo "eg. 11-2222-33333, 12-1234-12345"
          tput cup 3 30 && echo ${stockCode^^}
          tput cup 4 30 && echo $manufacturer
          tput cup 5 30 && echo $model
          tput cup 6 30 && echo $itemDesc
          tput cup 7 30
          ;;
     15)
          echo "Add Another New Equipment? (y) es or (q) uit :"
          echo ""
          echo "Press (q) to return to Lab Equipment Management Menu."
          echo ""
          echo "Invalid input. Please enter 'y' or 'q' only."
          tput cup 3 30 && echo ${stockCode^^}
          tput cup 4 30 && echo $manufacturer
          tput cup 5 30 && echo $model
          tput cup 6 30 && echo $itemDesc
          tput cup 7 30 && echo $serialNumber
          tput cup 10 46
          ;;
     100)
          echo "Error, Following Stock Code already exist. Please enter a new Stock Code."
          echo ${stockCode^^}
          tput cup 3 30
          ;;
     esac
}

menuD_show() {
     clear
     echo "      Search Lab Equipment Form"
     echo "     ============================"
     echo ""
     echo " Enter Stock Code:"
     echo ""
     case $1 in
     0)
          tput cup 3 19
          ;;
     1)
          echo "Record not found"
          echo ""
          echo "Try Another Equipment? (y) es or (q) uit :"
          echo ""
          echo "Press (q) to return to Lab Equipment Management Menu."
          tput cup 3 19 && echo $ReadStockCode
          tput cup 7 42
          ;;
     2)
          echo " Manufacturer (auto display)     :"
          echo " Model (auto display)            :"
          echo " Item Description (auto display) :"
          echo " Serial Number (auto display)    :"
          echo " Status                          :"
          echo ""
          echo "Search Another Equipment? (y) es or (q) uit :"
          echo ""
          echo "Press (q) to return to Lab Equipment Management Menu."
          tput cup 3 19 && echo $stockCode
          tput cup 5 35 && echo $manufacturer
          tput cup 6 35 && echo $model
          tput cup 7 35 && echo $itemDesc
          tput cup 8 35 && echo $serialNumber
          tput cup 9 35 && echo $status
          tput cup 11 45
          ;;
     10)
          echo "Invalid input. Please follow the correct format."
          echo "eg. S10000, S20022"
          tput cup 3 19
          ;;
     11)
          echo "Record not found"
          echo ""
          echo "Try Another Equipment? (y) es or (q) uit :"
          echo ""
          echo "Press (q) to return to Lab Equipment Management Menu."
          echo ""
          echo "Invalid input. Please enter 'y' or 'q' only."
          tput cup 3 19 && echo $ReadStockCode
          tput cup 7 42
          ;;
     12)
          echo " Manufacturer (auto display)     :"
          echo " Model (auto display)            :"
          echo " Item Description (auto display) :"
          echo " Serial Number (auto display)    :"
          echo " Status                          :"
          echo ""
          echo "Search Another Equipment? (y) es or (q) uit :"
          echo ""
          echo "Press (q) to return to Lab Equipment Management Menu."
          echo ""
          echo "Invalid input. Please enter 'y' or 'q' only."
          tput cup 3 19 && echo $stockCode
          tput cup 5 35 && echo $manufacturer
          tput cup 6 35 && echo $model
          tput cup 7 35 && echo $itemDesc
          tput cup 8 35 && echo $serialNumber
          tput cup 9 35 && echo $status
          tput cup 11 45
          ;;
     esac
}

menuE_show() {
     clear
     case $1 in
     0)
          echo "    Student Details Validation Form"
          echo "   ================================="
          echo ""
          echo "Please enter the Sudent's ID Number: "
          echo ""
          case $2 in
          0)
               tput cup 3 37
               ;;
          1) # ID not found
               echo "Record not found"
               echo ""
               echo "Try another Student ID? (y) es or (q) uit :"
               tput cup 3 37 && echo $studentID
               tput cup 7 43
               ;;
          2) # ID found
               echo "Student Name (auto display):"
               echo ""
               echo "Press (n) to proceed Loan Equipment or (q) to return to Lab Equipment Management Menu:"
               tput cup 3 37 && echo $studentID
               tput cup 5 28 && echo $fullName
               tput cup 7 86
               ;;
          10) # Invalid ID
               echo "Invalid input. Please follow the correct format."
               echo "eg. 21PMR09915"
               tput cup 3 37 && echo $studentID
               tput cup 3 37
               ;;

          11)
               echo "Record not found"
               echo ""
               echo "Try another Student ID? (y) es or (q) uit :"
               echo ""
               echo "Invalid input. Please type (y) to try another Student ID or (q) to return to Lab Equipment Management."
               tput cup 3 37 && echo $studentID
               tput cup 7 43
               ;;
          12)
               echo "Student Name (auto display):"
               echo ""
               echo "Press (n) to proceed Loan Equipment or (q) to return to Lab Equipment Management Menu:"
               echo ""
               echo "Invalid input. Please type (n) or (q) only."
               tput cup 3 37 && echo $studentID
               tput cup 5 28 && echo $fullName
               tput cup 7 86
               ;;
          esac
          ;;
     1)
          echo "        Loan Lab Equipment Form"
          echo "   ================================="
          echo ""
          echo "Please enter the stock code:"
          echo ""
          case $2 in
          0) # Default
               tput cup 3 28
               ;;
          1) # Stock Code Not Found
               echo "Record not found"
               echo ""
               echo "Try Another Equipment? (y) es or (q) uit :"
               echo ""
               echo "Press (q) to return to Lab Equipment Management Menu."
               tput cup 3 28 && echo $ReadStockCode
               tput cup 7 42
               ;;
          2) # Found Stock Code S1
               echo "Serial Number (auto display) :"
               echo "Model (auto display)         :"
               echo "Description (auto display)   :"
               echo "Please Enter the following Details upon the loan of the lab equipment."
               echo ""
               echo "Stock status                 : On Loan"
               echo "Loan Date (mm/dd/yyyy)       :"
               echo "Reason to Loan               :"

               tput cup 3 28 && echo $stockCode
               tput cup 5 31 && echo $serialNumber
               tput cup 6 31 && echo $model
               tput cup 7 31 && echo $itemDesc
               tput cup 11 31
               ;;
          3) # Found Stock Code S2
               echo "Serial Number (auto display) :"
               echo "Model (auto display)         :"
               echo "Description (auto display)   :"
               echo "Please Enter the following Details upon the loan of the lab equipment."
               echo ""
               echo "Stock status                 : On Loan"
               echo "Loan Date (mm/dd/yyyy)       :"
               echo "Reason to Loan               :"

               tput cup 3 28 && echo $stockCode
               tput cup 5 31 && echo $serialNumber
               tput cup 6 31 && echo $model
               tput cup 7 31 && echo $itemDesc
               tput cup 11 31 && echo $loanDate
               tput cup 12 31
               ;;
          4) # Found Stock Code S3
               echo "Serial Number (auto display) :"
               echo "Model (auto display)         :"
               echo "Description (auto display)   :"
               echo "Please Enter the following Details upon the loan of the lab equipment."
               echo ""
               echo "Stock status                 : On Loan"
               echo "Loan Date (mm/dd/yyyy)       :"
               echo "Reason to Loan               :"
               echo ""
               echo "Press (y) to continue to Loan Lab Equipment or (c) to generate Lab Equipment Loan Receipt."
               echo ""
               echo "Enter (y) or (c): "

               tput cup 3 28 && echo $stockCode
               tput cup 5 31 && echo $serialNumber
               tput cup 6 31 && echo $model
               tput cup 7 31 && echo $itemDesc
               tput cup 11 31 && echo $loanDate
               tput cup 12 31 && echo $loanReason
               tput cup 16 18
               ;;
          10) # Default invalid format
               echo "Invalid input. Please follow the correct format."
               echo "eg. S10000, S20022"
               tput cup 3 28
               ;;
          11) # Stock not found and input error
               echo "Record not found"
               echo ""
               echo "Try Another Equipment? (y) es or (q) uit :"
               echo ""
               echo "Press (q) to return to Lab Equipment Management Menu."
               echo ""
               echo "Invalid input. Please enter 'y' or 'q' only."
               tput cup 3 28 && echo $ReadStockCode
               tput cup 7 42
               ;;
          12) # Found Stock Code S1 Invalid input
               echo "Serial Number (auto display) :"
               echo "Model (auto display)         :"
               echo "Description (auto display)   :"
               echo "Please Enter the following Details upon the loan of the lab equipment."
               echo ""
               echo "Stock status                 : On Loan"
               echo "Loan Date (mm/dd/yyyy)       :"
               echo "Reason to Loan               :"
               echo ""
               echo "Invalid input. Incorrect Date format."
               echo "eg. 01/01/2000"

               tput cup 3 28 && echo $stockCode
               tput cup 5 31 && echo $serialNumber
               tput cup 6 31 && echo $model
               tput cup 7 31 && echo $itemDesc
               tput cup 11 31
               ;;
          13) # Found Stock Code S2 Invalid input
               echo "Serial Number (auto display) :"
               echo "Model (auto display)         :"
               echo "Description (auto display)   :"
               echo "Please Enter the following Details upon the loan of the lab equipment."
               echo ""
               echo "Stock status                 : On Loan"
               echo "Loan Date (mm/dd/yyyy)       :"
               echo "Reason to Loan               :"
               echo ""
               echo "Invalid input. Please input alphabets only."
               echo "eg. For FYP Testing"

               tput cup 3 28 && echo $stockCode
               tput cup 5 31 && echo $serialNumber
               tput cup 6 31 && echo $model
               tput cup 7 31 && echo $itemDesc
               tput cup 11 31 && echo $loanDate
               tput cup 12 31
               ;;
          14) # Found Stock Code S3 Invalid input
               echo "Serial Number (auto display) :"
               echo "Model (auto display)         :"
               echo "Description (auto display)   :"
               echo "Please Enter the following Details upon the loan of the lab equipment."
               echo ""
               echo "Stock status                 : On Loan"
               echo "Loan Date (mm/dd/yyyy)       :"
               echo "Reason to Loan               :"
               echo ""
               echo "Press (y) to continue to Loan Lab Equipment or (c) to generate Lab Equipment Loan Receipt."
               echo ""
               echo "Enter (y) or (c): "
               echo ""
               echo "Invalid input. Please enter (y) or (c) only."

               tput cup 3 28 && echo $stockCode
               tput cup 5 31 && echo $serialNumber
               tput cup 6 31 && echo $model
               tput cup 7 31 && echo $itemDesc
               tput cup 11 31 && echo $loanDate
               tput cup 12 31 && echo $loanReason
               tput cup 16 18
               ;;
          22) # Found Stock Code S1 Invalid input Date
               echo "Serial Number (auto display) :"
               echo "Model (auto display)         :"
               echo "Description (auto display)   :"
               echo "Please Enter the following Details upon the loan of the lab equipment."
               echo ""
               echo "Stock status                 : On Loan"
               echo "Loan Date (mm/dd/yyyy)       :"
               echo "Reason to Loan               :"
               echo ""
               echo "Invalid Date Detected. Please choose a valid date."

               tput cup 3 28 && echo $stockCode
               tput cup 5 31 && echo $serialNumber
               tput cup 6 31 && echo $model
               tput cup 7 31 && echo $itemDesc
               tput cup 11 31
               ;;
          100)
               echo "Record found. Equipment on loan"
               echo ""
               echo "Try Another Equipment? (y) es or (q) uit :"
               echo ""
               echo "Press (q) to return to Lab Equipment Management Menu."
               tput cup 3 28 && echo $ReadStockCode
               tput cup 7 42
               ;;
          110)
               echo "Record found. Equipment on loan"
               echo ""
               echo "Try Another Equipment? (y) es or (q) uit :"
               echo ""
               echo "Press (q) to return to Lab Equipment Management Menu."
               echo ""
               echo "Invalid input. Please enter 'y' or 'q' only."
               tput cup 3 28 && echo $ReadStockCode
               tput cup 7 42
               ;;
          esac

          ;;
     2)
          # Store Loan Detail
          touch "$reportDir"
          echo "                                    Equipment Load Receipt" >$reportDir
          echo "" >>$reportDir
          echo "Student ID         : ${studentID}" >>"$reportDir"
          echo "Student Name       : ${fullName}" >>"$reportDir"
          echo "Loan Date          : ${loanDate}" >>"$reportDir"
          echo "===================================================================================================" >>"$reportDir"
          echo "  No.  Model       Description                        Reason to Loan                               " >>"$reportDir"
          echo "===================================================================================================" >>"$reportDir"
          # Set input list
          IFS=':' read stockCode manufacturer model itemDesc serialNumber status <<<$inputEquipment
          while IFS= read -r loanList; do
               IFS=':' read loanCount model itemDesc loanReason <<<$loanList
               printf "  %-5s%-12s%-35s%-100s\n" "${loanCount}" "${model}" "${itemDesc}" "${loanReason}" >>"$reportDir"
          done <$TEMP_DIR
          echo "" >>"$reportDir"
          echo "Total loan items: " $loanCount >>"$reportDir"

          # Print Receipt
          while read loanList; do
               printf "%s\n" "${loanList}"
          done <$reportDir
          echo ""
          read -p "Press any key to return to Lab Equipment Management Menu..." -n1 -s
          rm -f $TEMP_DIR
          ;;
     esac
}
# endregion Display

# region Function
mainMenu() {
     unset menuOption
     until [[ $menuOption =~ ^[abcdeqABCDEQ]{1}$ ]]; do
          [ -z $menuOption ] && mainMenu_show 0 || mainMenu_show 1 # Display
          read menuOption                                          # Read
     done
}

menuA() {
     until [ $nextStudent == "q" ] || [ $nextStudent == "Q" ]; do
          unset studentID fullName contactNumber emailAddress nextStudent # Reset Variables

          # Student ID
          while [ true ]; do

               # Check Student ID
               if [ -z $studentID ]; then
                    menuA_show 0 # Display
               elif [[ $studentID =~ (^[0-9]{2}[a-zA-Z]{3}[0-9]{5}$) ]]; then
                    [ -z $(grep -i $studentID $STUDENT_DIR) ] && break || menuA_show 100 # Display
               else
                    menuA_show 10 # Display
               fi
               # 21PMR09915
               read studentID # Read
          done

          # Full Name
          until [[ $fullName =~ (^[a-zA-Z. /,\'-]+$) ]]; do
               [ -z $fullName ] && menuA_show 1 || menuA_show 11 # Display
               read fullName                                     # Read
          done

          # Contact Number
          until [[ $contactNumber =~ ^01[0-9]{1}-[0-9]{7,8}$ ]]; do
               [ -z $contactNumber ] && menuA_show 2 || menuA_show 12 # Display
               read contactNumber                                     # Read
          done

          # Email
          until [[ $emailAddress =~ ^[a-zA-Z0-9-]+@student\.tarc\.edu\.my$ ]]; do
               [ -z $emailAddress ] && menuA_show 3 || menuA_show 13 # Display
               read emailAddress                                     # Read
          done

          # Register Next?
          until [[ $nextStudent =~ ^[yqYQ]{1}$ ]]; do
               [ -z $nextStudent ] && menuA_show 4 || menuA_show 14 # Display
               read nextStudent                                     # Read
          done

          # Store the student information
          [ ! -z $(tail -1c $STUDENT_DIR) ] && echo "" >>$STUDENT_DIR
          echo "${studentID^^}:$fullName:$contactNumber:${emailAddress,,}" >>$STUDENT_DIR
     done
     unset studentID fullName contactNumber emailAddress nextStudent # Reset Variables
}

menuB() {
     until [ $nextQuery == "q" ] || [ $nextQuery == "Q" ]; do
          unset input readStudentID studentID fullName contactNumber emailAddress nextQuery # Reset Variables
          # Check Input
          until [[ $readStudentID =~ ^[0-9]{2}[a-zA-Z]{3}[0-9]{5}$ ]]; do
               [ -z $readStudentID ] && menuB_show 0 || menuB_show 10 # Display
               read readStudentID                                     # Read
          done

          # Set Input
          input=$(grep -i $readStudentID $STUDENT_DIR)
          IFS=':' read studentID fullName contactNumber emailAddress <<<$input

          #  Check if record is found
          until [[ $nextQuery =~ ^[yqYQ]{1}$ ]]; do
               if [ -z $input ]; then
                    [ -z $nextQuery ] && menuB_show 1 || menuB_show 11 # Display
               else
                    [ -z $nextQuery ] && menuB_show 2 || menuB_show 12 # Display
               fi
               read nextQuery # Read
          done

     done
     unset input readStudentID studentID fullName contactNumber emailAddress nextQuery # Reset Variables
}

menuC() {
     until [ $nextEquipment == "q" ] || [ $nextEquipment == "Q" ]; do
          unset stockCode manufacturer model itemDesc serialNumber nextEquipment # Reset Variables

          # Stock Code
          while [ true ]; do
               # Check Student ID
               if [ -z $stockCode ]; then
                    menuC_show 0 # Display
               elif [[ $stockCode =~ ^[sS]{1}[0-9]{5}$ ]]; then
                    [ -z $(grep -Fiw $stockCode $EQUIPMENT_DIR) ] break || menuC_show 100 # Display
               else
                    menuC_show 10 # Display
               fi
               # 21PMR09915
               read stockCode # Read
          done

          # Manufacturer
          until [[ $manufacturer =~ ^[a-zA-Z]+$ ]]; do
               [ -z $manufacturer ] && menuC_show 1 || menuC_show 11 # Display
               read manufacturer                                     # Read
          done

          # Model
          until [[ $model =~ ^[a-zA-Z]+[0-9]+[a-zA-Z]?$ ]]; do
               [ -z $model ] && menuC_show 2 || menuC_show 12 # Display
               read model                                     # Read
          done

          # Item Description
          until [[ $itemDesc =~ ^[a-zA-Z0-9\ ]+$ ]]; do
               [ -z $itemDesc ] && menuC_show 3 || menuC_show 13 # Display
               read itemDesc                                     # Read
          done

          # Serial Number
          until [[ $serialNumber =~ ^[0-9]{2}-[0-9]{4}-[0-9]{5}$ ]]; do
               [ -z $serialNumber ] && menuC_show 4 || menuC_show 14 # Display
               read serialNumber                                     # Read
          done

          # Next Equipment?
          until [[ $nextEquipment =~ ^[yqYQ]{1}$ ]]; do
               [ -z $nextEquipment ] && menuC_show 5 || menuC_show 15 # Display
               read nextEquipment                                     # Read
          done

          # Store the new lab equipment details
          [ ! -z $(tail -1c $EQUIPMENT_DIR) ] && echo "" >>$EQUIPMENT_DIR
          echo "${stockCode^^}:$manufacturer:$model:$itemDesc:$serialNumber:Available" >>$EQUIPMENT_DIR
     done
     unset stockCode manufacturer model itemDesc serialNumber nextEquipment # Reset Variables
}

menuD() {
     until [ $nextStock == "q" ] || [ $nextStock == "Q" ]; do
          unset input ReadStockCode stockCode manufacturer model itemDesc serialNumber status nextStock # Reset Variables
          # Check Input
          until [[ $ReadStockCode =~ ^[sS]{1}[0-9]{5}$ ]]; do
               [ -z $ReadStockCode ] && menuD_show 0 || menuD_show 10 # Display
               read ReadStockCode                                     # Read
          done

          # Set Input
          input=$(grep -i $ReadStockCode $EQUIPMENT_DIR)
          IFS=':' read stockCode manufacturer model itemDesc serialNumber status <<<$input

          #  Check if record is found
          until [[ $nextStock =~ ^[yqYQ]{1}$ ]]; do
               if [ -z $input ]; then
                    [ -z $nextStock ] && menuD_show 1 || menuD_show 11 # Display
               else
                    [ -z $nextStock ] && menuD_show 2 || menuD_show 12 # Display
               fi
               read nextStock # Read
          done
     done
     unset input ReadStockCode stockCode manufacturer model itemDesc serialNumber status nextStock # Reset Variables
}

menuE() {
     while [ true ]; do
          unset loanCount inputStudent nextID studentID fullName contactNumber emailAddress # Reset Variables
          loanCount=0
          until [[ $studentID =~ ^[0-9]{2}[a-zA-Z]{3}[0-9]{5}$ ]]; do
               [ -z $studentID ] && menuE_show 0 0 || menuE_show 0 10 # Display
               read studentID                                         # Read
          done

          # Set Input
          inputStudent=$(grep -i $studentID $STUDENT_DIR)
          IFS=':' read studentID fullName contactNumber emailAddress <<<$inputStudent

          #  Check if ID is found
          if [ -z $inputStudent ]; then # If no ID found
               until [[ $nextID =~ ^[yqYQ]{1}$ ]]; do
                    [ -z $nextID ] && menuE_show 0 1 || menuE_show 0 11 # Display
                    read nextID                                         # Read
               done
               if [ $nextID == "q" ] || [ $nextID == "Q" ]; then
                    unset inputStudent nextID studentID fullName contactNumber emailAddress
                    return # Return to main menu
               else
                    continue 2 # Restart Menu E
               fi
          else # If ID found
               until [[ $nextLoan =~ ^[nNqQ]{1}$ ]]; do
                    [ -z $nextLoan ] && menuE_show 0 2 || menuE_show 0 12 # Display
                    read nextLoan                                         # Read
               done

               if [ $nextLoan == "q" ] || [ $nextLoan == "Q" ]; then                                 # If Do Not Next Loan
                    unset inputStudent nextID nextLoan studentID fullName contactNumber emailAddress # Reset Variables
                    return                                                                           # Return to main menu
               else                                                                                  # If Procee Next Loan to Loan Lab Equipment
                    while [ true ]; do
                         unset inputEquipment nextLoanEquipment nextLoan nextStock ReadStockCode stockCode manufacturer model itemDesc serialNumber status # Reset Variables
                         until [[ $ReadStockCode =~ ^[sS]{1}[0-9]{5}$ ]]; do
                              [ -z $ReadStockCode ] && menuE_show 1 0 || menuE_show 1 10 # Display
                              read ReadStockCode                                         # Read
                         done

                         # Set Input
                         inputEquipment=$(grep -i $ReadStockCode $EQUIPMENT_DIR)
                         IFS=':' read stockCode manufacturer model itemDesc serialNumber status <<<$inputEquipment

                         #  Check if Stock Code is found
                         if [ -z $inputEquipment ]; then # If no Stock Code found
                              until [[ $nextStock =~ ^[yqYQ]{1}$ ]]; do
                                   [ -z $nextStock ] && menuE_show 1 1 || menuE_show 1 11 # Display
                                   read nextStock                                         # Read
                              done

                              if [ $nextStock == "q" ] || [ $nextStock == "Q" ]; then                                                # If don't try another stock code
                                   unset inputStudent nextID nextLoan studentID fullName contactNumber emailAddress                  # Reset Variables
                                   unset inputEquipment nextLoan nextStock stockCode manufacturer model itemDesc serialNumber status # Reset Variables
                                   return
                              else # If try another stock code
                                   continue
                              fi
                         elif [[ $status == "On Loan" ]]; then # If Stock Code found but Not Available
                              until [[ $nextStock =~ ^[yqYQ]{1}$ ]]; do
                                   [ -z $nextStock ] && menuE_show 1 100 || menuE_show 1 110 # Display
                                   read nextStock                                            # Read
                              done

                              if [ $nextStock == "q" ] || [ $nextStock == "Q" ]; then                                                # If don't try another stock code
                                   unset inputStudent nextID nextLoan studentID fullName contactNumber emailAddress                  # Reset Variables
                                   unset inputEquipment nextLoan nextStock stockCode manufacturer model itemDesc serialNumber status # Reset Variables
                                   return
                              else # If try another stock code
                                   continue
                              fi
                         else # If Stock Code is found - Available
                              # Check Date
                              unset loanDate loanReason
                              while [ true ]; do
                                   if [ -z $loanDate ]; then                                                   # If loan date is empty
                                        menuE_show 1 2                                                         # Display
                                   elif [[ $loanDate =~ (^[0-9]{2}/[0-9]{2}/[0-9]{4}$) ]]; then                # If load date is not not empty and match the format
                                        [[ $(date -d "${loanDate}" 2>/dev/null) ]] && break || menuE_show 1 22 # Display
                                   else
                                        menuE_show 1 12 # Display
                                   fi
                                   read loanDate
                              done

                              # Check Reason
                              until [[ $loanReason =~ (^[a-zA-Z. ,\\-]+$) ]]; do
                                   [ -z $loanReason ] && menuE_show 1 3 || menuE_show 1 13 # Display
                                   read loanReason                                         # Read
                              done

                              # Store Loan information
                              ((loanCount++))
                              [ ! -z $(tail -1c $TEMP_DIR) ] && echo "" >>$TEMP_DIR
                              echo "$loanCount:$model:$itemDesc:$loanReason" >>$TEMP_DIR
                              sed -i "/$ReadStockCode/d" $EQUIPMENT_DIR
                              echo "${stockCode^^}:$manufacturer:$model:$itemDesc:$serialNumber:On Loan" >>$EQUIPMENT_DIR

                              # Check Print Receipt
                              until [[ $nextLoanEquipment =~ ^[yYcC]{1}$ ]]; do
                                   [ -z $nextLoanEquipment ] && menuE_show 1 4 || menuE_show 1 14 # Display
                                   read nextLoanEquipment                                         # Read
                              done

                              if [ $nextLoanEquipment == "y" ] || [ $nextLoanEquipment == "Y" ]; then ## Continue to next item
                                   continue
                              else ## Print receipt
                                   reportDir="${SCRIPT_DIR}/${studentID}_${loanDate////-}.txt"
                                   menuE_show 2
                                   unset nextID nextLoan nextLoanEquipment nextQuery nextStock nextStudent nextEquipment # Reset Variables
                                   unset loanCount loanDate loanList loanReason                                          # Reset Variables
                                   unset inputEquipment inputStudent input                                               # Reset Variables
                                   unset studentID fullName contactNumber emailAddress nextStudent                       # Reset Variables
                                   unset ReadStockCode stockCode manufacturer model itemDesc serialNumber                # Reset Variables
                                   return
                              fi
                         fi
                    done
               fi
          fi
     done
}

end() {
     clear
     exit
}

generateReport() {
     touch "$reportDir"
     echo "                                    Equipment Load Receipt" >$reportDir
     echo "" >>$reportDir
     echo "Student ID         : ${studentID}" >>"$reportDir"
     echo "Student Name       : ${fullName}" >>"$reportDir"
     echo "Loan Date          : ${loanDate}" >>"$reportDir"
     echo "===================================================================================================" >>"$reportDir"
     echo "  No.  Model       Description                        Reason to Loan                               " >>"$reportDir"
     echo "===================================================================================================" >>"$reportDir"
     # Set input list
     IFS=':' read stockCode manufacturer model itemDesc serialNumber status <<<$inputEquipment
     while IFS= read -r loanList; do
          IFS=':' read loanCount model itemDesc loanReason <<<$loanList
          printf "  %-5s%-12s%-35s%-100s\n" "${loanCount}" "${model}" "${itemDesc}" "${loanReason}" >>"$reportDir"
     done <$TEMP_DIR
     echo "" >>"$reportDir"
     echo "Total loan items: " $loanCount >>"$reportDir"
}
# endregion Function

while [ true ]; do
     mainMenu
     case $menuOption in
     'a' | 'A')
          menuA
          ;;
     'b' | 'B')
          menuB
          ;;
     'c' | 'C')
          menuC
          ;;
     'd' | 'D')
          menuD
          ;;
     'e' | 'E')
          menuE
          ;;
     'q' | 'Q')
          end
          ;;
     esac
done
