$('#imgPlace02').hide();
var urlinputPd11 = document.getElementById("imgPlace02");

var feedback = function(res) {
    if (res.success === true) {
    	$('#imgPlace01').hide();
//		$('#imgPlace02').name = "na";
        var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
        document.querySelector('.status1').innerHTML =
        	'<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
        urlinputPd11.value = get_link;
//            '<input id="realImg" name="pdImg" style="display:none;" class="image-url" value=\"' + get_link + '\"/>' + 
    }
};

new Imgur({
    clientid: 'ceb59faf76db10f', 
    callback: feedback
});