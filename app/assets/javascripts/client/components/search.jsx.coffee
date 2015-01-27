'use strict'

define [
  'react'
  'react-router'
  'react-bootstrap'
], (React, Router, ReactBootstrap) ->

  React.createClass
    displayName: 'Search'

    render: ->
      `<li className="search-global">
        <div className="input-group">
          <input type="text" className="form-control" placeholder="Search for..." />
          <span className="input-group-btn">
            <button className="btn btn-default" type="button">
              <i className="glyphicon glyphicon-search"></i>
            </button>
          </span>
        </div>
      </li>`
