"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const _ = require("lodash");
class Store {
    constructor() {
        this.componentsByName = {};
        this.propsById = {};
    }
    setPropsForId(componentId, props) {
        _.set(this.propsById, componentId, props);
    }
    getPropsForId(componentId) {
        return _.get(this.propsById, componentId, {});
    }
    setComponentClassForName(componentName, ComponentClass) {
        _.set(this.componentsByName, componentName.toString(), ComponentClass);
    }
    getComponentClassForName(componentName) {
        return _.get(this.componentsByName, componentName.toString());
    }
    cleanId(id) {
        _.unset(this.propsById, id);
    }
}
exports.Store = Store;
