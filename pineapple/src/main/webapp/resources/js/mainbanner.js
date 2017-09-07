/**
 * 메인화면배너
 */

function banner(){
		var tl1 = new TimelineMax();
	    tl1.to('#myAd_head', 2, { opacity: 1})
	      .to('#myAd_txt1', 1.3, { top: 70, ease: Power2.easeOut })
	      .to('#myAd_txt2', 1.3, { top: 120, ease: Power2.easeOut}, '-=.5')
	      .to('#myAd_txt3', 1.3, { top: 170, ease: Power2.easeOut}, '-=.5')
	      .to('#myAd_head', 1, { opacity: 0})
	      .to('#myAd_txt3', 1.3, { top: 500, ease: Power2.easeOut}, '+=2')
	      .to('#myAd_txt2', 1.3, { top: 550, ease: Power2.easeOut}, '-=.5')
	      .to('#myAd_txt1', 1.3, { top: 650, ease: Power2.easeOut}, '-=.5')
	}