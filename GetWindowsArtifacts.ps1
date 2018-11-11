
#Get TimeZone, Date, and PC Uptime 
Write-Output "==============================================================================="
Write-Output "Date, Timezone and PC Uptime"
Get-Date
[TimeZoneInfo]::Local
Get-WmiObject Win32_OperatingSystem | Select-Object LastBootUpTime
Write-Output "==============================================================================="


Write-Output
Write-Output # Used for output Speration 
Write-Output
Write-Output



#Get Operating System and OS Version 
Write-Output "==============================================================================="
Write-Output "Operating System and Version"
(Get-WmiObject Win32_OperatingSystem).Caption 
(Get-WmiObject Win32_OperatingSystem).Version
Write-Output "================================================================================"


Write-Output
Write-Output # Used for output Speration 
Write-Output
Write-Output

#Get Hardware specs 
Write-Host "================================================================================="
Write-Host "System Hardware Specs"
Write-Host "CPU Info"
Get-WmiObject win32_processor 
Write-Host "Amount of Ram"
(Get-WmiObject -Class win32_computersystem).TotalPhysicalMemory/1Gb
Write-Host
Write-Host "HDD Information"
get-WmiObject win32_logicaldisk
Write-Host "=================================================================================="

Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host


#This will get hostname and Domain 
Write-Host "=================================================================================="
Write-Host "Hostname and Domain"
Hostname 
Get-CimInstance Win32_ComputerSystem | select-object Name,PrimaryOwnerContact,UserName,Description,DNSHostName,Domain,workgroup,Manufacturer,Model,SystemFamily,SystemSKUNumber,SystemType,TotalPhysicalMemory
Write-Host "=================================================================================="


Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host



#This will Get the User Information
Write-Host "===================================================================================="
Write-Host "User Information"
Get-LocalUser | select-object Name,ObjectClass,PrincipleSource,LastLogon,PasswordRequired,PasswordLastSet,FullName,Description,SID,Enabled
Write-Host "====================================================================================="



Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host



#This Gets the Start at Boot Items 
Write-Host "====================================================================================="
Write-Host "Start at Boot"
Get-CimInstance Win32_StartupCommand | select-object Name,User,Caption,UserSID,Location
Write-Host "====================================================================================="


Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host



#This will get the scheduled taks 
Write-Host "====================================================================================="
Write-Host "Start at  Boot"
Get-ScheduledTask
Write-Host "====================================================================================="




Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host


#This will show the mac address table  
Write-Host "======================================================================================"
Write-Host
Write-Host "Mac Address Table"
arp -a 
Write-Host "======================================================================================"



Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host


# this will get mac addresses for the interfaces 
Write-Host "======================================================================================"
Write-Host "Mac Address for Interfaces"
getmac 
Write-Host "======================================================================================"


Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host

# this will get the routing table 
Write-Host "======================================================================================"
Write-Host "Routing Table"
route print
Write-Host "======================================================================================"


Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host



# This will get IPv4 and IPv6 Information 
Write-Host "======================================================================================"
Write-Host "IPv4 and IPv6 Addresses" 
Get-NetIPAddress | ft IPAddress, InterfaceAlias
Write-Host "======================================================================================"


Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host




# This wil get DHCP information displaying output incorrect 
Write-Host "======================================================================================"
Write-Host "DHCP Server"
Get-WmiObject Win32_NetworkAdapterConfiguration | select DHCPServer
Write-Host "======================================================================================"


Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host


# this will get DNS information Displaying output incorret
Write-Host "======================================================================================"
Write-Host "DNS Servers"
Get-DnsClientServerAddress | select-object -ExpandProperty Serveraddresses
Write-Host "======================================================================================"


Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host

# this will get Gateway information 
Write-Host "======================================================================================"
Write-Host "Gateway Information"
Get-NetIPConfiguration | % IPv4defaultgateway | fl nexthop
Write-Host "======================================================================================"



Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host


#This will get the listening services 
Write-Host "======================================================================================"
Write-Host "Listening Services"
Get-NetTCPConnection -State Listen | ft State, localport, ElemenetName, LocalAddress, RemoteAddress #listening ports
Write-Host "======================================================================================"


Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host




Write-Host "======================================================================================"
Write-Host "Connections"
Get-NetTCPConnection | where {$_.State -ne "Listen"} | ft creationtime,LocalPort,LocalAddress,remoteaddress,owningprocess, state
Write-Host "======================================================================================"


Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host


Write-Host "======================================================================================"
Write-Host "DNS Cache"
Get-DnsClientCache | select Name,Entry,Data,Section
Write-Host "======================================================================================"



Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host


#This will get SMB Share
Write-Host "======================================================================================"
Write-Host
Write-Host "SMB Share"
Get-SmbShare
Write-Host "======================================================================================"


Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host


#This will get the printers
Write-Host "======================================================================================"
Write-Host "SMB Printers"
Get-Printer
Write-Host "======================================================================================"


Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host

#This will get wireless profiles 
Write-Host "======================================================================================="
Write-Host "Show Wireless Profiles"
(netsh wlan show profiles)
Write-Host "======================================================================================="



Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host


#This will get list of Installed Software 
Write-Host "======================================================================================="
Write-Host "Installed Software"
Get-WmiObject -Class Win32_Product
Write-Host "======================================================================================="


Write-Host
Write-Host # Used for output Speration 
Write-Host
Write-Host


#This will get the process list 
Write-Host "======================================================================================="
Write-Host "Get Process List"
Get-WmiObject Win32_Process | Select-Object ProcessName,ProcessID,ParentProcessID,Path
Write-Host "======================================================================================="

#This will get list of drivers
Write-Output "======================================================================================"
Write-Output "List of Drivers"
Get-WindowsDriver -Online -All
Write-Output "======================================================================================"