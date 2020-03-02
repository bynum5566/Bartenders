$('#imgPlace001').hide();
var urlinputPd1 = document.getElementById("imgPlace001");

var feedback = function(res) {
    if (res.success === true) {
//		$('#imgPlace001').name="na";
        var get_link = res.data.link.replace(/^http:\/\//i, 'https://');
        document.querySelector('.status1').innerHTML =
        	'<img class="img" alt="Imgur-Upload" src=\"' + get_link + '\"/>';
        urlinputPd1.value = get_link;
//            '<input id="realImg" name="pdImg" style="display:none;" class="image-url" value=\"' + get_link + '\"/>' + 
    }
};

new Imgur({
    clientid: 'ceb59faf76db10f', 
    callback: feedback
});