import { PureComponent } from 'react';
import { StoreContext } from '../utils/storeContext';

/*
  将state和dispatch中的actions绑定到组件的props中；
  从而简化在组件中使用redux的复杂度
*/
export function connect(mapStateToProps, mapDispatchToProps) {
  return function enhancedHOC(WrappedComponent) {
    class EnchancerComponent extends PureComponent {
      // eslint-disable-next-line no-useless-constructor
      constructor(props, context) {
        super(props, context);
        this.state = {
          storeState: mapStateToProps(context.getState()),
        };
      }

      componentDidMount() {
        this.describe = this.context.subscribe(() => {
          this.setState({
            storeState: mapStateToProps(this.context.getState()),
          });
        });
      }
      componentWillUnmount() {
        this.describe();
      }

      render() {
        return (
          <WrappedComponent
            {...this.props}
            {...mapStateToProps(this.context.getState())}
            {...mapDispatchToProps(this.context.dispatch)}
          />
        );
      }
    }
    EnchancerComponent.contextType = StoreContext;
    return EnchancerComponent;
  };
}
