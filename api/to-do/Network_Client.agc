`clientsIDe


type NetType
	Sendtimer as float
	x as float
	y as float
	z as float
	xRot as float
	yRot as float
	zRot as float
	Client_MasterSock as integer
	Client_Masterip as string
	Client_Masterport as integer
	Client_escapeKey as integer
	Client_MyHeartBeat as float
	Client_listener as integer
	Client_Serverstring as string
	pulSetimer2 as float
endtype

function startclient()
	local MyheartBeat
	API.Net.Client_Mastersock=10001
	API.Net.Client_Masterip="127.0.0.1"
	API.Net.Client_Masterport=3856
	API.net.Sendtimer=timer()
	MyHeartBeat=timer()
	listener=CreateSocketListener("127.0.0.1",3857) `cant listen on same port or it listens to istself
endfunction

`NETWORK_NETWORK_NETWORK_NETWORK_NETWORK_
Function runNetwork()
	local Connected
	Connected=reconnect()
	if connected=1
		getServerString()
		SendServerString()
		sendPulse()
	endif
endfunction
`NETWORK_NETWORK_NETWORK_NETWORK_NETWORK_
function sendPulse()
	if timer()-pulSetimer2# >1
		pulSetimer2#=timer()
		if getsocketconnected(API.Net.Client_Mastersock)=1
			SendSocketString(API.Net.Client_Mastersock,"Pulse")
			FlushSock(API.Net.Client_Mastersock)
		endif
	endif
endfunction

Function SendServerString()
	global sent
	sent= sent+1
	if  timer()-API.Net.SendTimer >= 2`milliseconds
		API.Net.Sendtimer=Timer()
		`SendMyInfo()
		SendMessage()
	endif
endfunction


function SendMyInfo()
	SendSocketString(API.Net.Client_Mastersock,"Or")`orientation vague yes
	SendSocketFloat(API.Net.Client_Mastersock,API.Net.x)
	SendSocketFloat(API.Net.Client_Mastersock,API.Net.y)
	SendSocketFloat(API.Net.Client_Mastersock,API.Net.z)
	SendSocketFloat(API.Net.Client_Mastersock,API.Net.xRot)
	SendSocketFloat(API.Net.Client_Mastersock,API.Net.yRot)
	SendSocketFloat(API.Net.Client_Mastersock,API.Net.zRot)
endfunction


function SendMessage()
	if GetSocketExists(API.Net.Client_mastersock)=1
		if GetSocketConnected(API.Net.Client_mastersock)=1
			SendSocketString(API.Net.Client_mastersock,"ID:")
			FlushSock(API.Net.Client_mastersock)
		endif
	endif
endfunction


function getServerString()
	local serverstring as string
	if GetSocketExists(API.Net.Client_Mastersock)=1
		if GetSocketConnected(API.Net.Client_Mastersock)=1
			if GetSocketBytesAvailable(API.Net.Client_Mastersock )> 0
				Serverstring=getsocketstring(API.Net.Client_Mastersock)
			endif
		endif
	endif
		FindMethod()
endfunction Serverstring


function FindMethod()
	if lower(left(API.Net.Client_Serverstring,10))="makewindow"
		`print("MakeWindow")
		API.Net.Client_serverstring=""
		`CreateObjectBox(1,1,1,1)
	endif
endfunction


function FlushSock(ID)
	if GetSocketExists(ID)=1
		if GetSocketConnected(ID)=1
			flushsocket(ID)
		endif
	endif
endfunction

function reconnect()
	
	local sock as Integer
	if GetSocketExists(API.Net.Client_Mastersock)=0
		connectsocket(API.Net.client_Mastersock,API.Net.client_Masterip,API.Net.client_Masterport,6000)
	endif
	if GetSocketExists(API.Net.Client_Mastersock)=1
		sock=GetSocketConnected(API.Net.Client_Mastersock)
		if sock=-1
			connectsocket(API.Net.client_Mastersock,API.Net.client_Masterip,API.Net.client_Masterport,6000)
		endif
	endif
endfunction sock
