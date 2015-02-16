'use strict'

define [
  'react'
], (React) ->

  # @author Quang Rau
  #
  # Top Comment component

  TopComment = React.createClass
    displayName: 'TopComment'

    render: ->
      `<div className="top-comment">
        <h4><i className="glyphicon glyphicon-comment" /> Bình luận hay nhất</h4>
        <div className="comment">
          <div className="content">
            Hàn giang lạnh chiều cuối năm vắng vẻ
            Đà nẵng buồn vì sắp tiển anh đi
            Kính phục anh chúng tôi chẳng biết nói gì
            Mắt ngấn lệ tiếc thương người trung nghĩa
            Lòng bùi ngùi xúc động mãi khôn nguôi
          </div>
          <div className="row info">
            <div className="col-md-8 col-sm-8">
              <div className="media">
                <div className="pull-left">
                <a href="#"><img src="http://lorempixel.com/25/25" className="media-object avatar-rounded" /></a>
                </div>
                <div className="media-body">
                  <div className="media-heading">
                    <a href="#">Quang Râu</a>
                    <span> - 2 giờ trước</span>
                  </div>
                </div>
              </div>
            </div>
            <div className="col-md-4 col-sm-4">
              <ul className="stats">
                <li><a href="#" className="thumb-up"><i className="glyphicon glyphicon-thumbs-up" /> 1.535</a></li>
                <li><a href="#" className="thumb-down"><i className="glyphicon glyphicon-thumbs-down" /> 535</a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>`

  TopComment
