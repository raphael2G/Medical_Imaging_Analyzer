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
import { useStateContext } from "../../context";
import { Button, imageListClasses } from "@mui/material";
import { saveAs } from "file-saver";
import axios from "axios";
import myText from "./Text";

function DisableMouse() {
  const view = useContext(Contexts.ViewContext);
  const clicks = useRef(0);
  useEffect(() => {
    clicks.current = 0;
    view.interactor.onRightButtonPress(() => {
      // view.renderWindow.captureImages()[0].then((image) => {
      //   console.log(image);
      // });
      // console.log(view.renderer.getSize());
      // console.log(view.axesActor.getActors()[0].getXRange());
    });
    view.defaultStyle.setRotationFactor(0);
  }, [view]);
  return null;
}

function SliceReader() {
  const { files, selected, colorLevel, colorWindow, colorPreset, results } =
    useStateContext();
  const jSliceRef = useRef();
  const [camera, setCamera] = useState([0, -180, 0]);
  const [jSlice, setJSlice] = useState(0);

  const [useLookupTableScalarRange, setUseLookupTableScalarRange] =
    useState(false);
  const [imagelist, setImageList] = useState([]);

  return (
    <div style={{ height: "100vh", width: "100%" }}>
      <div
        style={{
          width: "350px",
          height: "50px",
          display: "flex",
          gap: "5px",
          position: "absolute",
          zIndex: 9999,
          marginLeft: "5px",
          marginTop: "5px",
        }}
      >
        <input
          style={{
            width: "300px",
          }}
          onChange={(e) => {
            // jSliceRef.current.renderWindow
            //   .captureImages([400, 400])[0]
            //   .then((image) => {
            //     setJSlice(e.target.value);
            //     setImageList((imagelist) => [...imagelist, image]);
            //   });
            console.log(e.target.value);
            setJSlice(e.target.value);
          }}
          type={"range"}
          max={275}
          min={0}
          step={0.01}
        ></input>
      </div>

      <div
        style={{
          position: "absolute",
          zIndex: 300,
          width: 250,
          height: 50,
          position: "absolute",
          left: 0,
          right: 0,
          marginRight: "auto",
          marginLeft: "auto",
          bottom: 10,
          backgroundColor: "black",
          borderRadius: 10,
          display: "flex",
          justifyContent: "space-evenly",
          alignContent: "center",
          fontSize: 9,
          color: "#1976d2",
          lineHeight: "50px",
        }}
      >
        <h1> Negative : {results[0].toFixed(2)} </h1>
        <h1> Positive : {results[1].toFixed(2)} </h1>
      </div>

      <View
        id="1"
        cameraPosition={camera}
        cameraViewUp={[0, 0, -1]}
        cameraParallelProjection={true}
        background={[32, 40, 4]}
        className="two"
        ref={jSliceRef}
      >
        <ShareDataSet>
          <Reader vtkClass="vtkXMLImageDataReader" url={files[selected].uri} />
        </ShareDataSet>

        <SliceRepresentation
          jSlice={jSlice}
          property={{
            colorWindow,
            colorLevel,
            useLookupTableScalarRange,
          }}
          cameraParallelProjection={false}
          colorMapPreset={colorPreset}
        >
          <ShareDataSet />
          <DisableMouse />
        </SliceRepresentation>
      </View>
    </div>
  );
}

export default SliceReader;
