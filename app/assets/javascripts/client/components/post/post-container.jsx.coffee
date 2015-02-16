'use strict'

define [
  'react'
], (React) ->

  # @author Quang Rau
  #
  # Post container component

  PostImageThumbnail = React.createClass
    displayName: 'PostImageThumbnail'

    render: ->
      `<div className="thumbnail">
        <img src={this.props.url} />
      </div>`

  PostImageOriginal = React.createClass
    displayName: 'PostImageOriginal'

    render: ->
      `<div className="thumbnail">
        <img src={this.props.url} />
      </div>`


  PostContainer = React.createClass
    displayName: 'PostContainer'

    getInitialState: ->
      isHover: false

    handleMouseOver: -> @setState isHover: true
    handleMouseOut: -> @setState isHover: false

    render: ->
      post = this.props.post

      switch post.image_content_type
        when 'image/gif'
          postImage = `<div className="post-container" onMouseOver={this.handleMouseOver} onMouseOut={this.handleMouseOut}>
                            <div className="overlay" />
                            { this.state.isHover ? <PostImageOriginal url={post.image} /> : <PostImageThumbnail url={post.thumbnail} /> }
                          </div>`
        else
          postImage = `<div className="post-container"><PostImageThumbnail url={post.thumbnail} /></div>`

      `<div className="col-md-6 col-sm-12">
        {postImage}
      </div>`

  # return
  PostContainer
