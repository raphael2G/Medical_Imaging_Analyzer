import React, { useState, useContext, useRef, useEffect } from "react";
import {
  View,
  Reader,
  VolumeController,
  VolumeRepresentation,
  ShareDataSet,
  SliceRepresentation,
  Contexts,
} from "react-vtk-js";
import ControlBar from "../File/ControlBar";
import { useStateContext } from "../../context";
import SliceReader from "./slicereader";

function VolumeReturn(props) {
  const {
    files,
    viewref,
    selected,
    graphlist,
    selectedMap,
    volcontref,
    volumeview,
  } = useStateContext();
  const indexz = props.data;
  return (
    <VolumeRepresentation
      ref={(element) => {
        viewref.current[indexz] = element;
      }}
    >
      <div style={{ display: selected === indexz ? "flex" : "none" }}>
        {/* {graphlist[selectedMap].map((list, index) => (
          <div
            key={index}
            style={{
              display: selectedMap === index ? "flex" : "none",
            }}
          >
            <VolumeController
              ref={(element) => {
                volcontref.current[index] = element;
              }}
              key={index}
            />
          </div>
        ))} */}

        <VolumeController
          ref={(element) => {
            volcontref.current[indexz] = element;
          }}
        />
      </div>
      <Reader vtkClass="vtkXMLImageDataReader" url={files[indexz].uri} />
    </VolumeRepresentation>
  );
}

function TestReader() {
  const { files, volumeview, selected, updateViewAi, ViewAi } =
    useStateContext();

  useEffect(() => {
    console.log(volumeview);
  }, [volumeview]);

  return (
    <div
      style={{
        width: "100%",
        height: "100vh",
        display: "flex",
        flexDirection: "row-reverse",
      }}
    >
      <ControlBar />
      <div
        style={{
          width: "100%",
          height: "100vh",
        }}
      >
        {(files.length > 0) & !volumeview ? (
          <View
            id="0"
            background={[255, 255, 255]}
            cameraPosition={[1, 1, 0]}
            cameraViewUp={[0, 0, -1]}
            cameraParallelProjection={true}
            className="four"
          >
            {files.map((file, index) => (
              <VolumeReturn data={index} key={index}></VolumeReturn>
            ))}
          </View>
        ) : (
          <h1></h1>
        )}

        {(files.length > 0) & volumeview && <SliceReader />}
      </div>
    </div>
  );
}

export default TestReader;
