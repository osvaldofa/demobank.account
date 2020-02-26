Ç
uC:\Development\Test\DemoBank\DemoBank.Account\demobank.account\DemoBank.Account.Data\Interfaces\IAccountRepository.cs
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
accountNumber" /
)/ 0
;0 1
} 
} Ç
vC:\Development\Test\DemoBank\DemoBank.Account\demobank.account\DemoBank.Account.Data\Interfaces\ICustomerRepository.cs
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
} ë
kC:\Development\Test\DemoBank\DemoBank.Account\demobank.account\DemoBank.Account.Data\Models\AccountModel.cs
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
} ²
lC:\Development\Test\DemoBank\DemoBank.Account\demobank.account\DemoBank.Account.Data\Models\CustomerModel.cs
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
} Ý
iC:\Development\Test\DemoBank\DemoBank.Account\demobank.account\DemoBank.Account.Data\Models\NewAccount.cs
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
} ô

oC:\Development\Test\DemoBank\DemoBank.Account\demobank.account\DemoBank.Account.Data\Models\TransactionModel.cs
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
class 
TransactionModel !
{ 
public		 
long		 
TransactionId		 !
{		" #
get		$ '
;		' (
set		) ,
;		, -
}		. /
public

 
AccountModel

 
DestinationAccount

 .
{

/ 0
get

1 4
;

4 5
set

6 9
;

9 :
}

; <
public 
AccountModel 
OriginAccount )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
double 
Value 
{ 
get !
;! "
set# &
;& '
}( )
public 
string 
TransactionType %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
DateTime 
When 
{ 
get "
;" #
set$ '
;' (
}) *
} 
} û-
vC:\Development\Test\DemoBank\DemoBank.Account\demobank.account\DemoBank.Account.Data\Repositories\AccountRepository.cs
	namespace 	
DemoBank
 
. 
Account 
. 
Infrastructure )
.) *
Data* .
.. /
Repositories/ ;
{ 
public 

class 
AccountRepository "
:# $
IAccountRepository% 7
{ 
private		 
List		 
<		 
AccountModel		 !
>		! "
Accounts		# +
;		+ ,
public 
AccountRepository  
(  !
)! "
{ 	
this 
. 
Accounts 
= 
new 
List  $
<$ %
AccountModel% 1
>1 2
(2 3
)3 4
;4 5
CustomerModel 
	customerA #
=$ %
new& )
CustomerModel* 7
(7 8
$num8 <
,< =
$str> D
,D E
$strF K
)K L
;L M
CustomerModel 
	customerB #
=$ %
new& )
CustomerModel* 7
(7 8
$num8 <
,< =
$str> F
,F G
$strH O
)O P
;P Q
CustomerModel 
	customerC #
=$ %
new& )
CustomerModel* 7
(7 8
$num8 <
,< =
$str> E
,E F
$strG P
)P Q
;Q R
this 
. 
Accounts 
. 
Add 
( 
new !
AccountModel" .
(. /
$num/ 3
,3 4
	customerA5 >
,> ?
$num@ E
)E F
)F G
;G H
this 
. 
Accounts 
. 
Add 
( 
new !
AccountModel" .
(. /
$num/ 3
,3 4
	customerB5 >
,> ?
$num@ G
)G H
)H I
;I J
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
	customerC5 >
,> ?
$num@ H
)H I
)I J
;J K
} 	
public!! 
AccountModel!! 
GetById!! #
(!!# $
long!!$ (
accountNumber!!) 6
)!!6 7
{"" 	
if## 
(## 
accountNumber## 
==##  
$num##! "
)##" #
return$$ 
null$$ 
;$$ 
else%% 
{&& 
var(( 
accounts(( 
=(( 
from(( #
a(($ %
in((& (
this(() -
.((- .
Accounts((. 6
where)) $
a))% &
.))& '
AccountNumber))' 4
==))5 7
accountNumber))8 E
select** %
a**& '
;**' (
if++ 
(++ 
accounts++ 
.++ 
ToList++ #
<++# $
AccountModel++$ 0
>++0 1
(++1 2
)++2 3
.++3 4
Count++4 9
==++: <
$num++= >
)++> ?
{,, 
return-- 
null-- 
;--  
}.. 
else// 
return00 
accounts00 #
?00# $
.00$ %
First00% *
(00* +
)00+ ,
;00, -
}11 
}22 	
public44 
long44 
Save44 
(44 
AccountModel44 %
account44& -
)44- .
{55 	
if77 
(77 
GetById77 
(77 
account77 
.77  
AccountNumber77  -
)77- .
!=77/ 1
null772 6
)776 7
{88 
AccountModel99 
accountExistent99 ,
=99- .
this99/ 3
.993 4
Accounts994 <
.99< =
Find99= A
(99A B
a99B C
=>99D F
a99G H
.99H I
AccountNumber99I V
==99W Y
account99Z a
.99a b
AccountNumber99b o
)99o p
;99p q
CopyAccount:: 
(:: 
account:: #
,::# $
accountExistent::% 4
)::4 5
;::5 6
return;; 
account;; 
.;; 
AccountNumber;; ,
;;;, -
}<< 
else== 
{>> 
long@@ 
max@@ 
=@@ 
this@@ 
.@@  
Accounts@@  (
.@@( )
Select@@) /
(@@/ 0
a@@0 1
=>@@2 4
a@@5 6
.@@6 7
AccountNumber@@7 D
)@@D E
.@@E F
Max@@F I
(@@I J
)@@J K
;@@K L
accountBB 
.BB 
AccountNumberBB %
=BB& '
maxBB( +
+BB, -
$numBB. /
;BB/ 0
thisCC 
.CC 
AccountsCC 
.CC 
AddCC !
(CC! "
accountCC" )
)CC) *
;CC* +
returnEE 
accountEE 
.EE 
AccountNumberEE ,
;EE, -
}FF 
}GG 	
privateII 
voidII 
CopyAccountII  
(II  !
AccountModelII! -
accountAII. 6
,II6 7
AccountModelII8 D
accountBIIE M
)IIM N
{JJ 	
accountBKK 
.KK 
BalanceKK 
=KK 
accountAKK '
.KK' (
BalanceKK( /
;KK/ 0
}LL 	
}MM 
}NN ‚
wC:\Development\Test\DemoBank\DemoBank.Account\demobank.account\DemoBank.Account.Data\Repositories\CustomerRepository.cs
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
CustomerRepository #
:$ %
ICustomerRepository& 9
{		 
private

 
List

 
<

 
CustomerModel

 "
>

" #
	Customers

$ -
;

- .
public 
CustomerRepository !
(! "
)" #
{ 	
this 
. 
	Customers 
= 
new  
List! %
<% &
CustomerModel& 3
>3 4
(4 5
)5 6
;6 7
this 
. 
	Customers 
. 
Add 
( 
new "
CustomerModel# 0
(0 1
$num1 5
,5 6
$str7 =
,= >
$str? D
)D E
)E F
;F G
this 
. 
	Customers 
. 
Add 
( 
new "
CustomerModel# 0
(0 1
$num1 5
,5 6
$str7 ?
,? @
$strA H
)H I
)I J
;J K
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
$str7 >
,> ?
$str@ J
)J K
)K L
;L M
} 	
public 
CustomerModel 
GetById $
($ %
long% )

customerId* 4
)4 5
{ 	
var 
	customers 
= 
from  
c! "
in# %
this& *
.* +
	Customers+ 4
where !
c" #
.# $

CustomerId$ .
==/ 1

customerId2 <
select "
c# $
;$ %
return 
	customers 
. 
First "
(" #
)# $
;$ %
}   	
}!! 
}"" 