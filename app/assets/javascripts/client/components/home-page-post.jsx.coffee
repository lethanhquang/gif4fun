'use strict'

define [
  'react'
], (React) ->

  # @author Quang Rau
  #
  # Home page component

  React.createClass
    displayName: 'HomePagePost'

    getInitialState: ->
      post: @props.post

    render: ->
      post = @state.post

      `<div>
        <div className="row row-post">
          <div className="col-md-6">
            <img src={post.url} className="img-responsive" />
          </div>
          <div className="col col-sm-6">
            <a href="#"><h3 className="title">{post.name}</h3></a>
            <div className="text-muted"><small>Aug 15 / By <a href="#">John Pierce</a></small></div>
            <ul className="stats">
              <li><i className="fa fa-eye"></i> 1,395</li>
              <li><i className="fa fa-star"></i> 1,395</li>
              <li><i className="fa fa-comments"></i> 356</li>
            </ul>
            <div className="tags">
              <span className="label label-default">#starwar</span>
              <span className="label label-default">#base ball</span>
              <span className="label label-default">#bomb</span>
            </div>
          </div>
        </div>
        <hr />
      </div>`
