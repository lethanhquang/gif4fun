'use strict'

define [
  'react'
], (React) ->

  # @author Quang Rau
  #
  # Layout Footer component

  React.createClass
    displayName: 'LayoutFooter'

    render: ->
      `<footer>
        <div className="container">
          <div className="row">
            <div className="col-md-12 text-right"><h5>©Gif4Fun 2015</h5></div>
          </div>
        </div>
      </footer>`

