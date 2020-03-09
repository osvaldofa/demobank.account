�
cC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Domain\Interfaces\IAccountService.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Domain !
.! "

Interfaces" ,
{ 
public 

	interface 
IAccountService $
{		 
long

 +
CreateNewAccountForExistingUser

 ,
(

, -

NewAccount

- 7
account

8 ?
)

? @
;

@ A
AccountModel 
GetAccountById #
(# $
long$ (
	accountId) 2
)2 3
;3 4
AccountModel 
[ 
] 
GetAll 
( 
) 
;  
bool  
UpdateAccountBalance !
(! "
TransactionModel" 2
transaction3 >
)> ?
;? @
} 
} �X
`C:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Domain\Services\AccountService.cs
	namespace		 	
DemoBank		
 
.		 
Account		 
.		 
Domain		 !
.		! "
Services		" *
{

 
[ #
ExcludeFromCodeCoverage 
] 
public 

class 
AccountService 
:  !
IAccountService" 1
{ 
private 
readonly 
IAccountRepository +
_accountRepository, >
;> ?
private 
readonly 
ICustomerRepository ,
_customerRepository- @
;@ A
private 
readonly 
ILogger  
<  !
AccountService! /
>/ 0
_logger1 8
;8 9
private 
readonly 
ITransactionService ,
_transactionService- @
;@ A
public!! 
AccountService!! 
(!! 
IAccountRepository!! 0
accountRepository!!1 B
,!!B C
ICustomerRepository!!D W
customerRepository!!X j
,!!j k
ILogger!!l s
<!!s t
AccountService	!!t �
>
!!� �
logger
!!� �
,
!!� �!
ITransactionService
!!� � 
transactionService
!!� �
)
!!� �
{"" 	
this## 
.## 
_accountRepository## #
=##$ %
accountRepository##& 7
;##7 8
this$$ 
.$$ 
_customerRepository$$ $
=$$% &
customerRepository$$' 9
;$$9 :
this%% 
.%% 
_logger%% 
=%% 
logger%% !
;%%! "
this&& 
.&& 
_transactionService&& $
=&&% &
transactionService&&' 9
;&&9 :
}'' 	
public.. 
long.. +
CreateNewAccountForExistingUser.. 3
(..3 4

NewAccount..4 >
account..? F
)..F G
{// 	
this00 
.00 
_logger00 
.00 
LogInformation00 '
(00' (
$str00( o
+00p q
account00r y
.00y z

CustomerId	00z �
)
00� �
;
00� �
CustomerModel11 
customer11 "
=11# $
_customerRepository11% 8
.118 9
GetById119 @
(11@ A
account11A H
.11H I

CustomerId11I S
)11S T
;11T U
long22 
accountNumber22 
=22  
$num22! "
;22" #
if33 
(33 
customer33 
!=33 
null33  
)33  !
{44 
AccountModel55 

newAccount55 '
=55( )
new55* -
AccountModel55. :
(55: ;
$num55; <
,55< =
customer55> F
,55F G
$num55H I
)55I J
;55J K
accountNumber66 
=66 
this66  $
.66$ %
_accountRepository66% 7
.667 8
Save668 <
(66< =

newAccount66= G
)66G H
;66H I
this77 
.77 
_logger77 
.77 
LogInformation77 +
(77+ ,
$str77, W
+77X Y
accountNumber77Z g
)77g h
;77h i
if:: 
(:: 
account:: 
.:: 
InitialCredit:: )
>::* +
$num::, -
)::- .
{;; 
this<< 
.<< 
_logger<<  
.<<  !
LogInformation<<! /
(<</ 0
$str	<<0 �
)
<<� �
;
<<� �
TransactionModel== $
transaction==% 0
===1 2
new==3 6
TransactionModel==7 G
(==G H
)==H I
;==I J

newAccount>> 
.>> 
AccountNumber>> ,
=>>- .
accountNumber>>/ <
;>>< =
transaction?? 
.??  
DestinationAccount??  2
=??3 4

newAccount??5 ?
;??? @
transaction@@ 
.@@  
TransactionType@@  /
=@@0 1
TransactionTypes@@2 B
.@@B C
DEPOSIT@@C J
;@@J K
transactionAA 
.AA  
ValueAA  %
=AA& '
accountAA( /
.AA/ 0
InitialCreditAA0 =
;AA= >
ifCC 
(CC 
!CC 
thisCC 
.CC 
_transactionServiceCC 1
.CC1 2 
CreateNewTransactionCC2 F
(CCF G
transactionCCG R
)CCR S
)CCS T
returnDD 
$numDD  
;DD  !
}EE 
returnFF 
accountNumberFF $
;FF$ %
}GG 
returnHH 
$numHH 
;HH 
}II 	
publicPP 
AccountModelPP 
GetAccountByIdPP *
(PP* +
longPP+ /
	accountIdPP0 9
)PP9 :
{QQ 	
returnRR 
thisRR 
.RR 
_accountRepositoryRR *
.RR* +
GetByIdRR+ 2
(RR2 3
	accountIdRR3 <
)RR< =
;RR= >
}SS 	
publicYY 
AccountModelYY 
[YY 
]YY 
GetAllYY $
(YY$ %
)YY% &
{ZZ 	
return[[ 
this[[ 
.[[ 
_accountRepository[[ *
.[[* +
GetAll[[+ 1
([[1 2
)[[2 3
;[[3 4
}\\ 	
publiccc 
boolcc  
UpdateAccountBalancecc (
(cc( )
TransactionModelcc) 9
transactioncc: E
)ccE F
{dd 	
longee 
accountNumberee 
=ee  
$numee! "
;ee" #
ifgg 
(gg 
transactiongg 
?gg 
.gg 
DestinationAccountgg /
?gg/ 0
.gg0 1
AccountNumbergg1 >
>gg? @
$numggA B
&&hh 
transactionhh 
.hh 
Valuehh $
>hh% &
$numhh' (
&&hh) +
!hh, -
stringhh- 3
.hh3 4
IsNullOrEmptyhh4 A
(hhA B
transactionhhB M
.hhM N
TransactionTypehhN ]
)hh] ^
)hh^ _
{ii 
AccountModeljj 
accountjj $
=jj% &
thisjj' +
.jj+ ,
_accountRepositoryjj, >
.jj> ?
GetByIdjj? F
(jjF G
transactionjjG R
.jjR S
DestinationAccountjjS e
.jje f
AccountNumberjjf s
)jjs t
;jjt u
switchll 
(ll 
transactionll #
?ll# $
.ll$ %
TransactionTypell% 4
)ll4 5
{mm 
casenn 
TransactionTypesnn )
.nn) *
DEPOSITnn* 1
:nn1 2
accountoo 
.oo  
Balanceoo  '
+=oo( *
transactionoo+ 6
.oo6 7
Valueoo7 <
;oo< =
breakpp 
;pp 
caseqq 
TransactionTypesqq )
.qq) *
WITHDRAWqq* 2
:qq2 3
ifrr 
(rr 
accountrr #
.rr# $
Balancerr$ +
>=rr, .
transactionrr/ :
.rr: ;
Valuerr; @
)rr@ A
accountss #
.ss# $
Balancess$ +
-=ss, .
transactionss/ :
.ss: ;
Valuess; @
;ss@ A
elsett 
returnuu "
falseuu# (
;uu( )
breakvv 
;vv 
caseww 
TransactionTypesww )
.ww) *
TRANSFERww* 2
:ww2 3
AccountModelxx $
originAccountxx% 2
=xx3 4
thisxx5 9
.xx9 :
_accountRepositoryxx: L
.xxL M
GetByIdxxM T
(xxT U
transactionxxU `
.xx` a
OriginAccountxxa n
.xxn o
AccountNumberxxo |
)xx| }
;xx} ~
accountNumberyy %
=yy& '
Transferyy( 0
(yy0 1
originAccountyy1 >
,yy> ?
accountyy@ G
,yyG H
transactionyyI T
.yyT U
ValueyyU Z
)yyZ [
;yy[ \
breakzz 
;zz 
default{{ 
:{{ 
return|| 
false|| $
;||$ %
}}} 
accountNumber~~ 
=~~ 
this~~  $
.~~$ %
_accountRepository~~% 7
.~~7 8
Save~~8 <
(~~< =
account~~= D
)~~D E
;~~E F
if
�� 
(
�� 
accountNumber
�� !
>
��" #
$num
��$ %
)
��% &
return
�� 
true
�� 
;
��  
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
private
�� 
long
�� 
Transfer
�� 
(
�� 
AccountModel
�� *
origin
��+ 1
,
��1 2
AccountModel
��3 ?
destination
��@ K
,
��K L
double
��M S
value
��T Y
)
��Y Z
{
�� 	
AccountModel
��  
destinationAccount
�� +
=
��, -
this
��. 2
.
��2 3 
_accountRepository
��3 E
.
��E F
GetById
��F M
(
��M N
destination
��N Y
.
��Y Z
AccountNumber
��Z g
)
��g h
;
��h i
AccountModel
�� 
originAccount
�� &
=
��' (
this
��) -
.
��- . 
_accountRepository
��. @
.
��@ A
GetById
��A H
(
��H I
origin
��I O
.
��O P
AccountNumber
��P ]
)
��] ^
;
��^ _
long
�� !
accountConfirmation
�� $
=
��% &
$num
��' (
;
��( )
if
�� 
(
�� 
originAccount
�� 
!=
��  
null
��! %
&&
��& ( 
destinationAccount
��) ;
!=
��< >
null
��? C
)
��C D
{
�� 
if
�� 
(
�� 
originAccount
�� !
.
��! "
Balance
��" )
>=
��* ,
value
��- 2
)
��2 3
{
�� 
originAccount
�� !
.
��! "
Balance
��" )
-=
��* ,
value
��- 2
;
��2 3 
destinationAccount
�� &
.
��& '
Balance
��' .
+=
��/ 1
value
��2 7
;
��7 8
if
�� 
(
�� 
this
�� 
.
��  
_accountRepository
�� /
.
��/ 0
Save
��0 4
(
��4 5
originAccount
��5 B
)
��B C
>
��D E
$num
��F G
)
��G H!
accountConfirmation
�� +
=
��, -
this
��. 2
.
��2 3 
_accountRepository
��3 E
.
��E F
Save
��F J
(
��J K 
destinationAccount
��K ]
)
��] ^
;
��^ _
}
�� 
}
�� 
return
�� !
accountConfirmation
�� &
;
��& '
}
�� 	
}
�� 
}�� 