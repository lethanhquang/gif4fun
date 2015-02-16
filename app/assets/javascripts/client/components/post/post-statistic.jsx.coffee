'use strict'

define [
  'react'
  'client/components/comment/top-comment'
], (React, TopComment) ->

  # @author Quang Rau
  #
  # Post statistic component

  PostStatistic = React.createClass
    displayName: 'PostStatistic'

    render: ->
      `<div className="col-md-6 col-sm-12">
        <a href={"/post/" + this.props.postId }>
          <h3 className="title">{this.props.title}</h3>
        </a>
        <div className="text-muted">
          <small>Aug 15 / By <a href="#">{this.props.author}</a></small>
        </div>
        <ul className="stats">
          <li><i className="fa fa-eye"></i> 1,395</li>
          <li><i className="fa fa-star"></i> 1,395</li>
          <li><i className="fa fa-comments"></i> 356</li>
        </ul>
        <TopComment />
      </div>`

  PostStatistic
