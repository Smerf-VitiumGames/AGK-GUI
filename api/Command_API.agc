// File: API_CmdSet.agc
// Created: 22-03-05
function AddChild(source,Target)
	source=getID(source)
	Target=getID(Target)
	if API.Gadget.Length >= source and API.Gadget.Length >= Target
		addGadgetChild(source,Target)
	Endif
endfunction


function MakeScrollBar()
	Local Ret as Integer
	ret=DrawGadget(4,-1)
endfunction API.Gadget[ret].ID

function MakeScrollBarVert()
	Local Ret as Integer
	ret=DrawGadget(10,-1)
endfunction API.Gadget[ret].ID









`MakeTextStringArray(" 'hello' 'this,' 'is' , my string,")`returns string array
`MakeTextIntegerArray(" 'hello' 'this,' 'is' , my string,")`Warning USER Managed! This will create Text objects and return their ID in an array. Usefull For populating browser  wIDgets and lists
`created Text objects must be manually deleted when done.

function MakeTextStringArray(Comma_seperated_String as string)
	temp as string []
	count=CountStringTokens2 (Comma_seperated_String,"'" )
	For index=1 to count 
		temp.insert((GetStringToken2(Comma_seperated_String,"'",index)) )
	next
endfunction temp


function MakeTextIntegerArray(Comma_seperated_String$ /*returns array*/)
	temp as integer []
		count=CountStringTokens2 (Comma_seperated_String$, "'" )
	For index=1 to count 
		tempstr$=GetStringToken2(Comma_seperated_String$,"'",index)
		ID=createText(tempstr$)
		temp.insert(ID)	 
	next
endfunction temp

load_File_Discovery:
type dirtype
	DirName as string
	ImageName as string[]
	ImageID as integer[]
endtype
	
global Dir as dirtype []
type TempDirtype
	DirName as string
endtype

global TempDir as dirtype
return

`finds directorys recursivley
function FindFiles(Gadget_Target,Dir$,DirMode,Filter$ /* "jpg,png,,BMP" */)
	ID=OpenRawFolder(API.path+dir$) //open media folder search For folders
	FolderCount=GetRawFolderNumFolders(id) //get num of folders inside
	if DirMode=1
		For i = 0 to FolderCount-1 //find names of folders 
			FolderName$=GetRawFolderFolderName(id,i)
			folderNum=i// folder= array id technically
			if len(foldername$)>0
				Tempdir.DirName=foldername$ //fill temp type
				Dir.insert(tempdir)//inserttemp into  dir type (folder name)
			Endif
			newid=OpenRawFolder(API.path+Dir$+"/"+foldername$)
			FileSearch(Gadget_Target,folderNum,newid,foldername$,Dir$,Filter$,0)
		next
	Endif
	if DirMode=0
		FileSearch(Gadget_Target,FolderNum,ID,Foldername$,Dir$,filter$,DirMode)
	Endif
endfunction 

`finds file in current directory
function FileSearch(GadgetID,folder,id,foldername$,Directory$,filter$,DirMode)//raw folder id
	`clear existing delete preview images
	API.Gadget[getid(gadgetid)].BuiltInStrParam2.length=-1
	API.Gadget[getid(gadgetid)].BuiltInStrParam3.length=-1
	For i = 0 to API.Gadget[getid(gadgetid)].BuiltInIntParam2.length
		if getimageexists(API.Gadget[getid(gadgetid)].BuiltInIntParam2[i])=1 
			deleteimage(API.Gadget[getid(gadgetid)].BuiltInIntParam2[i])
		Endif
	next
	API.Gadget[getid(gadgetid)].BuiltInIntParam2.length=-1
	
	FileCount=GetRawFolderNumFiles(id)
	if filecount >0
		if DirMode=0
			API.Gadget[getid(GadgetID)].BuiltInIntParam2.length=-1
			count=CountStringTokens2(filter$,",") 
	        	local Tempfilter as string []
			For index=1 to count`build filter
	 			slice$=GetStringToken2(filter$,",",index)
	 			Tempfilter.insert(slice$)
			next
			For i = 0 to FileCount-1
				For searchfilter=0 to tempfilter.length`filter For 
					FileName$=GetRawFolderFileName(id,i)
		        		if tempFilter[searchFilter]=right(filename$,3)
		        			
						If len(FileName$) > 0
							`add filter here
							API.Gadget[getid(GadgetID)].BuiltInstrParam2.insert(filename$)
							API.Gadget[getid(GadgetID)].BuiltInstrParam3.insert(API.path+directory$+"/"+foldername$+"/")
						Endif
					Endif
				next
			next
		Endif
	
		if DirMode=1
			For i = 0 to FileCount-1
				FileName$=GetRawFolderFileName(id,i)
				If len(FileName$)>0
					dir[folder].ImageName.insert(Filename$) //fill temp type
					`For testing only
					if right(filename$,3)="png"
						end
						dir[folder].ImageID.insert(loadimage(API.path+directory$+"/"+foldername$+"/"+filename$))
					Endif
				Endif
			next
		Endif
	Endif
endfunction 
	
function ToggleDragBody()
	api.disable.DragBody=abs(api.disable.DragBody-1)
Endfunction

function ToggleDragEdge()
	api.disable.DragEdge=abs(api.disable.DragEdge-1)
Endfunction

function ToggleClipping()
	api.disable.Clipping=abs(api.disable.Clipping-1)
Endfunction

function ToggleRelativePositioning()
	api.disable.DragDrop=abs(api.disable.DragDrop-1)
Endfunction

function ToggleDragAndDrop()
	api.disable.Relative=abs(api.disable.Relative-1)
Endfunction




















