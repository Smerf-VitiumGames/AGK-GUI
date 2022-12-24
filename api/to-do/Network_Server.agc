// server
function FlushSock(id)
	if GetSocketExists(id)=1
		flushsocket(id)
	endif
endfunction

function ListenForConnections()
		connect=GetSocketListenerConnection(Server.Listener)
		if connect>0 then AddTempClient(connect)
endfunction


function StartServer(IP$,port)
	LoadServer()
	Server.Listener=CreateSocketListener(IP$,port)
	Server.IP=IP$
	Server.Port=port
endfunction


function sendClientPulse(i)
	if timer()-Client[i].packettimer>3
		Client[i].packettimer=timer()
		if GetSoundExists(Client[i].socket)=1
			if GetSocketConnected(Client[i].socket)=1
				SendSocketString(Client[i].socket,"Pulse")
			endif
		endif
	endif
endfunction

Function CheckClientPulse()
	for i = 0 to Client.length
		if len(client[i].tempmessage) > 0
			Client[i].pulse=timer()
			if client[i].tempmessage <> "Pulse"
				client[i].msg=client[i].TempMessage
			endif
			client[i].tempmessage=""
		endif
		
		if timer()-Client[i].Pulse > 6.0
			DeleteSocket(client[i].socket)
			Client.remove(i)
			end
		endif
	next
endfunction


Function CheckTempPulse()
	for i = 0 to TempClients.length
		if len(tempclients[i].tempmessage) > 0
			TempClients[i].pulse=timer()
			if tempclients[i].tempmessage="Pulse"
				tempmessage$=""
			endif
		endif
		if timer()-TempClients[i].Pulse > 6.0
			DeleteSocket(tempclients[i].socket)
			tempClients.remove(i)
		endif
	next
endfunction


function sendTempPulse()
	if tempstep > TempClients.length then tempstep=0
	if TempClients.length >-1
		if timer()-TempClients[tempstep].packettimer>1
			TempClients[tempstep].packettimer=timer()
			if GetSoundExists(TempClients[tempstep].socket)=1
				if GetSocketConnected(TempClients[tempstep].socket)=1
					SendSocketString(TempClients[tempstep].socket,"Pulse")
				endif
			endif
		
		endif
	endif
	if tempstep <> TempClients.length then inc Tempstep,1
endfunction

function AddTempClient(socket)
	local temp
	temp as tempclienttype
	temp.socket=socket
	temp.ip=GetSocketRemoteIP(socket)
	temp.pulse=timer()
	tempClients.insert(temp)
Endfunction


function RemoveTempTimeouts()
	time#=timer()
	for i = 0 to TempClients.length
		if Time#-TempClients[i].pulse > Server.Client_IdleTimeout
			If GetSocketExists(TempClients[i].socket)
				DeleteSocket(TempClients[i].socket)
			endif
			tempClients.remove(i)
		endif
	next
endfunction

function RemovePlayerTimeouts() //flag set to one to not delete socket when moving from temp to actual player
	time#=timer()
	for i = 0 to Client.length
		if Time#-Client[i].pulse > Server.Client_IdleTimeout
			end
			If GetSocketExists(Client[i].socket)
				DeleteSocket(Client[i].socket)
			endif
			Client.remove(i)
		endif
	next
endfunction


// File: Player.agc
// Created: 21-09-03
type ClientType
	Pulse as float
	ID as integer
	Name as string
	IP as string
	Socket as integer
	X as float
	Y as float
	Z as float
	RotX as float
	RotY as float
	RotZ as float
	Velocity as float
	PacketTimer as float
	TempMessage as string
	msg as string
endtype
Global Client as ClientType[]

type TempClientType
	socket as integer
	IP as string
	badattempts as integer
	banned as integer
	packettimer as float
	Pulse as float
	TempMessage as string
	msg as string
endtype

Global TempClients as TempClientType []



Function Run_Login()
	GetTempCredentials()
	sendTempPulse()
	CheckTempPulse()
endfunction


Function GetTempCredentials()
	
	for i= 0 to TempClients.length	 
		if GetSocketExists(tempclients[i].socket)=1
			if GetSocketConnected(tempclients[i].socket)=1
				if GetSocketBytesAvailable( tempclients[i].socket)>0
					
					TempClients[i].TempMessage=GetSocketString(tempclients[i].socket)
					Found=FindString(TempClients[i].TempMessage,":",1,1)
				endif
			endif
		endif	
		if found >1
			name$=left(TempClients[i].TempMessage,found-1)
			if name$="ID"
				SendSocketString(TempClients[i].socket,"Verified")
				flushsock(tempclients[i].socket)
				LoginNewUser(TempClients[i].socket,tempclients[i].IP,name$)
				tempClients.remove(i)
				passfound=1
			endif	
		endif
	next
endfunction 

function loginNewUser(socket,IP$,name$)
	Temp as Clienttype
	Temp.ID=Server.IDassighnment
	inc Server.IDassighnment,1
	Temp.socket=socket
	Temp.IP=IP$
	Temp.Name=name$
	temp.pulse=timer()
	client.insert(Temp)
endfunction


Function GetClientMessage()
	for i= 0 to Client.length	 
		if GetSocketExists(client[i].socket)=1
			if GetSocketConnected(client[i].socket)=1
				if GetSocketBytesAvailable(client[i].socket)>0
					Client[i].TempMessage=GetSocketString(client[i].socket)
				endif
			endif
		endif	
	next
endfunction 


function sendClientMessage()
		for i = 0 to client.length
			if timer()-Client[i].packettimer>3
			Client[i].packettimer=timer()
			if GetSocketExists(Client[i].socket)=1
				if GetSocketConnected(Client[i].socket)=1
					SendSocketString(Client[i].socket,"makewindow")
					FlushSock(Client[i].socket)
				endif
			endif
			endif
		next

endfunction

















