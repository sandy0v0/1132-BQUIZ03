<?php include_once "db.php";
$id=$_GET['movie'];
$row=$Movie->find($id);
// 日期轉成秒 strtotime；今天的也需要
$ondate=strtotime($row['ondate']);
$today=strtotime(date("Y-m-d"));
// 但起始日期不一定是從第一天開始算,所以要扣掉(開始的時間-今天的時間)
// passDay=差值的時間(今天-上映)
$passDay=floor(($today-$ondate)/(60*60*24));


// 上映日三天內,所以最多跑三次
for($i=$passDay;$i<3;$i++){
    $date=date("Y-m-d",strtotime("+$i days",$ondate));
    echo "<option value='$date'>";
    // echo $passDay.$date;
    echo $date;
    echo "</option>";
}

