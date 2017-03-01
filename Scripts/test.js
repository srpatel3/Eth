var typo = 'shirish'; //THIS WILL BE THE NAME OF DATASET THAT YOU WANT INFORMATION
var typo1 = "patel";  //SAME AS ABOVE JUST WITH DIFFERENT NAME
var head = x.getHead(typo1);
var _tempAddress;
//var typo = "";
var Address = "";
var Name="";
var Account="";
var IPA="";
var Comp = 1;
//var _temp = "";
//	for(var i = 0;Comp!=0;i++){
		var _temp = x.getInfo(typo1,head)+"";
		array_Temp = _temp.split(",");
		head = array_Temp[0];
		var length = head.length;
		Comp = head.slice(length-1,length)
		Address = array_Temp[1];
		//typo = array_Temp[2]
		Name = array_Temp[3];
		IPA = array_Temp[4];
		Account = array_Temp[5];
		console.log(Address , typo , Name , IPA , Account , head);

//	}

//console.log(array_Address);
