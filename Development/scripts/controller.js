!function(){var n;return n=angular.module("PressKit",["ngAnimate"]),n.controller("PressKitController",["$scope","$http","$filter","$sce","$timeout","$window",function(n,t,e,r,i,o){var u;return t.get("data/data.json").then(function(t){return $.extend(n,t.data),n.introTimeout()}),u=i,n.intronum=0,n.introClick=function(t){return 1===t?n.forward=!0:n.forward=!1,i(function(){return n.introTimeout(),n.intronum+=t,n.intronum<0&&(n.intronum=n.intro.length-1),n.intronum>=n.intro.length?n.intronum=0:void 0},1)},n.introTimeout=function(){return i.cancel(u),u=i(function(){return n.introClick(1)},7e3)},n.thumbClick=function(t,e){return t>n[e]?n.direction=!0:n.direction=!1,i(function(){return n[e]=t},1)},n.changeItem=function(t,e,r){return t>0?n.direction=!0:n.direction=!1,i(function(){return n[e]+=t,n[e]<0&&(n[e]=n[r].length-1),n[e]===n[r].length?n[e]=0:void 0},1)},n.safeHTML=function(n){return r.trustAsHtml(n)},n.safeURL=function(n){return r.trustAsResourceUrl(n)},n.menuClick=function(t,e){return n.page=t,n.pagebg=e,n.mobilemenu=!1,n.videoNum=-1,n.photoNum=-1,n.castNum=0,n.prodNum=0},(n.windowSize=function(){return n.contentHeight=o.innerHeight-Number($(".content").css("top").slice(0,-2))-$(".footer").height(),n.contentWidth=o.innerWidth})(),n.setQuoteHeight=function(n){return n/526*100+"%"},angular.element(o).bind("resize",function(){return n.windowSize(),n.$apply()}),n}]),n}();