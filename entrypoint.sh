#!/bin/sh

### entrypoint script
# if package.json, lock-files, and node_modules exist, then run start script
# else, run an inifinite loop command
if [ -f ./package.json ]; then
    echo "package.json found..."
    pass="p"
    if [ -d ./node_modules ]; then
        echo "node_modules found..."
        pass="${pass}n"
        if [ -f ./yarn.lock ]; then
            echo "yarn lockfile found..."
            pass="${pass}y"
        elif [ -f ./package-lock.json ]; then
            echo "npm lockfile found..."
            pass="${pass}n"
        else
            echo "No lockfile found..."
        fi
    else
        echo "node_modules not found..."
    fi
else
    echo "package.json not found..."
fi

if [ "$pass" = "pny" ]; then
    echo "yarn start"
    yarn start
elif [ "$pass" = "pnn" ]; then
    echo "npm start"
    npm start
else
    echo "manually create proper node project..."
    echo "running infinite command to keep container online..."
    echo "tail -f /dev/null"
    tail -f /dev/null
fi