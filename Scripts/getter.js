var Head = y.getTypeHead();
var tempCurrent="";
var tempAddress="";
var next="";
var arr="";
var length="";
var temp="";
var t_Current="";
var t_Address="";
var type = "";
for(;next!='root';){
	temp = y.getType(Head);
	length = temp.lenght;
	temp = temp +  "";
	arr = temp.split(",");
	type = arr[0];
	next = arr[1];
	console.log(type);
	//tempAddress = arr[2];
	Head = next;
	//t_Current = t_Current + tempCurrent + ";";
	//t_Address = t_Address + tempAddress;
}
//var arr_Current = t_Current.split(";");
//console.log(arr_Current);
//console.log(t_Current);
