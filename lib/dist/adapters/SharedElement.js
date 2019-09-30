"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const React = require("react");
const PropTypes = require("prop-types");
const react_native_1 = require("react-native");
class SharedElement extends React.Component {
    render() {
        return <RnnSharedElement {...this.props}/>;
    }
}
exports.SharedElement = SharedElement;
SharedElement.propTypes = {
    elementId: PropTypes.string.isRequired,
    resizeMode: PropTypes.string
};
SharedElement.defaultProps = {
    resizeMode: ''
};
const RnnSharedElement = react_native_1.requireNativeComponent('RNNElement', SharedElement, {
    nativeOnly: { nativeID: true }
});
