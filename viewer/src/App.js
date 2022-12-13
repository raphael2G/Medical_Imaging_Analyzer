import "./App.css";

import Layout from "./components/Layout";
import { StateContext } from "./context";

function App() {
  return (
    <StateContext>
      <Layout></Layout>
    </StateContext>
  );
}

export default App;
