var image = ee.Image('NOAA/VIIRS/001/VNP64A1/2018_12_01');
var visualization = {
  bands: ['Last_Day'],
  min: 250.0,
  max: 320.0,
  palette: [
    "#000080","#0000D9","#4000FF","#8000FF","#0080FF","#00FFFF",
    "#00FF80","#80FF00","#DAFF00","#FFFF00","#FFF500","#FFDA00",
    "#FFB000","#FFA400","#FF4F00","#FF2500","#FF0A00","#FF00FF",
  ]
};

Map.setCenter(-119.13, 38.32, 8);
Map.addLayer(image, visualization, "Last day");
