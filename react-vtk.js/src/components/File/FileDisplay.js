import React, { useEffect, useState } from "react";
import { useStateContext } from "../../context";
import { Typography, ListItem, List, Button } from "@mui/material";

function FileDisplay() {
  const { filenamelist, updateSelected, selected, volumeview } =
    useStateContext();

  return (
    <div style={{ width: "95%", margin: "0 auto" }}>
      <Typography fontSize={20} color={"#4ba5d6"}>
        Current Files
      </Typography>
      <div className="FileDisplayContainer">
        <List
          sx={{
            width: "100%",
            background: "black",
          }}
        >
          {filenamelist.map((file, index) => (
            <ListItem
              key={index}
              sx={{
                boxSizing: "border-box",
                width: "100%",
                padding: "5px 0px",
              }}
            >
              <Button
                onClick={() => {
                  if (volumeview && index === selected) {
                    console.log("nice");
                  } else {
                    updateSelected(index);
                  }
                }}
                sx={{ width: "100%" }}
                variant={selected === index ? "contained" : "outlined"}
              >
                {filenamelist[index]}
              </Button>
            </ListItem>
          ))}
        </List>
      </div>
    </div>
  );
}

export default FileDisplay;
