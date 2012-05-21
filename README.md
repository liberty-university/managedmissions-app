# ManagedMissions App

The ManagedMissions app is built with the Sencha Touch SDK.

## Components

There are four components to the project.

### CoffeeScript Source

The App's code is written in CoffeeScript, which compiles directly to JavaScript. You can use the CoffeeScript in ./src/, or just edit the JavaScript directly (but be warned - if you decide to edit the JavaScript, any changes and recompilations of the CoffeeScript will overwrite the JavaScript).

CoffeeScript can be compiled by running ./compile.sh

### App Source

This root of this repository is the compiled JavaScript, which can run in a browser.

### The Built App

Run ./build.sh to compile the application code with the Sencha packager. Output goes in the ./build/native/ directory. This code can then be placed into a PhoneGap project to be compiled for native applications.

### API Proxy

Since JSONP only works for GET requests, we wrote a proxy that allows the app to use a GET request to login. The proxy is a Sintra application in ./proxy/. The proxy is easy to set up, and runs on Heroku, but the best solution would probably be to allow GET requests on the ManagedMissions logon API, or set up cross-domain Ajax for the ManagedMissions domain.
