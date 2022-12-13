import React from "react";
import TestReader from "./reader/testReader";
import SliceReader from "./reader/slicereader";
import { useStateContext } from "../context";

function Layout() {
  const { volumeview } = useStateContext();
  return (
    <div className="layout">
      {!volumeview ? <TestReader /> : <SliceReader />}
    </div>
  );
}

export default Layout;
