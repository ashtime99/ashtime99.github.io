<!-- none-select-br -->
<!--pjax：防止跳转页面音乐暂停-->
<script src="https://cdn.jsdelivr.net/npm/pjax@0.2.8/pjax.js"></script> 

<div class="hitokoto-title">
	<i class="fa fa-heart"></i>
	<b> music</b>
</div>

<!--qq音乐--> 
<div>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/aplayer@1.10.1/dist/APlayer.min.css">
    <script src="https://cdn.jsdelivr.net/npm/aplayer@1.10.1/dist/APlayer.min.js"></script>
    <!-- require MetingJS-->
    <script src="https://cdn.jsdelivr.net/npm/meting@1.2/dist/Meting.min.js"></script>   
    <div class="aplayer" 
      data-id="8145307420" 
      data-server="tencent" 
      data-type="playlist" 
      data-fixed="false" 
      data-autoplay="false" 
      data-list-folded="true"
      data-mutex="true"
      data-order="list" 
      data-volume="0.4" 
      data-theme="#FADFA3" 
      date-preload="auto" > 
    </div>
</div>

<!-- hitokoto -->
<div class="hitokoto-title">
	<i class="fa fa-paragraph"></i>
	<b> 一言</b>
</div>

<div id="hitokoto">:D 获取中...</div>
<i id="hitofrom">:D 获取中...</i>

<p></p>

<script src="https://cdn.jsdelivr.net/npm/bluebird@3/js/browser/bluebird.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/whatwg-fetch@2.0.3/fetch.min.js"></script>
<script>
  fetch('https://v1.hitokoto.cn')
    .then(function (res){
      return res.json();
    })
    .then(function (data) {
      var hitokoto = document.getElementById('hitokoto');
      hitokoto.innerText = '\xa0\xa0\xa0\xa0\xa0\xa0\xa0' + data.hitokoto;
      var hitofrom = document.getElementById('hitofrom');
      hitofrom.innerText = "——" + data.from + '\xa0'; 
    })
    .catch(function (err) {
      console.error(err);
    })
</script>