import React, { useState, useEffect } from "react";
import { Tooltip as ReactTooltip } from "react-tooltip";
import myPrincipal from "../../constants/userid";
import "react-tooltip/dist/react-tooltip.css";
import "./Avatar.css";

export default function Avatar(props) {
  return (
    <>
      <img
        data-tip
        data-for={props.a + "loot"}
        src={"ava-" + props.i + ".png"}
        style={{ height: "28px" }}
      />
      <ReactTooltip
        className="tooltipchecks"
        id={props.a + "loot"}
        place="bottom"
        effect="solid"
      >
        {"Anon-" + props.a} {myPrincipal == props.a ? "(You)" : null}
      </ReactTooltip>
    </>
  );
}
