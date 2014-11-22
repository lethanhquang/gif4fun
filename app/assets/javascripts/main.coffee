require [
  "angular"
  "hammerjs"
  "angular-ui-router"
  "angular-animate"
  "angular-aria"
  "angular-material"
  "loader/loader"
], (angular, Hammer) ->
  "use strict"

  window.Hammer = Hammer
  require ["angular-material"], ->
    #App Module
    angular.element(document).ready ->

      #smart works go here
      $html = angular.element("html")
      angular.module("myApp", [
        "ui.router"
        "ngAnimate"
        "ngAria"
        "ngMaterial"
        "loader"
      ]).config ["$urlRouterProvider", "$provide", ($urlRouterProvider, $provide) ->
        $urlRouterProvider.otherwise "/"

        # change configure to use [[ to be the interpolation ([[2 + 2]])

        #$interpolateProvider.startSymbol('[[');
        #$interpolateProvider.endSymbol(']]');

        # add safeApply function for $rootScope - called by $scope.$root.safeApply(fn)
        $provide.decorator "$rootScope", ["$delegate", ($delegate) ->
          $delegate.safeApply = (fn) ->
            phase = $delegate.$$phase
            if phase is "$apply" or phase is "$digest"
              fn() if fn and typeof fn is "function"
            else
              $delegate.$apply fn
            return

          return $delegate
        ]
      ]

      #bootstrap model
      angular.bootstrap $html, ["myApp"]
