struct node{
   address addr; string next;
 }
 mapping(string => node) nodes;
 string head;
 uint  counter;

 //constructor
 function LLMapping() {
   head = 'root';
   nodes['root'].next = 'root';
   nodes['root'].addr = 0;
   counter = 0;
   //nodes[].next = 'shirish';
   //nodes[_name].addr = _addr;
 }

 //function for adding elements to linked list
 function add(string _name){
   nodes[_name].next = head;
   nodes[_name].addr = 3;
   head = _name;
   //counter++;
 }

function greet(string _name) constant returns (string,string,address,uint){
   return (head,nodes[_name].next,nodes[_name].addr,counter);
}
function stringsEqual(string _a, string _b) internal returns (bool) {
       //counter++;
   bytes memory a = bytes(_a);
   bytes  memory b = bytes(_b);
   if (a.length != b.length)
     return false;
   // @todo unroll this loop
   for (uint i = 0; i < a.length; i ++)
     if (a[i] != b[i])
       return false;
   return true;
 }



 //function for iteration

  function iterate() constant returns(uint){
   //uint count = 0;
   string memory name;
   //if(stringsEqual("shirish","shirish"))
    //   count = 6;
    //for(uint i=0;i<5;i++)
    //   counter++;
   for( name = head; !stringsEqual(name,'root');name = nodes[name].next){
     counter++;
   }
   return counter;
 }
