Tool description for 'CompareFolders.pl'

_____________
Purpose: To search all files within Folder1 in Folder2 and compare content if detect matched files.

Author: Dang Mai Nhi (MS/EPS42-CC)

Created date: April-25-2023
_____________

INPUT DESCRIPTION

- Folder1: 
	
	All files within this folder (included files in subfolders) will be searched and comapared with Folder 2

	Example: '[...]\_snapshot_' forder in Test Report

- Folder2:

	All files in Folder 1 will be searched within this Folder, any matched files will be compared by content

	Example: '[...]\sandboxes\ma12_CustLib_Testing' which contains lastest files from stream

- Extensions:

	Only files which have these extensions will be searched and compared. If no value had given, all file types will be checked.

	Example:- 'pm,par,can' check for all files which have type '.pm' or '.par' or '.can'
		- 'pm' only check for file type '.pm'
		- '' all file types will be checked.

- Open Beyond Compare 4 when detect different files:

	If this checkbox is checked, all different files will be compare by Beyound Compare 4.

	If this checkbox isn't checked, tool still return Compare Result as normal, but not open Beyond Compare tool for futhur check of content.