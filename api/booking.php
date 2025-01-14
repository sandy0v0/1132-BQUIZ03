<style>
#info{
    width:540px;
    height:370px;
    margin:auto;
}
#movieInfo{
    width:540px;
    height:120px;
    margin:auto;
    background:#ccc;
    padding:10px 100px;
}

#info{
    background-image:url("icon/03D04.png");
    background-position:center;
    background-repeat:no-repeat;
    padding:19px 110px 14px 110px;
    display:flex;
    flex-wrap:wrap;
}
.seat{
    width:64px;
    height:85px;
    text-align: center;
    padding:2px;
    position:relative;
}

.null{
    background:url("icon/03D02.png") center no-repeat;
}
.booked{
    background:url("icon/03D03.png") center no-repeat;
}

.chk{
    position:absolute;
    right:2px;
    bottom:2px;
}

</style>
<?php  include_once "db.php";

$rows=$Order->all(['movie'=>$_GET['name'],'date'=>$_GET['date'],'session'=>$_GET['session']]);
// 所有陣列合併起來,存到最上面的$seats[]空陣列中

$seats=[];
foreach($rows as $row){
    $tmp=unserialize($row['seats']);
    $seats=array_merge($seats,$tmp);
}
//dd($seats);

// 推播 :ajax在訂票系統中(每兩秒),如果有人先勾選,就先跟資料庫要資料並顯示,已被勾選(增加用戶體驗)
?>

<div id="info">
    <?php 
        for($i=0;$i<20;$i++){
            // 如果有在陣列裡,代表被訂走了故class放在booked,否則放在null
            $booked=(in_array($i,$seats))?"booked":"null";
            echo "<div class='seat $booked'>";
            
            /* 以下是原始的寫法 
            if(in_array($i,$seats)){
                echo "<div class='seat booked'>";
            }else{
                echo "<div class='seat null'>";
            } 
            */

            echo  floor($i/5)+1 ."排".($i%5+1)."號";
            if(!in_array($i,$seats)){
                echo "<input type='checkbox' class='chk' value='$i'>";
            }
            echo "</div>";
        }
    ?>
</div>

<div id="movieInfo">
    <div>您選擇的電影是：<?=$_GET['name'];?></div>
    <div>您選擇的時刻是：<?=$_GET['date']."&nbsp;&nbsp;".$_GET['session'];?></div>
    <div>您已經勾選<span id='tickets'></span>張票，最多可以購買四張票</div>
    <div class='ct'>
        <button onclick="$('#booking,#order').toggle()">上一步</button>
        <button onclick="checkout()">訂購</button>
    </div>
</div>

<script>
let seats=new Array();
//let num={1:'一',2:'二',3:'三',4:'四'};  //如果想要把數字變國字,把這段打開

$(".chk").on("change",function(){
    // seats.push($(this).val());
    if($(this).prop('checked')){
        if(seats.length>3){
            alert("最多只能選四張票");
            // 並在他預計點選第五個勾時,將勾選狀態改為false,因為checked在function前就先執行了
            $(this).prop('checked',false)
        }else{
            seats.push($(this).val())
        }
    }else{
        seats.splice(seats.indexOf($(this).val()),1)
    }
    $("#tickets").text(seats.length)
    //$("#tickets").text(num[seats.length]) //如果想要把數字變國字,把這段打開
    //console.log(seats)

})

function checkout(){
    // 用這個(movie['seats']=seats;)才可以給值
    movie.seats=seats;
    //console.log(movie)
    $.post("api/checkout.php",movie,function(res){
        // console.log(res)
        $("#mm").html(res);
    })
}

</script>