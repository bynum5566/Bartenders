	var modal = document.getElementById("myModal");
	var btn = document.getElementById("myBtn");
	var span = document.getElementsByClassName("close")[0];
	btn.onclick = function() {
		modal.style.display = "block";
	}
	
	span.onclick = function() {
		modal.style.display = "none";
	}
	
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
		}
	}
	
	var acc = document.getElementsByClassName("accordion");
	var i;
	
	for (i = 0; i < acc.length; i++) {
		acc[i].addEventListener("click", function() {
			this.classList.toggle("active");
			var panel = this.nextElementSibling;
			if (panel.style.maxHeight) {
				panel.style.maxHeight = null;
			} else {
				panel.style.maxHeight = panel.scrollHeight + "px";
			}
		});
	}
	
	$(".flip").click(function() {
		$(this).closest("div").siblings().slideToggle("slow");
	});
	
	var images = [ "${myBarX.coverUrl1}", "${myBarX.coverUrl2}",
			"${myBarX.coverUrl3}", "${myBarX.coverUrl4}", "${myBarX.coverUrl5}" ];
	var num = 0;
	
	function nex() {
		var slider = document.getElementById("slider");
		num++;
		if (num >= images.length) {
			num = 0;
		}
		slider.src = images[num];
	}
	
	function prev() {
		var slider = document.getElementById("slider");
		num--;
		if (num < 0) {
			num = images.length - 1;
		}
		slider.src = images[num];
	}
	
	var P = document.getElementById("slider");
	var t = setInterval(changeP, 5000);
	
	function choose1(obj, oEvent) {
		var e = oEvent || window.event;
		var target = e.target || e.srcElement;
		var pArrays = obj.getElementsByTagName("img");
		slider.src = images[0];
		window.clearInterval(t);
	}
	function choose2(obj, oEvent) {
		var e = oEvent || window.event;
		var target = e.target || e.srcElement;
		var pArrays = obj.getElementsByTagName("img");
		slider.src = images[1];
		window.clearInterval(t);
	}
	function choose3(obj, oEvent) {
		var e = oEvent || window.event;
		var target = e.target || e.srcElement;
		var pArrays = obj.getElementsByTagName("img");
		slider.src = images[2];
		window.clearInterval(t);
	}
	function choose4(obj, oEvent) {
		var e = oEvent || window.event;
		var target = e.target || e.srcElement;
		var pArrays = obj.getElementsByTagName("img");
		slider.src = images[3];
		window.clearInterval(t);
	}
	function choose5(obj, oEvent) {
		var e = oEvent || window.event;
		var target = e.target || e.srcElement;
		var pArrays = obj.getElementsByTagName("img");
		slider.src = images[4];
		window.clearInterval(t);
	}
	function chooseout() {
		t = setInterval(changeP, 5000);
	}
	
	function changeP() {
		num++;
		if (num >= images.length) {
			num = 0;
		}
		slider.src = images[num];
	}
	
	let flag;
	flag2 = true;
	function pl() {
		if (flag2) {
			flag2 = false;
			window.clearInterval(t);
		} else {
			flag2 = true;
			t = setInterval(changeP, 5000);
		}
	}