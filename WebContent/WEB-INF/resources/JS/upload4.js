$('#imgPlace08').hide();

var feedback = function(res) {
    if (res.success === true) {
    	$('#imgPlace07').hide();
		$('#imgPlace08').name = "na";
        var get_link = res.data.link.replace(/^http:\/\//i, 'https://').replace(',','');
        document.querySelector('.status4').innerHTML =
        	'<input name="cover4" style="display:none;" class="image-url" value=\"' + get_link + '\"/>' + '<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
    }
};

new Imgur({
    clientid: 'ceb59faf76db10f',
    callback: feedback
});