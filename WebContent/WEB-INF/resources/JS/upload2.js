$('#imgPlace04').hide();
var urlinput2 = document.getElementById("imgPlace04");

var feedback = function(res) {
    if (res.success === true) {
    	$('#imgPlace03').hide();
//		$('#imgPlace04').name = "na";
        var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
        document.querySelector('.status2').innerHTML =
        	'<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
        urlinput2.value = get_link;
//        	'<input name="cover2" style="display:none;" class="image-url" value=\"' + get_link + '\"/>' + 
    }
};

new Imgur({
    clientid: 'ceb59faf76db10f',
    callback: feedback
});