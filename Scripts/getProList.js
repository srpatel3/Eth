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
  console.log("---------------------------------------------------\n");
  console.log("");
  console.log("IP               :"+arr[0]);
  console.log("Location :"+arr[1]);
  console.log("Description      :"+arr[2]);
  console.log("URL              :"+arr[3]);
  console.log("Cost             :"+arr[4]);
  console.log("Owner Address    :"+arr[5]);
  console.log("Dataset Feeds    :"+arr[6]);
  startingAddress = y.getNextAddress("XX",startingAddress);
  counter ++;
        console.log("");
}
