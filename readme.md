# swiss-geodata-2018

## Source

[Office Fédéral de la Statistique](https://www.bfs.admin.ch/bfs/fr/home/services/geostat/geodonnees-statistique-federale/limites-administratives/limites-communales-generalisees.assetdetail.5247306.html)

## Usage

```javascript
const {
  cantons,
  communes,
  districts,
  lakes,
  switzerland,
} = require('swiss-geodata-2018')
```

All are GeoJSON collections of Polygons/MultiPolygons, except `switzerland` that is a topojson containing all other four.