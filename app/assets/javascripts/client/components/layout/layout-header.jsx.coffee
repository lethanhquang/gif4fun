'use strict'

define [
  'react'
], (React) ->

  # @author Quang Rau
  #
  # Layout Header component

  React.createClass
    displayName: 'LayoutHeader'

    render: ->
      `<header className="masthead">
        <div className="container">
          <div className="row">
            <div className="col-md-6">
              <h1>
                <a href="#" title="Scroll down for your viewing pleasure">Bootable Template</a>
                <p className="lead">3-column Theme + Layout for Bootstrap 3.</p>
              </h1>
            </div>
            <div className="col-md-6">
              <div className="well pull-right">
                <img src="//placehold.it/280x100/E7E7E7" />
              </div>
            </div>
          </div>
        </div>
      </header>`
