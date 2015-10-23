do ->
	app = angular.module 'PressKit', ['ngAnimate']
	app.controller 'PressKitController', ['$scope','$http','$filter','$sce', ($scope,$http,$filter,$sce) ->
		$http.get('data/data.json').then (data) ->
			$.extend $scope, data.data

		$scope.thumbClick = (id,v) ->
			$scope[v] = id

		$scope.changeItem = (i,v,a) ->
			$scope[v] += i
			if $scope[v]<0 then $scope[v]=$scope[a].length-1
			if $scope[v]==$scope[a].length then $scope[v]=0

		$scope.safeHTML = (s) ->
			$sce.trustAsHtml s

		$scope.safeURL = (s) ->
			$sce.trustAsResourceUrl s

		$scope.menuClick = (path,bg) ->
			$scope.page = path
			$scope.pagebg = bg
			$scope.mobilemenu = false
			$scope.videoNum = -1
			$scope.galleryNum = -1
			$scope.castNum = 0
			$scope.prodNum = 0

		$scope
	]

	app