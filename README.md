# tinyhome

tinyhome generates a static HTML homepage via shell script.

## Features

* Minimal dependencies (coreutils)
* Easy configuration and customisation
* Tiny optimized result page
* [Font Awesome](https://fontawesome.com/v5.15/icons?d=listing&p=2&s=solid&m=free) icons (solid only)
* Dark mode

## Demo

An example site is available [here](https://lab.bdro.fr/tinyhome/).

## Docker Setup

### compose.yml
```
services:
  tinyhome:
    environment:
      REFRESH_INTERVAL: '360'
    image: baywolfstudios/tinyhome
    ports:
    - published: 8123
      target: 80
    restart: unless-stopped
    volumes:
    - /host/path/to/config:/config:rw
```

## Setup

To generate a personal dashboard:

* Clone the repository and go to the created directory
* Edit the configuration file `config.csv`
* Generate the homepage `./tinyhome > index.html`
* Serve the page (with the css and webfonts folders) with your favorite web server

## Configuration file

The syntax of `config.csv` file is:
```
Element, Name, Icon, Url
```

For instance:
```
heading, Heading, -, -
section, Tools, wrench, -
item, Status Page, heart, https://github.com/bderenzo/tinystatus
item, Dashboard, bookmark, https://github.com/bderenzo/tinyhome
```

