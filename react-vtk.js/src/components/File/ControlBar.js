import { React, useState } from "react";
import { Button } from "@mui/material";
import FileUpload from "./FileUpload";
import FileDisplay from "./FileDisplay";
import ImageSettings from "../MenuSettings/ImageSettings";
import { useStateContext } from "../../context";
function ControlBar() {
  const [ControlBarWidth, setControlBarWidth] = useState(true);
  const { selected, updateVolumeView, volumeview, updateViewAi } =
    useStateContext();

  return ControlBarWidth ? (
    <div id="menbarContainer" className="MenuBarContainer">
      <Button
        style={{ width: "95%", margin: "0 auto" }}
        onClick={() => {
          setControlBarWidth(false);
        }}
        variant={"contained"}
      >
        Close Menu
      </Button>
      <FileUpload />
      <FileDisplay />
      {selected != null ? (
        <Button
          onClick={() => {
            updateVolumeView();
          }}
          variant="contained"
          style={{ width: "95%", margin: "0 auto" }}
        >
          {volumeview ? "on " : "off"}
        </Button>
      ) : (
        <></>
      )}

      {selected !== null ? <ImageSettings /> : <div></div>}
    </div>
  ) : (
    <div
      style={{ position: "absolute", zIndex: 100, top: "10px", right: "5px" }}
    >
      <Button
        style={{ width: "150px", height: "40px" }}
        onClick={() => setControlBarWidth(true)}
        variant="contained"
      >
        Open Menu
      </Button>
    </div>
  );
}

export default ControlBar;
