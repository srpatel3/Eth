var s_dbname;
var s_add;
var s_name;
var s_ip;
var s_account;
addSeller("shirish","shirish Patel","12.23.23.3",45);
addSeller("shirish","patel shirish","123.123.123.3",90);
function addSeller(dbname , address, sname, ip, acc){

	s_dbname = dbname;
	s_name = sname;
	s_add = address;
	s_ip = ip;
	s_account = acc;
	var trans_First = x.addToNodes(s_dbname,s_add);
	console.log(trans_First);
	var trans_Second = x.addOtherData(s_dbname,s_add,s_name,s_ip,s_account);
	console.log(trans_Second);
}

