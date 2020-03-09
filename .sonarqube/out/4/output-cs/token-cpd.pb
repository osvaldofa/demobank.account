’2
cC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Api\Controllers\AccountController.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Api 
. 
Controllers *
{ 
[ 
Route 

(
 
$str 
) 
] 
[ 
ApiController 
] 
public 

class 
AccountController "
:# $
ControllerBase% 3
{ 
private 
readonly 
ILogger  
_logger! (
;( )
private 
readonly 
IAccountService (
_accountService) 8
;8 9
public 
AccountController  
(  !
IAccountService! 0
accountService1 ?
,? @
ILoggerA H
<H I
AccountControllerI Z
>Z [
logger\ b
)b c
{ 	
this 
. 
_accountService  
=! "
accountService# 1
;1 2
this 
. 
_logger 
= 
logger !
;! "
} 	
["" 	
HttpPost""	 
]"" 
public## 
ActionResult## 
<## 
string## "
>##" #+
CreateNewAccountForExistingUser##$ C
(##C D

NewAccount##D N
account##O V
)##V W
{$$ 	
if&& 
(&& 
VerifyAccountModel&& "
(&&" #
account&&# *
)&&* +
)&&+ ,
{'' 
long(( 
accountNumber(( "
=((# $
_accountService((% 4
.((4 5+
CreateNewAccountForExistingUser((5 T
(((T U
account((U \
)((\ ]
;((] ^
if)) 
()) 
accountNumber)) !
==))" $
$num))% &
)))& '
{** 
this++ 
.++ 
_logger++  
.++  !
LogError++! )
(++) *
$str++* a
)++a b
;++b c
return,, 

BadRequest,, %
(,,% &
$str,,& Q
),,Q R
;,,R S
}-- 
this// 
.// 
_logger// 
.// 
LogInformation// +
(//+ ,
$str//, S
+//T U
accountNumber//V c
)//c d
;//d e
return00 
Created00 
(00 
accountNumber00 ,
.00, -
ToString00- 5
(005 6
)006 7
,007 8
accountNumber009 F
.00F G
ToString00G O
(00O P
)00P Q
)00Q R
;00R S
}11 
this22 
.22 
_logger22 
.22 
LogError22 !
(22! "
$str22" R
)22R S
;22S T
return33 

BadRequest33 
(33 
$str33 U
)33U V
;33V W
}44 	
[;; 	
HttpGet;;	 
(;; 
$str;; "
);;" #
];;# $
public<< 
ActionResult<< 
<<< 
AccountModel<< (
><<( )

GetAccount<<* 4
(<<4 5
long<<5 9
accountNumber<<: G
)<<G H
{== 	
AccountModel>> 
account>>  
=>>! "
this>># '
.>>' (
_accountService>>( 7
.>>7 8
GetAccountById>>8 F
(>>F G
accountNumber>>G T
)>>T U
;>>U V
if?? 
(?? 
account?? 
!=?? 
null?? 
)??  
return@@ 
account@@ 
;@@ 
thisBB 
.BB 
_loggerBB 
.BB 
LogErrorBB !
(BB! "
$strBB" E
+BBF G
accountNumberBBH U
)BBU V
;BBV W
returnCC 

BadRequestCC 
(CC 
$strCC 2
)CC2 3
;CC3 4
}DD 	
[LL 	
HttpPutLL	 
(LL 
$strLL "
)LL" #
]LL# $
publicMM 
ActionResultMM 
<MM 
boolMM  
>MM  !
UpdateBalanceMM" /
(MM/ 0
longMM0 4
accountNumberMM5 B
,MMB C
[MMD E
FromBodyMME M
]MMM N
TransactionModelMMO _
transactionMM` k
)MMk l
{NN 	
ifOO 
(OO 
transactionOO 
?OO 
.OO 
DestinationAccountOO /
?OO/ 0
.OO0 1
AccountNumberOO1 >
==OO? A
accountNumberOOB O
&&PP 
accountNumberPP  
>PP! "
$numPP# $
)PP$ %
{QQ 
ifRR 
(RR 
thisRR 
.RR 
_accountServiceRR (
.RR( ) 
UpdateAccountBalanceRR) =
(RR= >
transactionRR> I
)RRI J
)RRJ K
returnSS 
trueSS 
;SS  
}TT 
returnUU 

BadRequestUU 
(UU 
falseUU #
)UU# $
;UU$ %
}VV 	
[]] 	
HttpGet]]	 
]]] 
public^^ 
ActionResult^^ 
<^^ 
AccountModel^^ (
[^^( )
]^^) *
>^^* +
GetAllAccounts^^, :
(^^: ;
)^^; <
{__ 	
return`` 
this`` 
.`` 
_accountService`` '
.``' (
GetAll``( .
(``. /
)``/ 0
;``0 1
}aa 	
privatecc 
boolcc 
VerifyAccountModelcc '
(cc' (

NewAccountcc( 2
accountcc3 :
)cc: ;
{dd 	
ifee 
(ee 
accountee 
?ee 
.ee 

CustomerIdee #
!=ee$ &
nullee' +
&&ee, .
accountee/ 6
.ee6 7

CustomerIdee7 A
>eeB C
$numeeD E
&&eeF H
accounteeI P
?eeP Q
.eeQ R
InitialCrediteeR _
!=ee` b
nulleec g
)eeg h
returnff 
trueff 
;ff 
returngg 
falsegg 
;gg 
}hh 	
}ii 
}jj û
RC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Api\InjectorBase.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Api 
{		 
public 

abstract 
class 
InjectorBase &
{ 
public 
void 
ConfigureInjections '
(' (
IServiceCollection( :
service; B
)B C
{ 	&
ConfigureServiceInjections &
(& '
service' .
). /
;/ 0)
ConfigureRepositoryInjections )
() *
service* 1
)1 2
;2 3
} 	
private 
void &
ConfigureServiceInjections /
(/ 0
IServiceCollection0 B
serviceC J
)J K
{ 	
service 
. 
AddSingleton  
(  !
typeof! '
(' (
IAccountService( 7
)7 8
,8 9
typeof: @
(@ A
AccountServiceA O
)O P
)P Q
;Q R
service"" 
."" 
AddSingleton""  
(""  !
typeof""! '
(""' (
ITransactionService""( ;
)""; <
,""< =
typeof""> D
(""D E
TransactionService""E W
)""W X
)""X Y
;""Y Z
}## 	
private%% 
void%% )
ConfigureRepositoryInjections%% 2
(%%2 3
IServiceCollection%%3 E
service%%F M
)%%M N
{&& 	
service(( 
.(( 
AddSingleton((  
(((  !
typeof((! '
(((' (
IAccountRepository((( :
)((: ;
,((; <
typeof((= C
(((C D
AccountRepository((D U
)((U V
)((V W
;((W X
service++ 
.++ 
AddSingleton++  
(++  !
typeof++! '
(++' (
ICustomerRepository++( ;
)++; <
,++< =
typeof++> D
(++D E
CustomerRepository++E W
)++W X
)++X Y
;++Y Z
service.. 
... 
AddSingleton..  
(..  !
typeof..! '
(..' ("
ITransactionRepository..( >
)..> ?
,..? @
typeof..A G
(..G H!
TransactionRepository..H ]
)..] ^
)..^ _
;.._ `
}// 	
}00 
}11 ¢
MC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Api\Program.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Api 
{ 
public 

class 
Program 
{ 
public		 
static		 
void		 
Main		 
(		  
string		  &
[		& '
]		' (
args		) -
)		- .
{

 	 
CreateWebHostBuilder  
(  !
args! %
)% &
.& '
Build' ,
(, -
)- .
.. /
Run/ 2
(2 3
)3 4
;4 5
} 	
public 
static 
IWebHostBuilder % 
CreateWebHostBuilder& :
(: ;
string; A
[A B
]B C
argsD H
)H I
=>J L
WebHost 
.  
CreateDefaultBuilder (
(( )
args) -
)- .
. 
ConfigureLogging !
(! "

logBuilder" ,
=>- /
{ 

logBuilder 
. 
ClearProviders -
(- .
). /
;/ 0

logBuilder 
. 

AddConsole )
() *
)* +
;+ ,

logBuilder 
. 
AddTraceSource -
(- .
$str. L
)L M
;M N
} 
) 
. 

UseStartup 
< 
Startup #
># $
($ %
)% &
;& '
} 
} ý!
MC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Api\Startup.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Api 
{ 
public 

class 
Startup 
: 
InjectorBase '
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public   
IConfiguration   
Configuration   +
{  , -
get  . 1
;  1 2
}  3 4
public&& 
void&& 
ConfigureServices&& %
(&&% &
IServiceCollection&&& 8
services&&9 A
)&&A B
{'' 	
services(( 
.(( 
AddMvc(( 
((( 
)(( 
.(( #
SetCompatibilityVersion(( 5
(((5 6 
CompatibilityVersion((6 J
.((J K
Version_2_2((K V
)((V W
;((W X
services)) 
.)) "
AddResponseCompression)) +
())+ ,
))), -
;))- .
ConfigureInjections,, 
(,,  
services,,  (
),,( )
;,,) *
services.. 
... 
AddSwaggerGen.. "
(.." #
c..# $
=>..% '
{// 
c00 
.00 

SwaggerDoc00 
(00 
$str00 !
,00! "
new00# &
	Microsoft00' 0
.000 1
OpenApi001 8
.008 9
Models009 ?
.00? @
OpenApiInfo00@ K
{00L M
Title00N S
=00T U
$str00V v
,00v w
Version00x 
=
00€ 
$str
00‚ †
}
00‡ ˆ
)
00ˆ ‰
;
00‰ Š
}11 
)11 
;11 
services33 
.33 
AddCors33 
(33 
options33 $
=>33% '
{44 
options55 
.55 
	AddPolicy55 !
(55! "
$str66 
,66 
builder77 
=>77 
builder77 $
.77$ %
WithOrigins77% 0
(770 1
$str771 H
)77H I
.88 
AllowAnyMethod88 !
(88! "
)88" #
.99 
AllowAnyHeader99 !
(99! "
)99" #
.:: 
AllowCredentials:: #
(::# $
)::$ %
)::% &
;::& '
};; 
);; 
;;; 
}<< 	
publicCC 
voidCC 
	ConfigureCC 
(CC 
IApplicationBuilderCC 1
appCC2 5
,CC5 6
IHostingEnvironmentCC7 J
envCCK N
)CCN O
{DD 	
ifEE 
(EE 
envEE 
.EE 
IsDevelopmentEE !
(EE! "
)EE" #
)EE# $
{FF 
appGG 
.GG %
UseDeveloperExceptionPageGG -
(GG- .
)GG. /
;GG/ 0
}HH 
appKK 
.KK 

UseSwaggerKK 
(KK 
)KK 
;KK 
appOO 
.OO 
UseSwaggerUIOO 
(OO 
cOO 
=>OO !
{PP 
stringQQ 
swaggerJsonBasePathQQ *
=QQ+ ,
stringQQ- 3
.QQ3 4
IsNullOrWhiteSpaceQQ4 F
(QQF G
cQQG H
.QQH I
RoutePrefixQQI T
)QQT U
?QQV W
$strQQX [
:QQ\ ]
$strQQ^ b
;QQb c
cRR 
.RR 
SwaggerEndpointRR !
(RR! "
$"RR" $
{RR$ %
swaggerJsonBasePathRR% 8
}RR8 9$
/swagger/v1/swagger.jsonRR9 Q
"RRQ R
,RRR S
$strRRT w
)RRw x
;RRx y
}SS 
)SS 
;SS 
appUU 
.UU 
UseCorsUU 
(UU 
$strUU $
)UU$ %
;UU% &
appVV 
.VV "
UseResponseCompressionVV &
(VV& '
)VV' (
;VV( )
appWW 
.WW 
UseMvcWW 
(WW 
)WW 
;WW 
}XX 	
}YY 
}ZZ 