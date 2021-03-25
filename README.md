# Event Ticketing

This is my attempt at building a distributed systems application leveraging microservices.
It enables one to by and sell tickets online.

## Getting Started
### For mac users

```
$ git clone git@github.com:JayKay24/Event-Ticketing.git
```

Make sure you have ingress-nginx installed on your computer by following [this](https://kubernetes.github.io/ingress-nginx/deploy/#docker-for-mac) guide.

Open `/etc/hosts` file and configure `ticketing.dev` to route back to `127.0.0.1`

Navigate to [skaffold](https://skaffold.dev/docs/install/) and install it for mac.

```
$ skaffold dev
```

## Acknowledgements
* Stephen Grider - [Microservices with Node.js and React](https://www.udemy.com/course/microservices-with-node-js-and-react)
