Ì
tC:\Development\Test\DemoBank\DemoBank.Account\demobank.account\DemoBank.Account.Domain\Interfaces\IAccountService.cs
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
;3 4
bool  
UpdateAccountBalance !
(! "
TransactionModel" 2
transaction3 >
)> ?
;? @
} 
} ±*
qC:\Development\Test\DemoBank\DemoBank.Account\demobank.account\DemoBank.Account.Domain\Services\AccountService.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Domain !
.! "
Services" *
{ 
public 

class 
AccountService 
:  !
IAccountService" 1
{		 
private 
readonly 
IAccountRepository +
_accountRepository, >
;> ?
private 
readonly 
ICustomerRepository ,
_customerRepository- @
;@ A
public 
AccountService 
( 
IAccountRepository 0
accountRepository1 B
,B C
ICustomerRepositoryD W
customerRepositoryX j
)j k
{ 	
this 
. 
_accountRepository #
=$ %
accountRepository& 7
;7 8
this 
. 
_customerRepository $
=% &
customerRepository' 9
;9 :
} 	
public 
long +
CreateNewAccountForExistingUser 3
(3 4

NewAccount4 >
account? F
)F G
{   	
CustomerModel!! 
customer!! "
=!!# $
_customerRepository!!% 8
.!!8 9
GetById!!9 @
(!!@ A
account!!A H
.!!H I

CustomerId!!I S
)!!S T
;!!T U
if"" 
("" 
customer"" 
!="" 
null""  
)""  !
{## 
if$$ 
($$ 
account$$ 
.$$ 
InitialCredit$$ )
>$$* +
$num$$, -
)$$- .
{%% 
AccountModel&&  

newAccount&&! +
=&&, -
new&&. 1
AccountModel&&2 >
(&&> ?
$num&&? @
,&&@ A
customer&&B J
,&&J K
$num&&L M
)&&M N
;&&N O
long'' 
accountNumber'' &
=''' (
this'') -
.''- .
_accountRepository''. @
.''@ A
Save''A E
(''E F

newAccount''F P
)''P Q
;''Q R
return** 
accountNumber** (
;**( )
}++ 
},, 
return-- 
$num-- 
;-- 
}.. 	
public55 
AccountModel55 
GetAccountById55 *
(55* +
long55+ /
	accountId550 9
)559 :
{66 	
return77 
this77 
.77 
_accountRepository77 *
.77* +
GetById77+ 2
(772 3
	accountId773 <
)77< =
;77= >
}88 	
public?? 
bool??  
UpdateAccountBalance?? (
(??( )
TransactionModel??) 9
transaction??: E
)??E F
{@@ 	
ifAA 
(AA 
transactionAA 
?AA 
.AA 
DestinationAccountAA /
?AA/ 0
.AA0 1
AccountNumberAA1 >
>AA? @
$numAAA B
&&BB 
transactionBB 
.BB 
ValueBB $
>BB% &
$numBB' (
&&BB) +
!BB, -
stringBB- 3
.BB3 4
IsNullOrEmptyBB4 A
(BBA B
transactionBBB M
.BBM N
TransactionTypeBBN ]
)BB] ^
)BB^ _
{CC 
AccountModelDD 
accountDD $
=DD% &
thisDD' +
.DD+ ,
_accountRepositoryDD, >
.DD> ?
GetByIdDD? F
(DDF G
transactionDDG R
.DDR S
DestinationAccountDDS e
.DDe f
AccountNumberDDf s
)DDs t
;DDt u
switchFF 
(FF 
transactionFF #
?FF# $
.FF$ %
TransactionTypeFF% 4
)FF4 5
{GG 
caseHH 
TransactionTypesHH )
.HH) *
DEPOSITHH* 1
:HH1 2
accountII 
.II  
BalanceII  '
+=II( *
transactionII+ 6
.II6 7
ValueII7 <
;II< =
breakJJ 
;JJ 
caseKK 
TransactionTypesKK )
.KK) *
WITHDRAWKK* 2
:KK2 3
ifLL 
(LL 
accountLL #
.LL# $
BalanceLL$ +
>=LL, .
transactionLL/ :
.LL: ;
ValueLL; @
)LL@ A
accountMM #
.MM# $
BalanceMM$ +
-=MM, .
transactionMM/ :
.MM: ;
ValueMM; @
;MM@ A
elseNN 
returnOO "
falseOO# (
;OO( )
breakPP 
;PP 
defaultQQ 
:QQ 
returnRR 
falseRR $
;RR$ %
}SS 
longTT 
accountNumberTT "
=TT# $
thisTT% )
.TT) *
_accountRepositoryTT* <
.TT< =
SaveTT= A
(TTA B
accountTTB I
)TTI J
;TTJ K
ifVV 
(VV 
accountNumberVV !
>VV" #
$numVV$ %
)VV% &
returnWW 
trueWW 
;WW  
}XX 
returnYY 
falseYY 
;YY 
}ZZ 	
}[[ 
}\\ 