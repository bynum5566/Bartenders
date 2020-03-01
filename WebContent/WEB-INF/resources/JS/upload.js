$('#imgPlace2').hide();
var urlinput = document.getElementById("imgPlace2");

var feedback = function(res) {
	if (res.success === true) {
		$('#imgPlace1').hide();
//		$('#imgPlace2').name = "na";
		var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
		document.querySelector('.status').innerHTML = 
			'<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
		urlinput.value = get_link;
//			'<input id="realImg" name="pdImg" style="display:none;" class="image-url" value=\"' + get_link + '\" readonly="readonly"/><br>'+ 
	}
};

new Imgur({
	clientid : 'ceb59faf76db10f',
	callback : feedback
});