This repo exposes a very strange bug in `yarn` whereby some files in the module are not unpacked properly, specifically `src/core.js` which contains our version number.

To replicate:

```
git checkout first
rm -rf node_modules
yarn install
./check.sh
```

You should see:

```
core.js says:
exports.version = '1.38.3';

package.json says:
  "version": "1.38.3",
```

Then:

```
git checkout second
yarn install
./check.sh
```

You should see:

```
core.js says:
exports.version = '1.38.3';

package.json says:
  "version": "1.39.1",
```

This is wrong because if you then:

```
rm -rf node_modules
yarn install
./check.sh
```

You see:

```
core.js says:
exports.version = '1.39.1';

package.json says:
  "version": "1.39.1",
```
