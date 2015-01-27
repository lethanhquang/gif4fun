'use strict'

define [
  'react'
  'client/stores/post-store'
], (React, PostStore) ->

  # @author Quang Rau
  #
  # Home page component

  React.createClass
    displayName: 'HomePage'

    getInitialState: ->
      posts: PostStore.getPosts()

    render: ->
      posts = _(@state.posts).map((post)->
        return (
          `<div>
            <div className="row row-post">
              <div className="col-md-6">
                <img src={post.url} className="img-responsive" />
              </div>
              <div className="col col-sm-6">
                <a href="#"><h3 className="title">{post.name}</h3></a>
                <div className="text-muted"><small>Aug 15 / By <a href="#">John Pierce</a></small></div>
                <ul className="stats">
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
        )
      )

      `<div className="panel">
        <div className="panel-heading">Top Stories</div>
        <div className="panel-body" id="top-stories">
          {posts}
          <div className="well text-center">
            <h1>Centered Text</h1>
            This was a 2.x challenge that seems a little easier in 3.
            <div>
              <i className="glyphicon glyphicon-4x glyphicon-camera"></i>
              <i className="glyphicon glyphicon-4x glyphicon-camera"></i>
              <i className="glyphicon glyphicon-4x glyphicon-camera"></i>
            </div>
          </div>
        </div>
      </div>`
