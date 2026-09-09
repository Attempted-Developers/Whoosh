fetch("./xml/releases.xml")
  .then((response) => {
    if (!response.ok) {
      throw new Error(`Failed to load XML: ${response.status}`);
    }
    return response.text();
  })
  .then((data) => {
    const parser = new DOMParser();
    const xml = parser.parseFromString(data, "text/xml");
    const releaseNodes = xml.getElementsByTagName("release");
    const tableBody = document.getElementById("displayXML");

    if (!tableBody) {
      console.error("The #displayXML element was not found.");
      return;
    }

    for (let i = 0; i < releaseNodes.length; i++) {
      const release = releaseNodes[i];
      const refName = release.getElementsByTagName("refName")[0]?.textContent?.trim() || "-";
      const platform = release.getElementsByTagName("platform")[0]?.textContent?.trim() || "-";
      const version = release.getElementsByTagName("version")[0]?.textContent?.trim() || "-";
      const link = release.getElementsByTagName("link")[0]?.textContent?.trim() || "#";

      const row = `
        <tr>
          <td><a href="${link}">${refName}</a></td>
          <td>${platform}</td>
          <td>${version}</td>
        </tr>
      `;

      tableBody.insertAdjacentHTML("beforeend", row);
    }
  })
  .catch((error) => {
    console.error(error);
  });