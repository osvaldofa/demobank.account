¾
sC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Infrastructure.Data\Interfaces\IAccountRepository.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Infrastructure )
.) *
Data* .
.. /
Repositories/ ;
{ 
public 

	interface 
IAccountRepository '
{		 
long

 
Save

 
(

 
AccountModel

 
account

 &
)

& '
;

' (
AccountModel 
GetById 
( 
long !
AccountNumber" /
)/ 0
;0 1
AccountModel 
[ 
] 
GetAll 
( 
) 
;  
} 
} Å
tC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Infrastructure.Data\Interfaces\ICustomerRepository.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Infrastructure )
.) *
Data* .
.. /
Repositories/ ;
{ 
public 

	interface 
ICustomerRepository (
{		 
CustomerModel

 
GetById

 
(

 
long

 "

customerId

# -
)

- .
;

. /
} 
} Ž
wC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Infrastructure.Data\Interfaces\ITransactionRepository.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Infrastructure )
.) *
Data* .
.. /
Repositories/ ;
{ 
public 

	interface "
ITransactionRepository +
{		 
long

 
Save

 
(

 
TransactionModel

 "
transaction

# .
)

. /
;

/ 0
TransactionModel 
[ 
] *
GetTransactionsByAccountNumber 9
(9 :
long: >
accountNumber? L
)L M
;M N
} 
} é
iC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Infrastructure.Data\Models\AccountModel.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Infrastructure )
.) *
Data* .
.. /
Models/ 5
{ 
public 

class 
AccountModel 
{ 
public 
long 
AccountNumber !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
CustomerModel 
CustomerReference .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public 
double 
Balance 
{ 
get  #
;# $
set% (
;( )
}* +
public 
AccountModel 
( 
long  
accountNumber! .
,. /
CustomerModel0 =
customer> F
,F G
doubleH N
balanceO V
)V W
{ 	
this 
. 
AccountNumber 
=  
accountNumber! .
;. /
this 
. 
CustomerReference "
=# $
customer% -
;- .
this 
. 
Balance 
= 
balance "
;" #
} 	
} 
} °
jC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Infrastructure.Data\Models\CustomerModel.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Infrastructure )
.) *
Data* .
.. /
Models/ 5
{ 
public 

class 
CustomerModel 
{ 
public		 
long		 

CustomerId		 
{		  
get		! $
;		$ %
set		& )
;		) *
}		+ ,
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
string 
Surname 
{ 
get  #
;# $
set% (
;( )
}* +
public 
CustomerModel 
( 
long !

customerId" ,
,, -
string. 4
name5 9
,9 :
string; A
surnameB I
)I J
{ 	
this 
. 

CustomerId 
= 

customerId (
;( )
this 
. 
Name 
= 
name 
; 
this 
. 
Surname 
= 
surname "
;" #
} 	
} 
} Û
gC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Infrastructure.Data\Models\NewAccount.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Infrastructure )
.) *
Data* .
.. /
Models/ 5
{ 
public 

class 

NewAccount 
{		 
public

 
long

 

CustomerId

 
{

  
get

! $
;

$ %
set

& )
;

) *
}

+ ,
public 
double 
InitialCredit #
{$ %
get& )
;) *
set+ .
;. /
}0 1
} 
} ò

