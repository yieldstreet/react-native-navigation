"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const react_native_1 = require("react-native");
class ComponentRegistry {
    constructor(store, componentEventsObserver, ComponentWrapperClass) {
        this.store = store;
        this.componentEventsObserver = componentEventsObserver;
        this.ComponentWrapperClass = ComponentWrapperClass;
    }
    registerComponent(componentName, getComponentClassFunc, ReduxProvider, reduxStore) {
        const NavigationComponent = () => {
            return this.ComponentWrapperClass.wrap(componentName.toString(), getComponentClassFunc, this.store, this.componentEventsObserver, ReduxProvider, reduxStore);
        };
        this.store.setComponentClassForName(componentName.toString(), NavigationComponent);
        react_native_1.AppRegistry.registerComponent(componentName.toString(), NavigationComponent);
        return NavigationComponent;
    }
}
exports.ComponentRegistry = ComponentRegistry;
