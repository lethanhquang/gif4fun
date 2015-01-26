'use strict'

require [
  'jquery'
  'modernizr'
  'bootstrap'
  'jquery_ujs'
  'client/index'
], ($) ->

  # loading
  $(document).ready ->
    ($ '.dropdown').dropdown
    ($ '.animsition-loading').fadeOut(-> ($ this).remove())

