„/
}C:\Development\Test\DemoBank\DemoBank.Account\demobank.account\DemoBank.Account.Presentation\Controllers\AccountController.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Presentation '
.' (
Controllers( 3
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
}VV 	
privateXX 
boolXX 
VerifyAccountModelXX '
(XX' (

NewAccountXX( 2
accountXX3 :
)XX: ;
{YY 	
ifZZ 
(ZZ 
accountZZ 
?ZZ 
.ZZ 

CustomerIdZZ #
!=ZZ$ &
nullZZ' +
&&ZZ, .
accountZZ/ 6
.ZZ6 7

CustomerIdZZ7 A
>ZZB C
$numZZD E
&&ZZF H
accountZZI P
?ZZP Q
.ZZQ R
InitialCreditZZR _
!=ZZ` b
nullZZc g
)ZZg h
return[[ 
true[[ 
;[[ 
return\\ 
false\\ 
;\\ 
}]] 	
}^^ 
}__ Ú
lC:\Development\Test\DemoBank\DemoBank.Account\demobank.account\DemoBank.Account.Presentation\InjectorBase.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Presentation '
{ 
public 

abstract 
class 
InjectorBase &
{ 
public 
void 
ConfigureInjections '
(' (
IServiceCollection( :
service; B
)B C
{ 	&
ConfigureServiceInjections &
(& '
service' .
). /
;/ 0)
ConfigureRepositoryInjections )
() *
service* 1
)1 2
;2 3
} 	
private 
void &
ConfigureServiceInjections /
(/ 0
IServiceCollection0 B
serviceC J
)J K
{ 	
service 
. 
AddSingleton  
(  !
typeof! '
(' (
IAccountService( 7
)7 8
,8 9
typeof: @
(@ A
AccountServiceA O
)O P
)P Q
;Q R
} 	
private   
void   )
ConfigureRepositoryInjections   2
(  2 3
IServiceCollection  3 E
service  F M
)  M N
{!! 	
service## 
.## 
AddSingleton##  
(##  !
typeof##! '
(##' (
IAccountRepository##( :
)##: ;
,##; <
typeof##= C
(##C D
AccountRepository##D U
)##U V
)##V W
;##W X
service&& 
.&& 
AddSingleton&&  
(&&  !
typeof&&! '
(&&' (
ICustomerRepository&&( ;
)&&; <
,&&< =
typeof&&> D
(&&D E
CustomerRepository&&E W
)&&W X
)&&X Y
;&&Y Z
}'' 	
}(( 
})) Å
gC:\Development\Test\DemoBank\DemoBank.Account\demobank.account\DemoBank.Account.Presentation\Program.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Presentation '
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
} ú
gC:\Development\Test\DemoBank\DemoBank.Account\demobank.account\DemoBank.Account.Presentation\Startup.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Presentation '
{ 
public 

class 
Startup 
: 
InjectorBase '
{ 
public 
Startup 
( 
IConfiguration %
configuration& 3
)3 4
{ 	
Configuration 
= 
configuration )
;) *
} 	
public 
IConfiguration 
Configuration +
{, -
get. 1
;1 2
}3 4
public   
void   
ConfigureServices   %
(  % &
IServiceCollection  & 8
services  9 A
)  A B
{!! 	
services"" 
."" 
AddMvc"" 
("" 
)"" 
."" #
SetCompatibilityVersion"" 5
(""5 6 
CompatibilityVersion""6 J
.""J K
Version_2_2""K V
)""V W
;""W X
ConfigureInjections%% 
(%%  
services%%  (
)%%( )
;%%) *
services'' 
.'' 
AddSwaggerGen'' "
(''" #
c''# $
=>''% '
{(( 
c)) 
.)) 

SwaggerDoc)) 
()) 
$str)) !
,))! "
new))# &
	Microsoft))' 0
.))0 1
OpenApi))1 8
.))8 9
Models))9 ?
.))? @
OpenApiInfo))@ K
{))L M
Title))N S
=))T U
$str))V d
,))d e
Version))f m
=))n o
$str))p t
}))u v
)))v w
;))w x
}** 
)** 
;** 
}++ 	
public22 
void22 
	Configure22 
(22 
IApplicationBuilder22 1
app222 5
,225 6
IHostingEnvironment227 J
env22K N
)22N O
{33 	
if44 
(44 
env44 
.44 
IsDevelopment44 !
(44! "
)44" #
)44# $
{55 
app66 
.66 %
UseDeveloperExceptionPage66 -
(66- .
)66. /
;66/ 0
app99 
.99 

UseSwagger99 
(99 
)99  
;99  !
app== 
.== 
UseSwaggerUI==  
(==  !
c==! "
=>==# %
{>> 
c?? 
.?? 
SwaggerEndpoint?? %
(??% &
$str??& @
,??@ A
$str??B S
)??S T
;??T U
}@@ 
)@@ 
;@@ 
}AA 
elseBB 
{CC 
appEE 
.EE 
UseHstsEE 
(EE 
)EE 
;EE 
}FF 
appHH 
.HH 
UseHttpsRedirectionHH #
(HH# $
)HH$ %
;HH% &
appII 
.II 
UseMvcII 
(II 
)II 
;II 
}JJ 	
}KK 
}LL 