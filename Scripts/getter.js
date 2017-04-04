var Head = y.getHead();
var tempCurrent="";
var tempAddress="";
var next="";
var arr="";
var length="";
var temp="";
var t_Current="";
var t_Address="";
for(;next!='root';){
	temp = y.getNodes(Head);
	length = temp.lenght;
	temp = temp +  "";
	arr = temp.split(",");
	next = arr[0];
	tempCurrent = arr[1];
	tempAddress = arr[2];
	Head = next;
	t_Current = t_Current + tempCurrent + ";";
	t_Address = t_Address + tempAddress;
}
var arr_Current = t_Current.split(";");
console.log(arr_Current);
//console.log(t_Current);
