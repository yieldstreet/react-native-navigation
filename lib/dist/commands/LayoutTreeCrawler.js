"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const _ = require("lodash");
const LayoutType_1 = require("./LayoutType");
class LayoutTreeCrawler {
    constructor(store, optionsProcessor) {
        this.store = store;
        this.optionsProcessor = optionsProcessor;
        this.crawl = this.crawl.bind(this);
    }
    crawl(node) {
        if (node.type === LayoutType_1.LayoutType.Component) {
            this.handleComponent(node);
        }
        this.optionsProcessor.processOptions(node.data.options);
        node.children.forEach(this.crawl);
    }
    handleComponent(node) {
        this.assertComponentDataName(node);
        this.savePropsToStore(node);
        this.applyStaticOptions(node);
        node.data.passProps = undefined;
    }
    savePropsToStore(node) {
        this.store.setPropsForId(node.id, node.data.passProps);
    }
    isComponentWithOptions(component) {
        return component.options !== undefined;
    }
    staticOptionsIfPossible(node) {
        const foundReactGenerator = this.store.getComponentClassForName(node.data.name);
        const reactComponent = foundReactGenerator ? foundReactGenerator() : undefined;
        return reactComponent && this.isComponentWithOptions(reactComponent)
            ? reactComponent.options(node.data.passProps || {})
            : {};
    }
    applyStaticOptions(node) {
        node.data.options = _.merge({}, this.staticOptionsIfPossible(node), node.data.options);
    }
    assertComponentDataName(component) {
        if (!component.data.name) {
            throw new Error('Missing component data.name');
        }
    }
}
exports.LayoutTreeCrawler = LayoutTreeCrawler;
