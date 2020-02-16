$('#imgPlace02').hide();

var feedback = function(res) {
    if (res.success === true) {
    	$('#imgPlace01').hide();
		$('#imgPlace02').name = "na";
        var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
        document.querySelector('.status1').innerHTML =
            '<input id="realImg" name="pdImg" style="display:none;" class="image-url" value=\"' + get_link + '\"/>' + '<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
    }
};

new Imgur({
    clientid: 'ceb59faf76db10f', 
    callback: feedback
});