const { component, stack } = require('../commons/Layouts');
const SideMenuLeft = 'SideMenuLeft';
const SideMenuCenter = 'SideMenuCenter';
const SideMenuRight = 'SideMenuRight';
const StatusBarOptions = 'StatusBarOptions';
const StatusBarFirstTab = 'StatusBarFirstTab'

module.exports = {
  ExternalComponent: 'ExternalComponent',
  ContextScreen: 'ContextScreen',
  Pushed: 'Pushed',
  Layouts: 'Layouts',
  Options: 'Options',
  Stack: 'Stack',
  Modal: 'Modal',
  FullScreenModal: 'FullScreenModal',
  SetRoot: 'SetRoot',
  Overlay: 'Overlay',
  OverlayAlert: 'OverlayAlert',
  ScrollViewOverlay: 'ScrollViewOverlay',
  Lifecycle: 'Lifecycle',
  BackHandler: 'BackHandler',
  BottomTabs: 'BottomTabs',
  FirstBottomTabsScreen: 'FirstBottomTabsScreen',
  SecondBottomTabsScreen: 'SecondBottomTabsScreen',
  Navigation: 'Navigation',
  NativeScreen: 'RNNCustomComponent',
  RoundButton: 'CustomRoundedButton',
  LifecycleButton: 'LifecycleButton',
  ReactTitleView: 'ReactTitleView',
  EventsScreen: 'EventsScreen',
  EventsOverlay: 'EventsOverlay',
  SideMenuLeft,
  SideMenuCenter,
  SideMenuRight,
  SideMenu: {
    sideMenu: {
      left: component(SideMenuLeft),
      center: component(SideMenuCenter)
    }
  },
  StatusBar: {
    sideMenu: {
      left: component(SideMenuLeft,
        {
          statusBar: {
            drawBehind: true,
            translucent: true
          }
        },
        { marginTop: 20 }),
      center: stack(StatusBarOptions),
      right: component(SideMenuRight)
    }
  },
  StatusBarBottomTabs: {
    bottomTabs: {
      id: 'StatusBarBottomTabs',
      children: [
        {
          sideMenu: {
            options: {
              bottomTab: {
                text: 'Tab1',
                icon: require('../../img/layouts.png')
              }
            },
            left: component(SideMenuLeft),
            center: stack(component(StatusBarFirstTab, {
              statusBar: {
                translucent: true,
                drawBehind: true,
              },
              topBar: {
                drawBehind: true,
                elevation: 0,
                background: {
                  color: 'transparent'
                }
              }
            }))
          }
        },
        {
          component: {
            id: "Pushed.tab2",
            name: 'Pushed',
            options: {
              bottomTab: {
                text: 'Tab2',
                icon: require('../../img/layouts.png')
              }
            }
          }
        }
      ]
    }
  },
  StatusBarOptions,
  StatusBarFirstTab,
  TopBarBackground: 'TopBarBackground',
  FlatListScreen: 'FlatListScreen',
  Alert: 'Alert',
  Orientation: 'Orientation',
  OrientationDetect: 'OrientationDetect',
  Search: 'Search'
}
