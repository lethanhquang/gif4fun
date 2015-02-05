'use strict'

define [
  'react'
  'react-router'
  'react-bootstrap'
  'client/actions/app-actions'
  'client/stores/user-store'
  'client/components/new-post/tab-image'
], (React, Router, ReactBootstrap, AppActions, UserStore, TabImage) ->

  # @author Quang Râu
  #
  # User component

  React.createClass
    displayName: 'NewPostTabs'

    mixins: [UserStore.Mixins]
    render: ->
      return `<span />` unless @state.user

      `<ReactBootstrap.TabbedArea defaultActiveKey={1}>
        <ReactBootstrap.TabPane eventKey={1} tab="Image/Gif">
          <TabImage />
        </ReactBootstrap.TabPane>
        <ReactBootstrap.TabPane eventKey={2} tab="Video">
          Tab video here!
        </ReactBootstrap.TabPane>
      </ReactBootstrap.TabbedArea>`
