window.CanvasSlideshow=function(e){function t(){o.rotation+=.001,w=requestAnimationFrame(t)}var a=this;(e=e||{}).stageWidth=e.hasOwnProperty("stageWidth")?e.stageWidth:1920,e.stageHeight=e.hasOwnProperty("stageHeight")?e.stageHeight:1080,e.pixiSprites=e.hasOwnProperty("sprites")?e.sprites:[],e.centerSprites=!!e.hasOwnProperty("centerSprites")&&e.centerSprites,e.texts=e.hasOwnProperty("texts")?e.texts:[],e.autoPlay=!e.hasOwnProperty("autoPlay")||e.autoPlay,e.autoPlaySpeed=e.hasOwnProperty("autoPlaySpeed")?e.autoPlaySpeed:[10,3],e.fullScreen=!e.hasOwnProperty("fullScreen")||e.fullScreen,e.displaceScale=e.hasOwnProperty("displaceScale")?e.displaceScale:[200,70],e.displacementImage=e.hasOwnProperty("displacementImage")?e.displacementImage:"",e.navElement=e.hasOwnProperty("navElement")?e.navElement:document.querySelectorAll(".scene-nav"),e.displaceAutoFit=!!e.hasOwnProperty("displaceAutoFit")&&e.displaceAutoFit,e.wacky=!!e.hasOwnProperty("wacky")&&e.wacky,e.interactive=!!e.hasOwnProperty("interactive")&&e.interactive,e.interactionEvent=e.hasOwnProperty("interactionEvent")?e.interactionEvent:"",e.displaceScaleTo=!1===e.autoPlay?[0,0]:[20,20],e.textColor=e.hasOwnProperty("textColor")?e.textColor:"#fff",e.displacementCenter=!!e.hasOwnProperty("displacementCenter")&&e.displacementCenter,e.dispatchPointerOver=!!e.hasOwnProperty("dispatchPointerOver")&&e.dispatchPointerOver;var n=new PIXI.autoDetectRenderer(e.stageWidth,e.stageHeight,{transparent:!0}),i=new PIXI.Container,r=new PIXI.Container,o=new PIXI.Sprite.fromImage(e.displacementImage),l=new PIXI.filters.DisplacementFilter(o),s=new PIXI.TextStyle({fill:e.textColor,wordWrap:!0,wordWrapWidth:400,letterSpacing:20,fontSize:20});if(this.currentIndex=0,this.initPixi=function(){document.body.appendChild(n.view),i.addChild(r),i.interactive=!0,console.log(n.view.style),!0===e.fullScreen?(n.view.style.objectFit="cover",n.view.style.width="100%",n.view.style.height="100%",n.view.style.top="50%",n.view.style.left="50%",n.view.style.webkitTransform="translate( -50%, -50% ) scale(1.2)",n.view.style.transform="translate( -50%, -50% ) scale(1.2)"):(n.view.style.maxWidth="100%",n.view.style.top="50%",n.view.style.left="50%",n.view.style.webkitTransform="translate( -50%, -50% )",n.view.style.transform="translate( -50%, -50% )"),o.texture.baseTexture.wrapMode=PIXI.WRAP_MODES.REPEAT,i.filters=[l],!1===e.autoPlay&&(l.scale.x=0,l.scale.y=0),!0===e.wacky&&(o.anchor.set(.5),o.x=n.width/2,o.y=n.height/2),o.scale.x=2,o.scale.y=2,l.autoFit=e.displaceAutoFit,i.addChild(o)},this.loadPixiSprites=function(t){for(var a=e.sprites,i=e.texts,o=0;o<a.length;o++){var l=new PIXI.Texture.fromImage(t[o]),c=new PIXI.Sprite(l);if(i){var d=new PIXI.Text(i[o],s);c.addChild(d),d.anchor.set(.5),d.x=c.width/2,d.y=c.height/2}!0===e.centerSprites&&(c.anchor.set(.5),c.x=n.width/2,c.y=n.height/2),0!==o&&TweenMax.set(c,{alpha:0}),r.addChild(c)}},!0===e.autoPlay){var c=new PIXI.ticker.Ticker;c.autoStart=e.autoPlay,c.add(function(t){o.x+=e.autoPlaySpeed[0]*t,o.y+=e.autoPlaySpeed[1],n.render(i)})}else{var d=new PIXI.ticker.Ticker;d.autoStart=!0,d.add(function(){n.render(i)})}var p=!1,h=r.children;this.moveSlider=function(t){p=!0;var n=new TimelineMax({onComplete:function(){a.currentIndex=t,p=!1,!0===e.wacky&&o.scale.set(1)},onUpdate:function(){!0===e.wacky&&(o.rotation+=.02*n.progress(),o.scale.set(3*n.progress()))}});n.clear(),n.isActive()||n.to(l.scale,1,{x:e.displaceScale[0],y:e.displaceScale[1]}).to(h[a.currentIndex],.5,{alpha:0}).to(h[t],.5,{alpha:1}).to(l.scale,1,{x:e.displaceScaleTo[0],y:e.displaceScaleTo[1]})};for(var w,y,u,x=e.navElement,v=0;v<x.length;v++)x[v].onclick=function(){return!p&&("next"===this.getAttribute("data-nav")?a.currentIndex>=0&&a.currentIndex<h.length-1?a.moveSlider(a.currentIndex+1):a.moveSlider(0):a.currentIndex>0&&a.currentIndex<h.length?a.moveSlider(a.currentIndex-1):a.moveSlider(spriteImages.length-1),!1)};this.init=function(){a.initPixi(),a.loadPixiSprites(e.pixiSprites)},!0===e.interactive&&(r.interactive=!0,r.buttonMode=!0,"hover"!==e.interactionEvent&&"both"!==e.interactionEvent||(r.pointerover=function(e){y=e.data.global.x,u=e.data.global.y,TweenMax.to(l.scale,1,{x:"+="+100*Math.sin(y),y:"+="+100*Math.cos(u)}),t()},r.pointerout=function(){TweenMax.to(l.scale,1,{x:0,y:0}),cancelAnimationFrame(w)}),"click"!==e.interactionEvent&&"both"!==e.interactionEvent||(r.pointerup=function(){!0===e.dispatchPointerOver?TweenMax.to(l.scale,1,{x:0,y:0,onComplete:function(){TweenMax.to(l.scale,1,{x:20,y:20})}}):(TweenMax.to(l.scale,1,{x:0,y:0}),cancelAnimationFrame(w))},r.pointerdown=function(e){y=e.data.global.x,u=e.data.global.y,TweenMax.to(l.scale,1,{x:"+="+1200*Math.sin(y),y:"+="+200*Math.cos(u)})},r.pointerout=function(){!0===e.dispatchPointerOver?TweenMax.to(l.scale,1,{x:0,y:0,onComplete:function(){TweenMax.to(l.scale,1,{x:20,y:20})}}):(TweenMax.to(l.scale,1,{x:0,y:0}),cancelAnimationFrame(w))})),!0===e.displacementCenter&&(o.anchor.set(.5),o.x=n.view.width/2,o.y=n.view.height/2),this.init()};