mC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Infrastructure.Data\Models\TransactionModel.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Infrastructure )
.) *
Data* .
.. /
Models/ 5
{ 
public 

class 
TransactionModel !
{ 
public 
long 
TransactionId !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
AccountModel 
DestinationAccount .
{/ 0
get1 4
;4 5
set6 9
;9 :
}; <
public		 
AccountModel		 
OriginAccount		 )
{		* +
get		, /
;		/ 0
set		1 4
;		4 5
}		6 7
public

 
double

 
Value

 
{

 
get

 !
;

! "
set

# &
;

& '
}

( )
public 
string 
TransactionType %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
When 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} ô0
tC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Infrastructure.Data\Repositories\AccountRepository.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Infrastructure )
.) *
Data* .
.. /
Repositories/ ;
{ 
public 

class 
AccountRepository "
:# $
IAccountRepository% 7
{		 
private

 
List

 
<

 
AccountModel

 !
>

! "
Accounts

# +
;

+ ,
[ 	#
ExcludeFromCodeCoverage	  
]  !
public 
AccountRepository  
(  !
)! "
{ 	
this 
. 
Accounts 
= 
new 
List  $
<$ %
AccountModel% 1
>1 2
(2 3
)3 4
;4 5
CustomerModel 
	customerA #
=$ %
new& )
CustomerModel* 7
(7 8
$num8 <
,< =
$str> D
,D E
$strF K
)K L
;L M
CustomerModel 
	customerB #
=$ %
new& )
CustomerModel* 7
(7 8
$num8 <
,< =
$str> F
,F G
$strH O
)O P
;P Q
CustomerModel 
	customerC #
=$ %
new& )
CustomerModel* 7
(7 8
$num8 <
,< =
$str> E
,E F
$strG P
)P Q
;Q R
this 
. 
Accounts 
. 
Add 
( 
new !
AccountModel" .
(. /
$num/ 3
,3 4
	customerA5 >
,> ?
$num@ E
)E F
)F G
;G H
this 
. 
Accounts 
. 
Add 
( 
new !
AccountModel" .
(. /
$num/ 3
,3 4
	customerB5 >
,> ?
$num@ G
)G H
)H I
;I J
this 
. 
Accounts 
. 
Add 
( 
new !
AccountModel" .
(. /
$num/ 3
,3 4
	customerC5 >
,> ?
$num@ H
)H I
)I J
;J K
} 	
public"" 
AccountModel"" 
["" 
]"" 
GetAll"" $
(""$ %
)""% &
{## 	
return$$ 
this$$ 
.$$ 
Accounts$$  
.$$  !
ToArray$$! (
($$( )
)$$) *
;$$* +
}%% 	
public,, 
AccountModel,, 
GetById,, #
(,,# $
long,,$ (
accountNumber,,) 6
),,6 7
{-- 	
if.. 
(.. 
accountNumber.. 
==..  
$num..! "
).." #
return// 
null// 
;// 
else00 
{11 
var33 
accounts33 
=33 
from33 #
a33$ %
in33& (
this33) -
.33- .
Accounts33. 6
where44 $
a44% &
.44& '
AccountNumber44' 4
==445 7
accountNumber448 E
select55 %
a55& '
;55' (
if66 
(66 
accounts66 
.66 
ToList66 #
<66# $
AccountModel66$ 0
>660 1
(661 2
)662 3
.663 4
Count664 9
==66: <
$num66= >
)66> ?
{77 
return88 
null88 
;88  
}99 
else:: 
return;; 
accounts;; #
?;;# $
.;;$ %
First;;% *
(;;* +
);;+ ,
;;;, -
}<< 
}== 	
public?? 
long?? 
Save?? 
(?? 
AccountModel?? %
account??& -
)??- .
{@@ 	
ifBB 
(BB 
GetByIdBB 
(BB 
accountBB 
.BB  
AccountNumberBB  -
)BB- .
!=BB/ 1
nullBB2 6
)BB6 7
{CC 
AccountModelDD 
accountExistentDD ,
=DD- .
thisDD/ 3
.DD3 4
AccountsDD4 <
.DD< =
FindDD= A
(DDA B
aDDB C
=>DDD F
aDDG H
.DDH I
AccountNumberDDI V
==DDW Y
accountDDZ a
.DDa b
AccountNumberDDb o
)DDo p
;DDp q
CopyAccountEE 
(EE 
accountEE #
,EE# $
accountExistentEE% 4
)EE4 5
;EE5 6
returnFF 
accountFF 
.FF 
AccountNumberFF ,
;FF, -
}GG 
elseHH 
{II 
longKK 
maxKK 
=KK 
thisKK 
.KK  
AccountsKK  (
.KK( )
SelectKK) /
(KK/ 0
aKK0 1
=>KK2 4
aKK5 6
.KK6 7
AccountNumberKK7 D
)KKD E
.KKE F
MaxKKF I
(KKI J
)KKJ K
;KKK L
accountMM 
.MM 
AccountNumberMM %
=MM& '
maxMM( +
+MM, -
$numMM. /
;MM/ 0
thisNN 
.NN 
AccountsNN 
.NN 
AddNN !
(NN! "
accountNN" )
)NN) *
;NN* +
returnPP 
accountPP 
.PP 
AccountNumberPP ,
;PP, -
}QQ 
}RR 	
privateTT 
voidTT 
CopyAccountTT  
(TT  !
AccountModelTT! -
accountATT. 6
,TT6 7
AccountModelTT8 D
accountBTTE M
)TTM N
{UU 	
accountBVV 
.VV 
BalanceVV 
=VV 
accountAVV '
.VV' (
BalanceVV( /
;VV/ 0
}WW 	
}XX 
}YY Ã
uC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Infrastructure.Data\Repositories\CustomerRepository.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Infrastructure )
.) *
Data* .
.. /
Repositories/ ;
{ 
[		 #
ExcludeFromCodeCoverage		 
]		 
public

 

class

 
CustomerRepository

 #
:

$ %
ICustomerRepository

& 9
{ 
private 
List 
< 
CustomerModel "
>" #
	Customers$ -
;- .
public 
CustomerRepository !
(! "
)" #
{ 	
this 
. 
	Customers 
= 
new  
List! %
<% &
CustomerModel& 3
>3 4
(4 5
)5 6
;6 7
this 
. 
	Customers 
. 
Add 
( 
new "
CustomerModel# 0
(0 1
$num1 5
,5 6
$str7 =
,= >
$str? D
)D E
)E F
;F G
this 
. 
	Customers 
. 
Add 
( 
new "
CustomerModel# 0
(0 1
$num1 5
,5 6
$str7 ?
,? @
$strA H
)H I
)I J
;J K
this 
. 
	Customers 
. 
Add 
( 
new "
CustomerModel# 0
(0 1
$num1 5
,5 6
$str7 >
,> ?
$str@ J
)J K
)K L
;L M
} 	
public 
CustomerModel 
GetById $
($ %
long% )

customerId* 4
)4 5
{ 	
var 
	customers 
= 
from  
c! "
in# %
this& *
.* +
	Customers+ 4
where !
c" #
.# $

CustomerId$ .
==/ 1

customerId2 <
select "
c# $
;$ %
return!! 
	customers!! 
.!! 
First!! "
(!!" #
)!!# $
;!!$ %
}"" 	
}## 
}$$ ™ 
xC:\Development\Test\DemoBank\DemoBank.Account\DemoBank.Account.Infrastructure.Data\Repositories\TransactionRepository.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Infrastructure )
.) *
Data* .
.. /
Repositories/ ;
{		 
[

 #
ExcludeFromCodeCoverage

 
]

 
public 

class !
TransactionRepository &
:' ("
ITransactionRepository) ?
{ 
private 
List 
< 
TransactionModel %
>% &
Transactions' 3
;3 4
public !
TransactionRepository $
($ %
)% &
{ 	
this 
. 
Transactions 
= 
new  #
List$ (
<( )
TransactionModel) 9
>9 :
(: ;
); <
;< =
TransactionModel 
transaction (
=) *
new+ .
TransactionModel/ ?
(? @
)@ A
;A B
CustomerModel 
customer "
=# $
new% (
CustomerModel) 6
(6 7
$num7 ;
,; <
$str= C
,C D
$strE J
)J K
;K L
AccountModel 
destinationAccount +
=, -
new. 1
AccountModel2 >
(> ?
$num? C
,C D
customerE M
,M N
$numO P
)P Q
;Q R
transaction 
. 
DestinationAccount *
=+ ,
destinationAccount- ?
;? @
transaction 
. 
TransactionId %
=& '
$num( .
;. /
transaction 
. 
Value 
= 
$num  #
;# $
transaction 
. 
TransactionType '
=( )
TransactionTypes* :
.: ;
DEPOSIT; B
;B C
transaction 
. 
When 
= 
DateTime '
.' (
Now( +
;+ ,
this 
. 
Transactions 
. 
Add !
(! "
transaction" -
)- .
;. /
} 	
public%% 
TransactionModel%% 
[%%  
]%%  !*
GetTransactionsByAccountNumber%%" @
(%%@ A
long%%A E
accountNumber%%F S
)%%S T
{&& 	
var'' 
transactions'' 
='' 
from'' #
t''$ %
in''& (
this'') -
.''- .
Transactions''. :
where(( $
t((% &
.((& '
DestinationAccount((' 9
.((9 :
AccountNumber((: G
==((H J
accountNumber((K X
select)) %
t))& '
;))' (
return** 
transactions** 
.**  
ToArray**  '
(**' (
)**( )
;**) *
}++ 	
public22 
long22 
Save22 
(22 
TransactionModel22 )
transaction22* 5
)225 6
{33 	
long44 
newId44 
=44 
this44 
.44 
Transactions44 *
.44* +
Select44+ 1
(441 2
t442 3
=>444 6
t447 8
.448 9
TransactionId449 F
)44F G
.44G H
Max44H K
(44K L
)44L M
+44N O
$num44P Q
;44Q R
transaction55 
.55 
TransactionId55 %
=55& '
newId55( -
;55- .
this66 
.66 
Transactions66 
.66 
Add66 !
(66! "
transaction66" -
)66- .
;66. /
return88 
newId88 
;88 
}99 	
}:: 
};; 