/**
 * author: oldj
 * blog: http://oldj.net
 */


window.onload=function(){
             heat1();heat2();heat3();heat4();
            }

function heat1 () {
	var w = 200, h = 200;
	var hm = new HeatMap(document.getElementById("test-canvas1"), w, h);

	function loop() {

		hm.addData([[
			Math.floor(Math.random() * 80+50),
			Math.floor(Math.random() * 2+10),
			Math.floor(Math.random() * 10)
		]]);
		hm.addData([[
			Math.floor(120+Math.random() * 2),
			Math.floor(Math.random() * 60+10),
			Math.floor(Math.random() * 10)
		]]);
		hm.addData([[
			Math.floor(Math.random() * 80+50),
			Math.floor(Math.random() * 2+70),
			Math.floor(Math.random() * 10)
		]]);
		
		hm.addData([[
			Math.floor(60+Math.random() * 2),
			Math.floor(Math.random() * 60+70),
			Math.floor(Math.random() * 10)
		]]);
		
		hm.addData([[
			Math.floor(Math.random() * 80+50),
			Math.floor(Math.random() * 2+140),
			Math.floor(Math.random() * 10)
		]]);
		
		hm.render();

		setTimeout(loop, 50);
	}

	loop();
}

function heat2() {
	var w = 200, h = 200;
	var hm = new HeatMap(document.getElementById("test-canvas2"), w, h);

	function loop() {

		hm.addData([[
			Math.floor(Math.random() * 80+50),
			Math.floor(Math.random() * 2+10),
			Math.floor(Math.random() * 10)
		]]);
		hm.addData([[
			Math.floor(60+Math.random() * 2),
			Math.floor(Math.random() * 120+10),
			Math.floor(Math.random() * 10)
		]]);
			hm.addData([[
			Math.floor(120+Math.random() * 2),
			Math.floor(Math.random() * 120+10),
			Math.floor(Math.random() * 10)
		]]);
		
		hm.addData([[
			Math.floor(Math.random() * 80+50),
			Math.floor(Math.random() * 2+140),
			Math.floor(Math.random() * 10)
		]]);
		
		
		hm.render();

		setTimeout(loop, 50);
	}

	loop();
}

function heat3() {
	var w = 200, h = 200;
	var hm = new HeatMap(document.getElementById("test-canvas3"), w, h);

	function loop() {

		hm.addData([[
			Math.floor(100+Math.random() * 4),
			Math.floor(Math.random() * 140+10),
			Math.floor(Math.random() * 10)
		]]);
		hm.render();

		setTimeout(loop, 50);
	}

	loop();
}

function heat4() {
	var w = 200, h = 200;
	var hm = new HeatMap(document.getElementById("test-canvas4"), w, h);

	function loop() {
	
	hm.addData([[
			Math.floor(120+Math.random() * 4),
			Math.floor(Math.random() * 70+10),
			Math.floor(Math.random() * 20)
		]]);
		hm.addData([[
			Math.floor(120+Math.random() * 4),
			Math.floor(Math.random() * 70+80),
			Math.floor(Math.random() * 20)
		]]);
        hm.addData([[
			Math.floor(60+Math.random() * 2),
			Math.floor(Math.random() * 80+10),
			Math.floor(Math.random() * 10)
		]]);
		hm.addData([[
			Math.floor(Math.random() * 60+60),
			Math.floor(Math.random() * 2+80),
			Math.floor(Math.random() * 10)
		]]);
				
		hm.render();

		setTimeout(loop, 50);
	}

	loop();
}
