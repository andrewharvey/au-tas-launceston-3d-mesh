#!/usr/bin/env node

const fs = require('fs')

const input = JSON.parse(fs.readFileSync('/dev/stdin'))

const minZoom = 15
const maxZoom = 18//21

// format is 'fbx' or 'skp'
const format = 'fbx'

input.features.forEach((feature) => {
    const col = toFixed(feature.properties.column)
    const row = toFixed(feature.properties.row)

    for (var z = minZoom; z <= maxZoom; z++) {
        const url = `https://s3-ap-southeast-2.amazonaws.com/launceston/tiles3d/${format}/Tile_${col}_${row}_L${z}.zip`
        console.log(url);
    }
});

function toFixed(i) {
    return Number(i).toLocaleString('en', { minimumIntegerDigits: 3 });
}
