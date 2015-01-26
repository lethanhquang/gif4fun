'use strict'

define [
  'react'
  'client/components/layout/login-modal'
], (React, LoginModal) ->

  # @author Quang Rau
  #
  # Navbar component

  React.createClass
    displayName: 'LayoutNavbar'

    render: ->
      `<nav className="navbar navbar-static">
        <div className="container-fluid">
          <div className="navbar-header">
            <a className="navbar-brand" href="/" target="ext"><b>Gif4Fun!</b></a>
            <a className="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
              <span className="glyphicon glyphicon-chevron-down"></span>
            </a>
          </div>
          <div className="navbar-collapse collapse">
            <ul className="nav navbar-right navbar-nav">
              <li className="search-global">
                <div className="input-group">
                  <input type="text" className="form-control" placeholder="Search for..." />
                  <span className="input-group-btn">
                    <button className="btn btn-default" type="button">
                      <i className="glyphicon glyphicon-search"></i>
                    </button>
                  </span>
                </div>
              </li>
              <li>
                <LoginModal />
              </li>
            </ul>
          </div>
        </div>
      </nav>`

