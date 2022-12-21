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
    let formData = new formData();
    formData.append("file", file);
    fetch("/upload/image", { method: "POST", body: formData });
  }
  function SendtoApi(file) {
    const formData2 = new FormData();
    formData2.append("file", file);

    const requestOptions = {
      method: "POST",

      //headers: { 'Content-Type': 'multipart/form-data' }, // DO NOT INCLUDE HEADERS
      body: formData2,
    };
    fetch("http://127.0.0.1:8000/classify/", requestOptions)
      .then(function (response) {
        return response.json();
      })
      .then(function (data) {
        console.log(data);
        setResults(data);
      });
  }

  return (
    <div>
      <FileUploader
        handleChange={(file) => {
          GetUri(file);
          SendtoApi(file);
        }}
        children={<FileDrop />}
      />
    </div>
  );
}

export default FileUpload;
