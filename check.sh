#!/bin/bash

echo "core.js says:"
grep -m 1 exports.version ./node_modules/plotly.js/src/core.js
echo ""
echo "package.json says:"
grep -m 1 version ./node_modules/plotly.js/package.json
