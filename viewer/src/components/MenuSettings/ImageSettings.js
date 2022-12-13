import {
  Typography,
  List,
  ListItem,
  ListItemText,
  ListItemIcon,
  Switch,
  Button,
  Select,
  MenuItem,
  TextField,
} from "@mui/material";
import React, { useState, useEffect } from "react";
import { useStateContext } from "../../context";
import "./MenuSettings.css";
import { AiFillEye } from "react-icons/ai";

function ImageSettings() {
  const {
    selected,
    viewref,
    // graphlist,
    // updateSelectedMap,
    // volcontref,
    // selectedMap,
    updatefilelist,
    filenamelist,
  } = useStateContext();
  const Visibility = viewref.current[selected].volume.getVisibility();
  const [selectedVolumeVis, newSelectedVolumeVis] = useState(Visibility);

  useEffect(() => {
    newSelectedVolumeVis(viewref.current[selected].volume.getVisibility());
  }, [selected]);

  // useEffect(() => {
  //   volcontref.current[selectedMap].controller
  //     .getWidget()
  //     .invokeOpacityChange();
  // }, [selectedMap]);

  function changeVisibiltiy() {
    if (viewref.current[selected].volume.getVisibility()) {
      newSelectedVolumeVis(false);
      viewref.current[selected].volume.setVisibility(false);
    } else {
      newSelectedVolumeVis(true);
      viewref.current[selected].volume.setVisibility(true);
    }
    viewref.current[selected].view.renderView();
  }

  const [rename, updaterename] = useState(false);

  return (
    <div className="ImageSettings">
      <Typography fontSize={20} color={"#4ba5d6"}>
        File
      </Typography>
      {!rename ? (
        <div
          style={{
            width: "100%",
            display: "grid",
            gridTemplateColumns: "45% 45%",
            justifyContent: "space-around",
          }}
        >
          <Button
            onClick={() => updaterename(true)}
            variant="outlined"
            style={{ width: "100%" }}
          >
            Rename
          </Button>
          <Button variant="outlined" style={{ width: "100%" }}>
            Delete
          </Button>
        </div>
      ) : (
        <div style={{ width: "100%" }}>
          <input
            minLength={3}
            style={{
              width: "95%",
              marginLeft: "2.5%",
              height: "45px",
              background: "transparent",
              border: "1px solid rgb(25 118 210 / 50%)",
              borderRadius: "3px",
              marginTop: "10px",
              outline: "none",
              boxSizing: "border-box",
              paddingLeft: "9px",
              fontSize: "15px",
              color: "#1976d2",
            }}
            type={"text"}
          ></input>
          <div
            style={{
              display: "flex",
              flexDirection: "row",
              justifyContent: "space-between",
              width: "95%",
              margin: "auto",
              marginTop: "10px",
            }}
          >
            <Button
              onClick={() => updaterename(false)}
              variant="outlined"
              color="error"
              style={{ width: "40%" }}
            >
              Cancel
            </Button>
            <Button
              onClick={() => {
                updatefilelist(selected, "testing");
                console.log(filenamelist);
                updaterename(false);
              }}
              variant="outlined"
              color="success"
              style={{ width: "40%" }}
            >
              Rename
            </Button>
          </div>
        </div>
      )}

      <Typography fontSize={20} color={"#4ba5d6"}>
        Visibility
      </Typography>
      <List>
        <ListItem>
          <ListItemIcon>
            <AiFillEye color="white" />
          </ListItemIcon>
          <ListItemText
            style={{ color: "white" }}
            id="switch-list-label-bluetooth"
            primary="Image"
          />
          <Switch
            onChange={() => changeVisibiltiy()}
            checked={selectedVolumeVis}
          />
        </ListItem>
      </List>

      {/* <Typography fontSize={20} color={"#4ba5d6"}>
        Scalars
      </Typography> */}
      <div style={{ display: "grid", gridTemplateColumns: "auto auto" }}>
        {/* {graphlist[selected].map((list, index) => (
          <Button
            onClick={() => {
              updateSelectedMap(index);
              console.log(graphlist[selectedMap][index]);
            }}
            variant={index === selectedMap ? "contained" : "outlined"}
            key={index}
          >
            Scalar {index + 1}
          </Button>
        ))} */}
        {/* <Button
          onClick={() => {
            console.log(
              volcontref.current[selected].controller
                .getWidget()
                .getColorTransferFunction()
            );
            // console.log(
            //   volcontref.current[selected].controller
            //     .getWidget()
            //     .addGaussian(0.5, 1, 0.5, 0.5, 0.5)
            // );
          }}
        >
          Click Me
        </Button> */}
      </div>
    </div>
  );
}

export default ImageSettings;
