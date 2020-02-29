$('#imgPlace08').hide();
var urlinput4 = document.getElementById("imgPlace08");

var feedback = function(res) {
    if (res.success === true) {
    	$('#imgPlace07').hide();
//		$('#imgPlace08').name = "na";
        var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
        document.querySelector('.status4').innerHTML =
        	'<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
        urlinput4.value = get_link;
//        	'<input name="cover4" style="display:none;" class="image-url" value=\"' + get_link + '\"/>' + 
    }
};

new Imgur({
    clientid: 'ceb59faf76db10f',
    callback: feedback
});