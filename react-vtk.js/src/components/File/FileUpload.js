import React from "react";
import { FileUploader } from "react-drag-drop-files";
import { Typography } from "@mui/material";
import { useStateContext } from "../../context";
import "./Menu.css";
import "./FileDrop.css";
function FileDrop() {
  return (
    <div className="FileDropComponen">
      <Typography color={"white"}>Drag and Drop Files here</Typography>
    </div>
  );
}

function FileUpload() {
  const { updateFiles, updateFileNameList } = useStateContext();

  function GetUri(file) {
    let reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function () {
      console.log(file.name);
      updateFiles({ uri: reader.result, name: file.name });
      updateFileNameList(file.name);
    };
    reader.onerror = function () {
      console.log(reader.error);
    };




  }

  return (
    <div>
      <FileUploader
        handleChange={(file) => GetUri(file)}
        children={<FileDrop />}
      />
    </div>
  );
}

export default FileUpload;
