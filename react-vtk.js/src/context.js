import React, { createContext, useContext, useState, useRef } from "react";

const Context = createContext();

export const StateContext = ({ children }) => {
  const [files, setNewFiles] = useState([]);
  const [selected, setSelected] = useState(null);
  const viewref = useRef([]);
  const volcontref = useRef([]);
  const volconpointref = useRef([]);
  const [selectedMap, setSelectedMap] = useState(0);
  const [graphlist, setGraphList] = useState([
    [1, 2, 3],
    [1, 2, 3],
  ]);
  const [filenamelist, setfilenamelist] = useState([]);
  const [updated, setupdated] = useState();
  const [volumeview, setvolumeview] = useState(false);
  const [viewAi, setVewAi] = useState(false);
  const [selectedCam, setSelectedCam] = useState(1);
  const [colorWindow, setColorWindow] = useState(2095);
  const [colorLevel, setColorLevel] = useState(1000);
  const [colorPreset, setColorPreset] = useState("Grayscale");
  const [results, setResults] = useState([0, 0]);

  const updateColorWindow = (n) => {
    setColorWindow(n);
  };

  const updateColorLevel = (n) => {
    setColorLevel(n);
  };

  const updateColorPreset = (n) => {
    setColorPreset(n);
  };

  const updateSelectedCam = (n) => {
    setSelectedCam(n);
  };

  const updatefilelist = (list) => {
    setfilenamelist(list);
  };

  const updateViewAi = () => {
    if (viewAi) setVewAi(false);
    else setVewAi(true);
  };

  const updateVolumeView = () => {
    if (volumeview) setvolumeview(false);
    else setvolumeview(true);
  };

  const updateFiles = (fileuri, filename) => {
    setNewFiles((files) => [...files, fileuri]);
    setGraphList((graphlist) => [...graphlist, [1, 2, 3]]);
  };

  const updateFileNameList = (name) => {
    setfilenamelist((filenamelist) => [...filenamelist, name]);
  };

  const updateSelected = (index) => {
    if (selected === index) {
      setSelected(null);
      setSelectedMap(index);
    } else setSelected(index);
  };

  const updateGraphList = (item) => {
    setGraphList((graphlist) => [...graphlist, item]);
  };

  const updateSelectedMap = (index) => {
    setSelectedMap(index);
  };

  const addtoMap = (index) => {
    graphlist[index].push(1);
  };

  return (
    <Context.Provider
      value={{
        selected,
        files,
        viewref,
        volcontref,
        volconpointref,
        selectedMap,
        graphlist,
        filenamelist,
        updateFiles,
        updateSelected,
        updateGraphList,
        updateSelectedMap,
        addtoMap,
        setfilenamelist,
        updated,
        updatefilelist,
        updateVolumeView,
        volumeview,
        updateFileNameList,
        updateViewAi,
        viewAi,
        updateSelectedCam,
        selectedCam,
        updateColorWindow,
        updateColorLevel,
        updateColorPreset,
        colorLevel,
        colorPreset,
        colorWindow,
        results,
        setResults,
      }}
    >
      {children}
    </Context.Provider>
  );
};

export const useStateContext = () => useContext(Context);
