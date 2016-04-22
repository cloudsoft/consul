# Consul
Brooklyn blueprint for Consul service discovery by Hashicorp
---
[https://www.consul.io](https://www.consul.io)

## What is Consul?

Consul has multiple components, but as a whole, it is a tool for discovering and configuring services in your infrastructure. It provides several key features:

**Service Discovery:** Clients of Consul can provide a service, such as api or mysql, and other clients can use Consul to discover providers of a given service. Using either DNS or HTTP, applications can easily find the services they depend upon.

**Health Checking:** Consul clients can provide any number of health checks, either associated with a given service ("is the webserver returning 200 OK"), or with the local node ("is memory utilization below 90%"). This information can be used by an operator to monitor cluster health, and it is used by the service discovery components to route traffic away from unhealthy hosts.

**Key/Value Store:** Applications can make use of Consul's hierarchical key/value store for any number of purposes, including dynamic configuration, feature flagging, coordination, leader election, and more. The simple HTTP API makes it easy to use.

## Blueprint Configuration

This blueprint deploys a Consul cluster with a configurable number of Nodes.  Nodes should be created in odd numbers to allow the cluster to maintain quorum.  

- The number of nodes is set via the `initialSize` parameter in `consul-cluster.yaml`.  
- The number of nodes needed to bootstrap the cluster is set via `min.cluster.nodes` in `consul-node.yaml` 
- The version of Consul that you want to deploy is set via `consul.version` in `consul-node.yaml`
- Full Consul properties are available in the server config file `server-config.json`
- The Consul UI is enabled by default and available at : `http://<node_ip>:8500/ui`. It can be diabled by removing the  `ui_dir` parameter from `server-config.json`.

## TODO:

- [ ]  Add sensor to offer consul URL
- [ ]  Add option to have Brooklyn configure Vault for github auth backend 
  - add effector to allow user to enter their key to do this.
- [ ]  Add TLS encryption including Brooklyn generating self signed keys (script for now)
- [ ]  Add options to blueprint for adding features/config compatible with community catalog
