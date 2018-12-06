export declare class Store {
    private componentsByName;
    private propsById;
    setPropsForId(componentId: string, props: any): void;
    getPropsForId(componentId: string): any;
    setComponentClassForName(componentName: string | number, ComponentClass: any): void;
    getComponentClassForName(componentName: string | number): any;
    cleanId(id: string): void;
}
