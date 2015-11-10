do ->
	app = angular.module 'PressKit', ['ngAnimate']
	app.controller 'PressKitController', ['$scope','$http','$filter','$sce','$timeout','$window', ($scope,$http,$filter,$sce,$timeout,$window) ->
		$http.get('data/data.json').then (data) ->
			$.extend $scope, data.data
			$scope.introTimeout()
			
		TO = $timeout
		$scope.intronum = 0
		$scope.introClick = (v) ->
			if v == 1 then $scope.forward = true else $scope.forward = false
			$timeout ->
				$scope.introTimeout()
				$scope.intronum += v
				if $scope.intronum < 0 then $scope.intronum = $scope.intro.length - 1
				if $scope.intronum >= $scope.intro.length then $scope.intronum = 0
			,1

		$scope.introTimeout = ->
			$timeout.cancel TO
			TO = $timeout ->
				$scope.introClick 1
			, 7000
			

		$scope.thumbClick = (i,v) ->
			if i>$scope[v] then $scope.direction = true else $scope.direction = false
			$timeout ->
				$scope[v] = i
			,1

		$scope.changeItem = (i,v,a) ->
			if i>0 then $scope.direction = true else $scope.direction = false
			$timeout ->
				$scope[v] += i
				if $scope[v]<0 then $scope[v]=$scope[a].length-1
				if $scope[v]==$scope[a].length then $scope[v]=0
			,1

		$scope.safeHTML = (s) ->
			$sce.trustAsHtml s

		$scope.safeURL = (s) ->
			$sce.trustAsResourceUrl s

		$scope.menuClick = (path,bg) ->
			$scope.page = path
			$scope.pagebg = bg
			$scope.mobilemenu = false
			$scope.videoNum = -1
			$scope.photoNum = -1
			$scope.castNum = 0
			$scope.prodNum = 0

		do $scope.windowSize = ->
			$scope.contentHeight = $window.innerHeight-Number( $('.content').css('top').slice(0,-2) )-$('.footer').height()
			$scope.contentWidth = $window.innerWidth

		$scope.setQuoteHeight = (h) ->
			h/526*100+'%'

		angular.element($window).bind 'resize', ->
			$scope.windowSize()
			$scope.$apply()

		$scope
	]

	app