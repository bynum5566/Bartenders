$('#imgPlace06').hide();
var urlinputPd33 = document.getElementById("imgPlace06");

var feedback = function(res) {
    if (res.success === true) {
    	$('#imgPlace05').hide();
//		$('#imgPlace06').name = "na";
        var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
        document.querySelector('.status3').innerHTML =
        	'<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
        urlinputPd33.value = get_link;
//        	'<input id="realImg3" name="pdImg3" style="display:none;" class="image-url" value=\"' + get_link + '\"/>' + 
    }
};

new Imgur({
    clientid: 'ceb59faf76db10f', 
    callback: feedback
});