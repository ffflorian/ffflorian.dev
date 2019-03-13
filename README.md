# ffflorian.github.io [![Dependabot Status](https://api.dependabot.com/badges/status?host=github&repo=ffflorian/ffflorian.github.io)](https://dependabot.com)

## Build
```
yarn
yarn dist
```

## Serve
* Start a web server which serves the `dist` folder.

## Serve in development mode

Note: On Linux you need to set
```
sysctl fs.inotify.max_user_watches=60000
```
to allow file watching.

```
yarn start
```
