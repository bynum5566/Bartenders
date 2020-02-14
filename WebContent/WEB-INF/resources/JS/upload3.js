var feedback = function(res) {
    if (res.success === true) {
    	$('#imgPlace05').hide();
		$('#imgPlace06').name = "na";
        var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
//        document.querySelector('.status3').classList.add('bg-success');
        document.querySelector('.status3').innerHTML =
        	'<input name="cover3" style="display:none;" class="image-url" value=\"' + get_link + '\"/>' + '<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
    }
};

new Imgur({
    clientid: '4409588f10776f7', //You can change this ClientID
    callback: feedback
});