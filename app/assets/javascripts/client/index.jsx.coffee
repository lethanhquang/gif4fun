'use strict'

define [
  'react'
  'react-router'
  'client/loader'
], (React, Router, Loader) ->

  # export React to window environment
  window.React = React unless window.React

  routes =
    `<Router.Route name='main_page' path='/' handler={Loader.MainPage}>
      <Router.DefaultRoute handler={Loader.HomePage} />
    </Router.Route>`

  Router.run(routes, Router.HashLocation, (Handler) ->
    React.render React.createFactory(Handler)(), document.getElementById('routing-component')
  )
