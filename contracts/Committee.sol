//SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.8.0;
import "./ERC20db.sol";

contract Committee{
    address payable ContractAddress = payable (address(this));
    address payable owner;
    uint AmountRequired;
    uint16 CounterCheck = 0;
    uint amountToBePaid;
    uint Next = 30 days;
    address payable Member;
    uint TotalMembers = 10;
    uint16 RewardCounter = 0;
    uint16 NextRoundCounter =0;
    address payable NextMembers;
    uint SecurityAmount = AmountRequired*2;
     constructor(){
        owner = payable(msg.sender);
    }
  ERC20Basic Erc20 =  ERC20Basic(owner);
       //struct for storing the Owner's information
    struct committeeOwner{
        address addressOfOwner;
        uint amountOwned;

    }

      //struct for storing the data of the members
    struct MembersData{
        address AddressofMembers;
        uint AmountReceived;
        bool check;
    }

      //array for MembersAddresses
    address payable[] MembersAddresses;

    //Struct for MembersDatas
    MembersData[] MemberStructArray;

    //array for SecurityAmount giving
    address payable[] SecurityGiven;

    //modifier for function participate
    modifier AmountCheck{
        require(amountToBePaid == AmountRequired);
        _;
    }

    //modifier for function timer
    modifier TimeOver{
        require(block.timestamp <= Next, "Next Round Start");
        _;
    }


    event NextRoundStart(
        address payable Winner,
        uint OnTime,
        uint RewardCounter
        );



      //mapping for checking if the address is present once or not
   mapping(address => bool) OnlyOnce;

   //mapping for security
   mapping(address => bool) Security;


   urityGiven.push(payable(msg.sender));
   }function ForSecurityPurpose() public payable {
       require(SecurityGiven.length <=  9);
        //checking if the address is present
        require(OnlyOnce[msg.sender]==true, "Not accessible again");

       Erc20.transferFrom(msg.sender, Erc20.SecurityAddress(), SecurityAmount);
       Security[msg.sender] = true;
       Sec


    //function for starting committee
    function StartingCommittee(uint _amount ) private {

        AmountRequired = _amount;
        require(_amount>0);

        //passing the parameters to the "committeeOwner" sruct
        committeeOwner(owner, _amount);

       //transferring the tokens to the contract address
       Erc20.transfer(ContractAddress, _amount);

        //calling function ViewAmount
        ViewAmount();

    }

     //function for viewing Amount Required to participate
    function ViewAmount() public view returns(uint){
        return AmountRequired;
    }

    //function for Participating
    function Participate(address payable addressOfYours) AmountCheck public {


        //checking if the address is present
         require(OnlyOnce[msg.sender]==true, "Not accessible again");


         //checking if security fee has been paid by the user
        require(Security[msg.sender]==true);

        //checking the numbers of Array
        require(MemberStructArray.length<=9);

        //transfering the tokens to the ContractAddress
        Erc20.transfer(ContractAddress, AmountRequired);

        //Adding the data in the Struct Array
       MemberStructArray.push(MembersData(addressOfYours,amountToBePaid,true));


        //Adding address in the MembersData Array
        MembersAddresses.push(addressOfYours);

    }

       //function for returning timeleft
    function getTimeLeftForNextRound() public TimeOver view returns(uint){
        return Next - block.timestamp;
    }

        //function for transferring Reward
    function transferReward() TimeOver public {

        require(RewardCounter >= 9);
        for( uint r = 0; r<=MembersAddresses.length; r++){
            MembersAddresses[r] = Member;
            Erc20.transfer(Member, ContractAddress.balance);

            emit NextRoundStart(Member, block.timestamp, RewardCounter);
            RewardCounter++;
            delete MembersAddresses[r];
            ApproveForNextRound();

        }
    }


    function ApproveForNextRound() TimeOver public{
      require (NextRoundCounter >= 8);
      require (OnlyOnce[msg.sender] == true);
        //transfering the tokens to the ContractAddress
        Erc20.transfer(ContractAddress, AmountRequired);
        transferReward();

    }

    function ReturnTheSecurityMoney() public payable returns(bool){
        require( NextRoundCounter == 8 && RewardCounter ==9);
        for(uint s = 0; s < SecurityGiven.length ; s++){

            Erc20.transfer(SecurityGiven[s], SecurityAmount);
            return true;
        }
    }
}


