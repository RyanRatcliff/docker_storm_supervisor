# Docker Supervisor
A very basic Docker Supervisor container, with an additional fake AWS credential file to allow for connections to a local dynamodb instance.

### To build the container
```
docker build -t ryanratcliff/storm_supervisor .
```

### Alternatively, the container can be pulled from Docker Registry
```
docker pull ryanratcliff/storm_supervisor
```

# Example usages

### To startup as is, requires a zookeeper instance defined as 'zookeeper' and a nimbus instance defined as 'nimbus'
```
docker run -d --link my_zookeeper:zookeeper --link my_nimbus:nimbus ryanratcliff/storm_supervisor
   ```

### To startup with all ports exposed to host
```
docker run -d -P --link my_zookeeper:zookeeper --link my_nimbus:nimbus ryanratcliff/storm_supervisor
```

### To startup with specific port exposed
```
docker run -d p 8080:8080 --link my_zookeeper:zookeeper --link my_nimbus:nimbus ryanratcliff/storm_supervisor
```
