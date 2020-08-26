# ffflorian.github.io [![Build Status](https://action-badges.now.sh/ffflorian/ffflorian.github.io)](https://github.com/ffflorian/ffflorian.github.io/actions/)

## Build

```
yarn
yarn dist
```

## Serve

- Start a web server which serves the `dist` folder.

## Serve in development mode

Note: On Linux you need to set

```
sysctl fs.inotify.max_user_watches=60000
```

to allow file watching.

```
yarn start
```
