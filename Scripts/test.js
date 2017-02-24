var typo = 'shirish';
var typo1 = "patel";
//var head = x.getHead(typo);
var head = "0x000000000000000000000000000000000000000a";
//var head = 9;
var _tempAddress;
//var typo = "";
var Address = "";
var Name="";
var Account="";
var IPA="";
var Comp = 9;
//var _temp = "";
	for(var i = 0;Comp!=0;i++){
		var _temp = x.getInfo(typo,head)+"";
		array_Temp = _temp.split(",");
		head = array_Temp[0];
		var length = head.length;
		Comp = head.slice(length-1,length)
		Address = array_Temp[1];
		//typo = array_Temp[2]
		Name = array_Temp[3];
		IPA = array_Temp[4];
		Account = array_Temp[5];
		console.log(Address , typo , Name , IPA , Account);

	}

//console.log(array_Address);
