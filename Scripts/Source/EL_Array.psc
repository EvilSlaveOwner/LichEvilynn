Scriptname EL_Array extends Quest  

; https://www.creationkit.com/index.php?title=Array_Reference

; Array functions
bool function ArrayAddForm(Form[] myArray, Form myForm) global
;Adds a form to the first available element in the array.
 
	;-----------\
	;Description \	Author: Chesko
	;----------------------------------------------------------------
	;Adds a form to the first available element in the array.
 
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		false		=		Error (array full)
	;		true		=		Success
 
	int i = 0
	;notification("myArray.Length = " + myArray.Length)
	while i < myArray.Length
		if myArray[i] == none
			myArray[i] = myForm
			;notification("Adding " + myForm + " to the array.")
			return true
		else
			i += 1
		endif
	endWhile
 
	return false
 
endFunction
 
bool function ArrayRemoveForm(Form[] myArray, Form myForm, bool bSort = false) global
;Removes a form from the array, if found. Sorts the array using ArraySort() if bSort is true.
 
	;-----------\
	;Description \	Author: Chesko
	;----------------------------------------------------------------
	;Removes a form from the array, if found. Sorts the array using ArraySort() if bSort is true.
 
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		false		=		Error (Form not found)
	;		true		=		Success
 
	int i = 0
	while i < myArray.Length
		if myArray[i] == myForm
			myArray[i] = none
			;notification("Removing element " + i)
			if bSort == true
				ArraySort(myArray)
			endif
			return true
		else
			i += 1
		endif
	endWhile	
 
	return false
 
endFunction
 
bool function ArraySort(Form[] myArray, int i = 0) global
;Removes blank elements by shifting all elements down.
 
 
	 ;-----------\
	 ;Description \  Author: Chesko
	 ;----------------------------------------------------------------
	 ;Removes blank elements by shifting all elements down.
	 ;Optionally starts sorting from element i.
 
	 ;-------------\
	 ;Return Values \
	 ;----------------------------------------------------------------
	 ;		   false		   =			   No sorting required
	 ;		   true			=			   Success
 
	 bool bFirstNoneFound = false
	 int iFirstNonePos = i
	 while i < myArray.Length
		  if myArray[i] == none
			   if bFirstNoneFound == false
					bFirstNoneFound = true
					iFirstNonePos = i
					i += 1
			   else
					i += 1
			   endif
		  else
			   if bFirstNoneFound == true
			   ;check to see if it's a couple of blank entries in a row
					if !(myArray[i] == none)
						 ;notification("Moving element " + i + " to index " + iFirstNonePos)
						 myArray[iFirstNonePos] = myArray[i]
						 myArray[i] = none
 
						 ;Call this function recursively until it returns
						 ArraySort(myArray, iFirstNonePos + 1)
						 return true
					else
						 i += 1
					endif
			   else
					i += 1
			   endif
		  endif
	 endWhile
 
	 return false
 
endFunction
 
function ArrayClear(Form[] myArray) global
;Deletes the contents of this array.
 
	;-----------\
	;Description \	Author: Chesko
	;----------------------------------------------------------------
	;Deletes the contents of this array.
 
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		none
 
	int i = 0
	while i < myArray.Length
		myArray[i] = none
		i += 1
	endWhile
 
endFunction
 
 
int function ArrayCount(Form[] myArray) global
;Counts the number of indices in this array that do not have a "none" type.
 
        ;-----------\
	;Description \	Author: Chesko
	;----------------------------------------------------------------
	;Counts the number of indices in this array that do not have a "none" type.
 
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		int myCount = number of indicies that are not "none"
 
	int i = 0
	int myCount = 0
	while i < myArray.Length
		if myArray[i] != none
			myCount += 1
			i += 1
		else
			i += 1
		endif
	endWhile
 
	;notification("MyCount = " + myCount)	
 
	return myCount
 
endFunction
 
 
int function ArrayHasForm(Form[] myArray, Form myForm) global
;Attempts to find the given form in the given array, and returns the index of the form if found.
 
	;-----------\
	;Description \	Author: Chesko
	;----------------------------------------------------------------
	;Attempts to find the given form in the given array, and returns the index of the form if found.
 
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		-1		  =		Form not found
	;		int i		  =		Location of the form
 
	int i = 0
 
	while i < myArray.Length
		if myArray[i] == myForm
			return i
		else
			i += 1
		endif
	endWhile
 
	return -1
 
endFunction
 
 
int function ArrayCountForm(Form[] myArray, Form myForm) global
;Attempts to count the number of times the given form appears in this array.
 
	;-----------\
	;Description \
	;----------------------------------------------------------------
	;Attempts to count the number of times the given form appears in this array.
 
	;-------------\
	;Return Values \
	;----------------------------------------------------------------
	;		0					= 		Form not found
	;		int i		 		=		Number of times form appears in array
 
	int i = 0
	int iCount = 0
 
	while i < myArray.Length
		if myArray[i] == myForm
			iCount += 1
			i += 1
		else
			i += 1
		endif
	endWhile
 
	return iCount
 
endFunction