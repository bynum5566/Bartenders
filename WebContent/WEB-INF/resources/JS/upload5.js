var feedback = function(res) {
    if (res.success === true) {
    	$('#imgPlace09').hide();
		$('#imgPlace10').name = "na";
        var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
//        document.querySelector('.status5').classList.add('bg-success');
        document.querySelector('.status5').innerHTML =
        	'<input name="cover5" style="display:none;" class="image-url" value=\"' + get_link + '\"/>' + '<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
    }
};

new Imgur({
    clientid: '4409588f10776f7', //You can change this ClientID
    callback: feedback
});