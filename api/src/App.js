import { configureStore } from './redux/store'
import { Provider } from 'react-redux'
import Api from './Api'
import services from './services';

function App() {
  return (
    <Provider store={configureStore(services)}>
      <Api />
    </Provider>
  );
}

export default App;
