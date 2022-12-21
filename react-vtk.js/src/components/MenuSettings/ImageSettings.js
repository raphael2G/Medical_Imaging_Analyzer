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
  Slider,
  FormControl,
} from "@mui/material";
import React, { useState, useEffect } from "react";
import { useStateContext } from "../../context";
import "./MenuSettings.css";
import { AiFillEye } from "react-icons/ai";
import vtkColorMaps from "@kitware/vtk.js/Rendering/Core/ColorTransferFunction/ColorMaps.js";

function ImageSettings() {
  const {
    selected,
    viewref,
    // graphlist,
    // updateSelectedMap,
    // volcontref,
    // selectedMap,
    updateSelected,
    updatefilelist,
    filenamelist,
    volumeview,
    updateColorWindow,
    updateColorLevel,
    updateColorPreset,
    volcontref,
  } = useStateContext();

  const [selectedVolumeVis, newSelectedVolumeVis] = useState(true);

  const [userinput, updateuserinput] = useState();

  function GiveVisStatus() {
    return viewref.current[selected].volume.getVisibility();
  }

  useEffect(() => {
    const { results, error } = GiveVisStatus;
    if (error) console.log("this is an error!");
    console.log(results);
    newSelectedVolumeVis(results);
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
      <Button
        onClick={() =>
          console.log(volcontref.current[0].controller.getExpanded())
        }
      >
        Print volcontref
      </Button>

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
            marginTop: "10px",
            marginBottom: "10px",
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
              marginTop: "20px",
              outline: "none",
              boxSizing: "border-box",
              paddingLeft: "9px",
              fontSize: "15px",
              color: "#1976d2",
            }}
            onChange={(e) => updateuserinput(e.target.value)}
            type={"text"}
            defaultValue={filenamelist[selected]}
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
                var list = filenamelist;
                list[selected] = userinput;
                updatefilelist(list);
                console.log("name changed");
                console.log(filenamelist);
                updaterename(false);
                updateSelected(selected);
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

      {!volumeview && (
        <div>
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
        </div>
      )}

      {volumeview && (
        <div>
          <Typography fontSize={20} color={"#4ba5d6"}>
            Slice Settings
          </Typography>

          <List>
            <ListItem>
              <ListItemText
                style={{ color: "white" }}
                id="switch-list-label-bluetooth"
                primary="Color Level"
              />
              <Slider
                defaultValue={2095}
                max={4095}
                size="small"
                aria-label="default"
                valueLabelDisplay="auto"
                onChange={(e) => updateColorLevel(e.target.value)}
              />
            </ListItem>

            <ListItem>
              <ListItemText
                style={{ color: "white" }}
                id="switch-list-label-bluetooth"
                primary="Color Window"
              />
              <Slider
                defaultValue={2095}
                max={4095}
                size="small"
                aria-label="default"
                valueLabelDisplay="auto"
                onChange={(e) => updateColorWindow(e.target.value)}
              />
            </ListItem>

            <ListItem>
              <ListItemText
                style={{ color: "white" }}
                id="switch-list-label-bluetooth"
                primary="Color Window"
              />
              <FormControl fullWidth>
                <Select
                  defaultValue={32}
                  style={{ color: "#1976d2", border: "1px solid #1976d2" }}
                  onChange={(e) =>
                    updateColorPreset(
                      vtkColorMaps.rgbPresetNames[e.target.value]
                    )
                  }
                >
                  {vtkColorMaps.rgbPresetNames.map((index, item) => (
                    <MenuItem key={index} value={item}>
                      {index}
                    </MenuItem>
                  ))}
                </Select>
              </FormControl>
            </ListItem>
          </List>
        </div>
      )}

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
