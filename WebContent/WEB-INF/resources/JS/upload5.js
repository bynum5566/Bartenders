$('#imgPlace10').hide();
var urlinput5 = document.getElementById("imgPlace10");

var feedback = function(res) {
    if (res.success === true) {
    	$('#imgPlace09').hide();
//		$('#imgPlace10').name = "na";
        var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
        document.querySelector('.status5').innerHTML =
        	'<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
        urlinput5.value = get_link;
//        	'<input name="cover5" style="display:none;" class="image-url" value=\"' + get_link + '\"/>' + 
    }
};

new Imgur({
    clientid: 'ceb59faf76db10f',
    callback: feedback
});