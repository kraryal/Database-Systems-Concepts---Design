

function showFields() {
      var applianceType = document.getElementById('applianceType').value;
      var specificFields = document.getElementById('specificFields');

      // Clear previous fields
      specificFields.innerHTML = "";

      if (applianceType === "AirHandler") {
        specificFields.innerHTML = `
          <div class="form-group">
            <input type="number" name="fanRPM2"  class="form-control" id="fanRPM" required placeholder="Enter Fan Rotation per Min">
          </div>
          <div class="form-group">
<!--            <label for="heatingMethod">Select Heating Method:</label>-->
            <select  name="heatingMethod" class="form-control" id="heatingMethod" required>
                <option> </option>
              <option value="HeatPump">Heat Pump</option>
              <option value="AirConditioner">Air Conditioner</option>
              <option value="Heater">Heater</option>
            </select>
          </div>
          <div id="heatingMethodFields"></div>
        `;

        document.getElementById('heatingMethod').addEventListener('change', showHeatingMethodFields);
      } else if (applianceType === "WaterHeater") {
        specificFields.innerHTML = `
          <div class="form-group">
            <input type="number" name="tank_size"  class="form-control" id="tankSize" required placeholder="Enter tank size in gallons">
          </div>
          <div class="form-group">
            <input type="number"  name="current_temp_setting" class="form-control" id="currentTemp" required placeholder="Enter temperature settings">
          </div>
          <div class="form-group">
            <label for="energySource">Select Energy Source:</label>
            <select  name="energy_source" class="form-control" id="energySource" required>
              <option value=""></option>
              <option value="1">Electric</option>
              <option value="2">Gas</option>
              <option value="3">Fuel Oil</option>
              <option value="4">Heat Pump</option>
            </select>
          </div>
        `;
      }

      // Show specific fields section
      specificFields.style.display = "block";
    }

    function showHeatingMethodFields() {
      var heatingMethod = document.getElementById('heatingMethod').value;
      var heatingMethodFields = document.getElementById('heatingMethodFields');

      // Clear previous fields
      heatingMethodFields.innerHTML = "";

      if (heatingMethod === "AirConditioner") {
        heatingMethodFields.innerHTML = `
          <div class="form-group">
            <input type="number" name="eer" step="0.1" class="form-control" id="eer" placeholder="Enter ERR" required>
          </div>
        `;
      } else if (heatingMethod === "Heater") {
        heatingMethodFields.innerHTML = `
          <div class="form-group">
            <label for="energySourceHeater">Select Energy Source:</label>
            <select name="energySourceHeater" class="form-control" id="energySourceHeater" required>
              <option value=""></option>
              <option value="1">Electric</option>
              <option value="2">Gas</option>
              <option value="3">Fuel Oil</option>
            </select>
          </div>
        `;
      } else if (heatingMethod === "HeatPump") {
        heatingMethodFields.innerHTML = `
          <div class="form-group">
            <input type="number step=0.1" name="seer"  class="form-control" id="seer" placeholder="Enter SEER value" required>
          </div>
          <div class="form-group">
            <input type="number step=0.1" name="hspf" class="form-control" id="hspf" placeholder="Enter HSPF value" required>
          </div>
        `;
      }
    }

    document.getElementById('applianceForm').addEventListener('submit', function(event) {
      event.preventDefault(); // Prevent form submission

      // Retrieve values from the form
      var applianceType = document.getElementById('applianceType').value;
      var manufacturer = document.getElementById('manufacturer').value;
      var modelName = document.getElementById('modelName').value;
      var btu = document.getElementById('btu').value;

      var applianceData = {
        type: applianceType,
        manufacturer: manufacturer,
        modelName: modelName,
        btu: btu
      };

      if (applianceType === "AirHandler") {
        applianceData.fanRPM = document.getElementById('fanRPM').value;
        applianceData.heatingMethod = document.getElementById('heatingMethod').value;

        if (applianceData.heatingMethod === "AirConditioner") { //airconditioner
          applianceData.eer = document.getElementById('eer').value;
        } else if (applianceData.heatingMethod === "Heater") { //heater
          applianceData.energySource = document.getElementById('energySourceHeater').value;
        } else if (applianceData.heatingMethod === "HeatPump") { //heatpump
          applianceData.seer = document.getElementById('seer').value;
          applianceData.hspf = document.getElementById('hspf').value;
        }
      } else if (applianceType === "WaterHeater") {
        applianceData.tankSize = document.getElementById('tankSize').value;
        applianceData.temperature = document.getElementById('currentTemp').value;
        applianceData.currentTemp = document.getElementById('currentTemp').value;
        console.log(" this is temp", applianceData.temperature);
        applianceData.energySource = document.getElementById('energySource').value;
      }

      // Send the applianceData object to the server for database persistence
      console.log(applianceData);

      // You can use AJAX or fetch to send the data to the server and handle the database persistence.
      // sendData(applianceData)
       var xhr = new XMLHttpRequest();
        xhr.open('POST', '/add_appliance', true); // Replace '/endpoint' with the appropriate Flask route
        xhr.setRequestHeader('Content-Type', 'application/json');
        xhr.onreadystatechange = function() {
          if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
              console.log('Object successfully passed to Flask');
              // window.location.href = response.redirect;
            } else {
              console.error('Failed to pass object to Flask');
            }
          }
        };
        xhr.send(JSON.stringify(applianceData));

      // // Reset the form
      // document.getElementById('applianceForm').reset();
      // document.getElementById('specificFields').style.display = "none";
      window.location.href = '/appliance_listings';
    });
