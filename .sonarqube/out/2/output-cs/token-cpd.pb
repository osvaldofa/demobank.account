¿
}C:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Infrastructure.Communication\Interfaces\ITransactionService.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Infrastructure )
.) *
Communication* 7
{ 
public 

	interface 
ITransactionService (
{ 
bool  
CreateNewTransaction !
(! "
TransactionModel" 2
transaction3 >
)> ?
;? @
} 
}		 é
zC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Infrastructure.Communication\Services\TransactionService.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Infrastructure )
.) *
Communication* 7
.7 8
Services8 @
{ 
[ #
ExcludeFromCodeCoverage 
] 
public 

class 
TransactionService #
:$ %
ITransactionService& 9
{ 
private 
readonly 
ILogger  
<  !
TransactionService! 3
>3 4
_logger5 <
;< =
private 
readonly 
IConfiguration '
_config( /
;/ 0
private 
readonly 

HttpClient #

httpClient$ .
;. /
public 
TransactionService !
(! "
ILogger" )
<) *
TransactionService* <
>< =
logger> D
,D E
IConfigurationF T
configU [
)[ \
{ 	
this 
. 
_logger 
= 
logger !
;! "
this 
. 
_config 
= 
config !
;! "
this 
. 

httpClient 
= 
new !

HttpClient" ,
(, -
)- .
;. /
} 	
public 
bool  
CreateNewTransaction (
(( )
TransactionModel) 9
transaction: E
)E F
{ 	
string 
transactionURL !
=" #
this$ (
.( )
_config) 0
[0 1
$str1 H
]H I
;I J
this 
. 
_logger 
. 
LogInformation '
(' (
$str( f
+g h
transactionURLi w
)w x
;x y
HttpResponseMessage 
response  (
=) *

httpClient+ 5
.5 6
PostAsJsonAsync6 E
(E F
transactionURLF T
,T U
transactionV a
)a b
.b c
Resultc i
;i j
if!! 
(!! 
response!! 
.!! 
IsSuccessStatusCode!! ,
)!!, -
return"" 
true"" 
;"" 
return$$ 
false$$ 
;$$ 
}%% 	
}&& 
}'' 