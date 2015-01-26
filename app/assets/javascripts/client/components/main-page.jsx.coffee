'use strict'

define [
  'react'
  'react-router'
  'client/components/layout/layout-navbar'
  'client/components/layout/layout-header'
  'client/components/layout/layout-footer'
  'client/components/left-panel'
], (React, Router, LayoutNavbar, LayoutHeader, LayoutFooter, LeftPanel) ->

  # @author Quang Rau
  #
  # Main page component

  React.createClass
    displayName: 'MainPage'

    render: ->
      `<div id="client-page">
        <LayoutNavbar />
        <LayoutHeader />
        <div className="container">
          <div className="no-gutter row">
            <LeftPanel />
            <div className="col-md-8">
              <Router.RouteHandler />
            </div>
          </div>
        </div>
        <LayoutFooter />
      </div>`

