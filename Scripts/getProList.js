var datasetType = "XX";
var nextAddress;
//hvae to implement this method
var startingAddress = y.getHead(datasetType);
var ownerAddress;
var IP = "";
var datasetLocation = "";
var datasetDescription = "";
var URL = "";
var cost = 0;
var counter = 0;
var temp = "";
var length= 0;
var endAddress = 0x0000000000000000000000000000000000000000;
for(;startingAddress!=endAddress&&counter <3;){
  temp = y.getDatasetInfo("XX",startingAddress);
  length = temp.length;
  temp = temp + "";
  var arr = temp.split(",");
  console.log(arr[0]);
  console.log(arr[1]);
  console.log(arr[2]);
  console.log(arr[3]);
  console.log(arr[4]);
  console.log(arr[5]);
  console.log(arr[6]);
  startingAddress = y.getNextAddress("XX",startingAddress);
  counter ++;
}
