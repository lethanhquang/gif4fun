'use strict'

define [
  'react'
  'client/components/user'
  'client/components/search'
  'client/components/new-post'
], (React, User, Search, NewPost) ->

  # @author Quang Rau
  #
  # Navbar component

  LayoutNavbar = React.createClass
    displayName: 'LayoutNavbar'

    render: ->
      `<nav className="navbar navbar-static navbar-fixed-top">
        <div className="container">
          <div className="navbar-header">
            <a className="navbar-brand" href="/" target="ext"><b>Gif4Fun!</b></a>
            <a className="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span className="glyphicon glyphicon-chevron-down"></span>
            </a>
          </div>
          <div className="navbar-collapse collapse">
            <ul className="nav navbar-right navbar-nav">
              <Search />
              <NewPost />
              <User />
            </ul>
          </div>
        </div>
      </nav>`

  # return
  LayoutNavbar

