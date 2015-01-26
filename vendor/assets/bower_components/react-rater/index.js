;(function(root, factory) {
    if (typeof define === 'function' && define.amd) {
        define(['react'], factory)
    } else if (typeof exports === 'object') {
        module.exports = factory(require('react'))
    } else {
        root.Rater = factory(React)
    }
})(this, function(React) {
    var Star = React.createClass({displayName: 'Star',
        getDefaultProps: function () {
            return {
                isActive: false,
                isDisabled: false
            }
        },
        render: function () {
            var className = this.props.isActive? 'is-active': ''
            className += this.props.isDisabled? ' is-disabled': ''
            return (
                React.createElement("a", {className: className}, "★")
            )
        }
    })
    var Rater = React.createClass({displayName: 'Rater',
        getInitialState: function() {
            return {
                lastRating: this.props.rating,
                rating: this.props.rating
            }
        },
        getDefaultProps: function() {
            return {
                total: 5,
                rating: 0
            }
        },
        componentDidMount: function() {
            this.setState({
                rating: this.props.rating
            })
        },
        componentWillReceiveProps: function(nextProps) {
            this.setState({
                rating: nextProps.rating
            })
        },
        handleMouseEnter: function () {
            this.setState({
                rating: 0
            })
        },
        handleMouseLeave: function () {
            this.setState({
                rating: this.state.lastRating
            })
        },
        handleClick: function (e) {
            var star = e.target
              , allStars = Array.prototype.slice.call(e.currentTarget.childNodes, 0)
              , index = allStars.indexOf(star)
              , rating = this.props.total - index
              , limit = Number(this.props.limit)
              , lastRating = Number(this.state.lastRating)
              , callback = this.props.onRate
            if (star.getAttribute('class').indexOf('is-disabled') > -1) {
                return
            }
            limit = (this.props.limit === void 0)? this.props.total: limit
            rating = rating < limit? rating: limit
            rating = (rating === lastRating)? '0': rating
            this.setState({
                lastRating: rating,
                rating: rating
            })
            callback && callback(Number(rating), Number(lastRating))
        },
        render: function () {
            var total = Number(this.props.total)
              , limit = Number(this.props.limit)
              , rating = Number(this.state.rating)
              , nodes
            limit = (this.props.limit === void 0)? total: limit
            nodes = Array(total).join(',').split(',').map(function (_, i) {
                return (
                    React.createElement(Star, {
                        isActive:  (i >= total - rating) ? true: false, 
                        isDisabled:  (i < total - limit) ? true: false})
                )
            }.bind(this))
            return (
                React.createElement("div", {
                    className: "react-rater", 
                    onMouseEnter: this.handleMouseEnter, 
                    onMouseLeave: this.handleMouseLeave, 
                    onClick: this.handleClick}, nodes)
            )
        }
    })
    return Rater
})
