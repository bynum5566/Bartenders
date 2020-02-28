$('#imgPlace003').hide();

var feedback = function(res) {
    if (res.success === true) {
		$('#imgPlace003').name="na";
        var get_link = res.data.link.replace(/^http:\/\//i, 'https://').replace(',','');
        document.querySelector('.status3').innerHTML =
        	'<input id="realImg3" name="pdImg3" style="display:none;" class="image-url" value=\"' + get_link + '\"/>' + '<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
    }
};

new Imgur({
    clientid: 'ceb59faf76db10f', 
    callback: feedback
});