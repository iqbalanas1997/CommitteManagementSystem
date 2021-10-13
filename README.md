# Committee

<h1> PROJECT COMMITTEE </h1>

<h2> Data Types </h2>
The contract contains all the data types including variables, mappings, struct, events and modifier.

<h2> Import </h2>
Importing the Erc20 in the contract Committee through github url of Erc20.

<h2> function ForSecurityPurpose </h2>
<p> This function will make a call to the transfer function of imported ERC20 contract to transfer some amount to the given address of the contract to insure the security.


<h2> function StartingCommittee </h2>
<p> Verifying that the ForSecurityPurpose has been called, this function will start the committee contract.


<h2> function ViewAmount </h2>
<p> This function will return the amount required for starting and participating in the committee.


<h2> function Participate </h2>
<p> this function will take a parameter of address of the user and will check the amount required for participating in the contract.
<p> checking that the security function has been called in the security amount has been submitted, this function will transfer the amount required from the address of the user to contract address.
<p> and will transfer the data to the struct of MemberStructArray, and Members Address.


<h2> function getTimeLeftForNextRound </h2>
<p> this function will return the time left for starting the next round.


<h2> function transferReward </h2>
<p> This function will transfer the reward according to the list of array of the MembersAddresses one by one 
<p> and then we call the ApproveForNextRound function.


<h2> function ApproveForNextRound </h2>
<p> this function will use the transfer function of ERC20 and will transfer the amount required for starting the next round
<p> and then will call the function transferReward again.


<h2> functionReturnTheSecurityMoney </h2>
<p> once all the participants has been given the award then this function can be executed by any user
<p> and will return the security amount that the contract receive at the starting of this contract for security purpose.

