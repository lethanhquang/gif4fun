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

          <p>"Mobile first" and "unobtrusive JavaScript" (AKA: "progressive enhancement") are strategies for when a new site design is being considered. These are related concepts that predated RWD: browsers of basic mobile phones do not understand JavaScript or media queries, so the recommended practice is to create a basic web site then enhance it for smart phones and PCs—rather than try "graceful degradation" to make a complex, image-heavy site work on the most basic mobile phones.</p>
          <p>Media Queries is a CSS3 module allowing content rendering to adapt to conditions such as screen resolution (e.g. smartphone vs. high definition screen). It became a W3C recommended standard in June 2012.[1] and is a cornerstone technology of Responsive Web Design.</p>
          <hr />
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
