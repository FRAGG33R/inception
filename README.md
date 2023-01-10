# Containerization

<aside>
❓ Containerization is the process of packaging an application and its dependencies into a container.
Containerization is an important concept in the field of DevOps, and it is used to automate the process of building and deploying software.
There are many different technologies and platforms that can be used for containerization, including Docker, rkt, and LXD.

</aside>

# Container

<aside>
❓ A [**container**](https://www.docker.com/resources/what-container/) is a standard unit of software that packages up code and all its dependencies so the application runs quickly and reliably from one computing environment to another.
A container is a runtime environment that allows you to run software in a predictable and consistent manner, regardless of the environment in which it is running. It is created from a Docker image.
A container is a runnable instance of an image.

</aside>

<aside>
⚠️ An *image i*s a read-only template with instructions for creating a Docker container. A container image is a lightweight, standalone, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries and settings. Container images become containers at runtime and in the case of Docker containers – images become containers when they run on [Docker Engine](https://www.docker.com/products/container-runtime).

</aside>

# How does containers works

<aside>
❓ Containers work by using operating system-level virtualization, which allows multiple isolated user-space instances to be created on a single operating system kernel. Each container is an isolated and portable runtime environment that includes all of the necessary components to run a piece of software.

When you run a container, the operating system creates a separate environment for the container to run in, which is isolated from the host machine and other containers. This isolation allows multiple containers to run on the same host without interfering with each other.

</aside>

# Containerization benefits

- **Isolation**: Containers provide isolation, which means that they can run independently of each other and do not interfere with the other processes running on the host machine. This makes it easier to run multiple applications on the same host without worrying about conflicts or dependencies.
- **Portability**: Containers are portable, which means that they can be easily moved from one environment to another. This makes it easier to deploy applications consistently across different environments, such as from development to production.
- **Resource efficiency**: Containers are lightweight and require fewer resources than traditional virtualization approaches, which makes them more efficient to run. This can help reduce costs and improve performance.
- **Flexibility**: Containers can be easily customized and configured, which makes them flexible and easy to use. This makes it easy to build and deploy applications quickly and efficiently.

# How does container created ?

<aside>
❓ Containers in Linux use kernel namespaces to isolate the resources of the container from the host system and from other containers. When a container is created, it is a member of one or more kernel namespaces, which provide a private view of certain kernel resources to the processes running in the container.

To create a container, a userpace program, such as a container runtime (e.g., Docker), can use the namespace API to create a new process that is a member of one or more namespaces. The main system call for creating and managing namespaces in Linux is clone().

</aside>

# Namespace

<aside>
❓ In Linux, a namespace is a mechanism to isolate resources within a system. A namespace is created and managed by the Linux kernel, and it has a unique identifier within the system. Each namespace provides a private view of certain kernel resources to the processes that are members of the namespace.

</aside>

<aside>
⚠️ For example, the mount namespace isolates the filesystem hierarchy, so that processes in different mount namespaces can have different views of the filesystem. The PID namespace isolates the process ID space, so that processes in different PID namespaces can have the same PID. The network namespace isolates network resources, such as network interfaces and IP addresses.

</aside>

# Control groups (cgroups)

<aside>
🛠 Cgroups (short for control groups) is a Linux kernel feature that allows you to partition resources on a system and allocate them to specific groups of processes. This allows you to ensure that the processes have predictable and controlled access to the resources, and to prevent a group of processes from consuming too many resources and affecting the performance of the system.

</aside>

<aside>
⚠️ Cgroups allow you to allocate resources, such as CPU, memory, and I/O bandwidth, to a group of processes

</aside>

# Image layers

<aside>
🛠 a layer refers to a change or addition to a Docker image. When you build an image, you start with a base image and then add layers on top of it, each of which represents a change or addition to the image.

For example, you might start with a base image that includes a basic Linux distribution and then add a layer that installs a specific version of a runtime, such as Python. You could then add another layer that installs additional libraries or dependencies, and another layer that includes your application code.

Each layer in an image is stored as a separate filesystem layer, and they are stacked on top of each other to form the complete image. This allows you to create customized images that include only the components that you need, and to share them with others.

</aside>

<hr>

# Docker

# Docker overview

<aside>
❓ Docker is an open platform for developing, shipping, and running applications. Docker enables you to separate your applications from your infrastructure so you can deliver software quickly

</aside>

# Docker architecture

![https://docs.docker.com/engine/images/architecture.svg](https://docs.docker.com/engine/images/architecture.svg)

# Docker image

<aside>
❓ An *image* is a read-only template with instructions for creating a Docker container. Often, an image is *based on* another image, with some additional customization. For example, you may build an image which is based on the `ubuntu` image, but installs the Apache web server and your application, as well as the configuration details needed to make your application run.

You might create your own images or you might only use those created by others and published in a registry. To build your own image, you create a *Dockerfile* with a simple syntax for defining the steps needed to create the image and run it to get a container. Each instruction in a Dockerfile creates a layer in the image. When you change the Dockerfile and rebuild the image, only those layers which have changed are rebuilt. This is part of what makes images so lightweight, small, and fast, when compared to other virtualization technologies.

</aside>

# Docker container

<aside>
❓ A container is a runnable instance of an image. You can create, start, stop, move, or delete a container using the Docker API or CLI.

</aside>

# Docker deamon

<aside>
❓ The Docker daemon is a background process that runs on the host machine and manages Docker containers. It is responsible for building, running, and distributing Docker containers.
The Docker daemon listens for Docker API requests and manages the containers, images, and networks on the host. It is also responsible for pulling images from remote repositories, such as Docker Hub, and for creating and deleting containers, as well as managing container volumes and networking.

</aside>

# Docker file

<aside>
❓ Docker can build images automatically by reading the instructions from a `Dockerfile.`A Dockerfile is a text file that contains the instructions for building a Docker image. When you build an image from a Dockerfile.

</aside>

# Docker file example

```jsx
FROM ubuntu:18.04

RUN apt-get update && apt-get install -y nginx

CMD ["nginx", "-g", "daemon off;"]
```

# Dockerfile instructions

- **`FROM`** - Specifies the base image for the Docker image being built.
- **`RUN`** - Executes a command in the shell and commits the result.
- **`CMD`** - Specifies the default command that should be run when a container is started from the image.
- **`ENV`** - Sets environment variables in the image.
- **`EXPOSE`** - Exposes a port to be used by the container.
- **`ADD`** - Copies files from the host machine to the image.
- **`COPY`** - Copies files from the build context to the image.
- **`ENTRYPOINT`** - Specifies the command that should be run when the container is started, with the **`CMD`** instruction serving as default arguments.
- **`VOLUME`** - Creates a mount point for external data.
- **`USER`** - Sets the user that commands should be run as.
- **`WORKDIR`** - Sets the working directory for subsequent instructions.
- **`ARG`** - Defines a build-time variable.
- **`ONBUILD`** - Specifies a trigger that should be run when the image is used as the base for another image.

<aside>
⚠️ CMD is used to specify the command that should be run when a container is started from the image, while RUN is used to execute a command and build a new image layer as part of the image build process.

</aside>

# Docker compose

### Overview

<aside>
❓ Docker Compose is a tool for defining and running multi-container Docker applications. It allows you to use a YAML file to define the configuration of your application's services, and then use a single command to create and start all of the services from your configuration.
With Docker Compose, you can define the dependencies between your application's services and easily manage them as a group. For example, if your application consists of a web server and a database, you can use Docker Compose to ensure that the database is started before the web server.

</aside>

<aside>
⚠️ Overall, Docker Compose is a powerful tool for managing multi-container Docker applications and simplifies the process of working with Docker in development and production environments.

</aside>

### YAML file

<aside>
❓ AML is a file format that stands for "YAML Ain't Markup Language." It is a human-readable data serialization language that is often used for storing data in a structured way, such as configuration files or device descriptions. These files are used for storing and organizing data in a way that is easy to read and write

</aside>

<aside>
⚠️ Data serialization is the process of converting a data object or structure into a format that can be stored or transmitted over a network. The serialized data can then be later transformed back into its original form. Serialization is often used when data needs to be stored or transmitted in a format that can be easily read or understood by other systems or devices.

</aside>

### Example

```yaml
version: '3'
services:
  web:
    build: .
    ports:
      - "8000:8000"
  db:
    image: postgres
```

### Options

- **`build`**: The build context and Dockerfile for building the service's image.
- **`image`**: The name and optionally the tag of the image to use for the service.
- **`ports`**: A list of ports to expose from the service's containers.
- **`volumes`**: A list of volumes to mount from the host or other services.
- **`environment`**: A list of environment variables to set in the service's containers.
- **`command`**: The command to run when the service's containers are started.
- **`depends_on`**: A list of service names that the service depends on.
- **`restart`**: The restart policy for the service's containers.
- **`user`**: The user to run the service's containers as.
- **`workdir`**: The working directory for the service's containers.
- **`networks`**: A list of networks that the service's containers should be connected to.
- **`deploy`**: Configuration for deploying the service to a Swarm cluster.
- **`labels`**: A list of labels to apply to the service's containers.
- **`logging`**: Configuration for logging driver to use for the service's containers.
- **`healthcheck`**: Configuration for a health check to perform on the service's containers.

# Docker volumes

<aside>
❓ Docker volumes are a way to persist data generated by and used by Docker containers. They allow you to store data on the host filesystem, outside of the container's union filesystem, so the data can persist even after the container is stopped and removed.
A Docker volume is essentially a mount point on the host filesystem that is bind-mounted to a location inside the container.

</aside>

<aside>
⚠️ Volumes are useful for a number of use cases, such as storing database files or application logs. They can be used with  Docker Compose.

</aside>

![https://docs.docker.com/storage/images/types-of-mounts-volume.png](https://docs.docker.com/storage/images/types-of-mounts-volume.png)

# Docker network

### Overview

<aside>
❓ Docker network is a feature of Docker that allows you to create and manage networks for Docker containers. It allows you to create a virtual network that spans multiple Docker hosts, allowing containers to communicate with each other and with external resources across the network.

</aside>

### Types

There are several types of networks available in Docker:

- **`bridge`**: This is the default network type. It creates a private network for containers on the same Docker host, allowing them to communicate with each other and with the host.
- **`host`**: This network type exposes the container to the host's network stack. Containers on the host network can communicate with each other and with the host, but not with containers on other network types.
- **`overlay`**: This network type allows you to create a virtual network that spans multiple Docker hosts. Containers on an overlay network can communicate with each other and with external resources across the network.
- **`none`**: This network type disables networking for the container.

![https://docs.docker.com/engine/tutorials/bridge2.png](https://docs.docker.com/engine/tutorials/bridge2.png)

# Q&A

## Difference between a docker image used with docker-compose and without docker-compose?

when you use a Docker image without Docker Compose, you need to use the **`docker run`** command to create and start a container for each service in your application. This can be more cumbersome if you have a complex application with many services, as you need to run multiple **`docker run`** commands and manage the containers individually.

### The benefit of docker compared to VMs ?

1. **Efficiency:** Docker allows you to package and run applications in lightweight containers, rather than running a full-blown operating system in a VM. This makes it more efficient, as the overhead of running multiple operating systems is eliminated.
2. **Portability:** Docker allows you to package an application and its dependencies in a container, which can be easily moved between different environments, such as development, staging, and production. This makes it easier to deploy and manage applications.
3. **Consistency:** By packaging an application and its dependencies in a container, you can ensure that the application will behave the same way in different environments. This can help to reduce the risk of bugs and issues caused by differences between environments.
4. **Ease of use:** Docker provides an easy-to-use command-line interface and a large number of pre-built images, making it simple to get started with containerization.

<hr>

# inception services 

# SSL

### Overview

<aside>
❓ SSL (Secure Sockets Layer) is a protocol for establishing secure links between networked computers. It is commonly used to secure communication over the internet, such as between a web server and a client's web browser.
SSL is commonly used to secure communication over HTTPS (Hypertext Transfer Protocol Secure), which is the secure version of HTTP, the protocol used for transferring data on the World Wide Web. When a client connects to a server over HTTPS, the communication between the client and server is encrypted using SSL.

</aside>

### How does it work

<aside>
❓ SSL works by using a combination of public key cryptography and a digital certificate to establish an encrypted connection between two parties. When a client connects to an SSL-enabled server, the server sends the client its digital certificate. The client then checks the certificate's authenticity and, if it is valid, generates a unique session key to use for encrypting the communication between the client and server.

</aside>

# TLS

### Overview

<aside>
❓ TLS (Transport Layer Security) is a protocol for establishing secure links between networked computers. It is the successor to SSL and is used to secure communication over the internet and other networks.

</aside>

### How does it work

<aside>
❓ Like SSL, TLS works by using a combination of public key cryptography and digital certificates to establish an encrypted connection between two parties. When a client connects to a TLS-enabled server, the server sends the client its digital certificate. The client then checks the certificate's authenticity and, if it is valid, generates a unique session key to use for encrypting the communication between the client and server.

</aside>

[https://zohodiscussions.com/viewImage.do?fileId=18151000001687425&forumGroupURL=site24x7](https://zohodiscussions.com/viewImage.do?fileId=18151000001687425&forumGroupURL=site24x7)

# NGINX

### Overview

<aside>
❓ NGINX is a web server that can also be used as a reverse proxy, load balancer, and HTTP cache. It is known for its high performance, stability, and low resource consumption.
NGINX is typically used to serve static content, such as HTML, CSS, and JavaScript files, and to proxy requests to other servers and services. It can also be used to load balance traffic across multiple servers, improving the scalability and reliability of a web application.

</aside>

<aside>
⚠️ A **proxy** is a server or service that acts as an intermediary between a client and another server or service. Proxies are used to facilitate connections, provide security, and enable access to resources that may be restricted or blocked.

</aside>

### How does it work

<aside>
❓ When NGINX is used as a web server, it listens for incoming HTTP requests and serves the requested content to the client. When a client (such as a web browser) makes an HTTP request to a server running NGINX, the following process occurs:

</aside>

1. NGINX receives the request and determines whether it can serve the requested content from its cache. If the content is in the cache and is still fresh, NGINX serves it to the client directly, without forwarding the request to the backend server.
2. If the content is not in the cache or is stale, NGINX forwards the request to the backend server specified in the configuration.
3. The backend server processes the request and returns the content to NGINX.
4. NGINX receives the content from the backend server and sends it to the client. If the content is cacheable, NGINX stores a copy of it in its cache.

[https://cdn-media-1.freecodecamp.org/images/RooSvbKlAWsOjkz8JPactXH-GPf4Pe6DC3Ue](https://cdn-media-1.freecodecamp.org/images/RooSvbKlAWsOjkz8JPactXH-GPf4Pe6DC3Ue)

# MARIADB

### Overview

<aside>
❓ MariaDB is a free and open-source database management system that is a fork of the MySQL database management system.
MariaDB includes some additional features and improvements over MySQL

</aside>

### How does it work

<aside>
❓ MariaDB works by storing data in a structured format and providing users with a way to retrieve and manipulate that data through queries. When you use MariaDB, you can create databases and tables to store your data, and you can use SQL (Structured Query Language) to insert, update, delete, and retrieve data from those tables.

</aside>

![https://sql.sh/wp-content/uploads/2014/04/logo-mariadb-500px.png](https://sql.sh/wp-content/uploads/2014/04/logo-mariadb-500px.png)

# WORDPRESS

### Overview

<aside>
❓ WordPress is a content management system (CMS) that is used to create and manage websites. It is based on PHP and MySQL, and it is known for its ease of use and flexibility. With WordPress, users can create and publish content, manage and organize media, and customize the appearance of their website. WordPress is open-source software, which means that it is free to use and modify. It is used by millions of websites worldwide and is one of the most popular CMS platforms available.

</aside>

### How does it work

<aside>
❓ WordPress works by using a combination of PHP and MySQL to store and retrieve data. When a user requests a web page that is powered by WordPress, the web server processes the PHP code and retrieves the data from the MySQL database. The PHP code then generates the HTML code that is sent to the user's web browser, which allows them to view the web page.

</aside>

![https://kinsta.com/wp-content/uploads/2017/12/wordpress-admin.png](https://kinsta.com/wp-content/uploads/2017/12/wordpress-admin.png)

# REDIS

### Overview

<aside>
❓ The Redis WordPress plugin is a plugin that allows you to use Redis as an object cache for your WordPress website. An object cache is a way to store the results of expensive database queries and other operations in memory, so that they can be reused without having to be recomputed. This can help to speed up the performance of a WordPress website by reducing the number of database queries that need to be made.

</aside>

### How does it work

<aside>
❓ Redis works by accepting requests from clients and storing and retrieving data based on keys. It supports a wide range of commands for manipulating data, including commands for setting and getting values, incrementing and decrementing values, pushing and popping elements from lists and sets, and performing set intersection, union, and difference operations.

</aside>

1. When a request is made to the website or application, it is checked to see if the requested data is already in the Redis cache.
2. If the data is in the cache, it is retrieved from Redis and returned to the user.
3. If the data is not in the cache, it is retrieved from the database and stored in the Redis cache. The data is then returned to the user and will also be stored in the cache for future requests.

![https://linuxiac.b-cdn.net/wp-content/uploads/2021/06/redis-how-it-works.png](https://linuxiac.b-cdn.net/wp-content/uploads/2021/06/redis-how-it-works.png)

# FTP & VSFTPD

### Overview

<aside>
❓ FTP (File Transfer Protocol) is a standard network protocol used for transferring files from one computer to another over a TCP/IP network, such as the internet. FTP is a client-server protocol, which means that one computer acts as an FTP server, and other computers connect to it as FTP clients to download and upload files.

</aside>

<aside>
❓ VSFTPD (Very Secure FTP Daemon) is a popular FTP server software that is used on Unix-like operating systems, including Linux. It is known for its security and performance, and it is a common choice for hosting FTP servers.

</aside>

### How does it works

<aside>
❓ FTP uses separate connections for control information (such as login credentials and commands) and data transfer. This allows users to transfer multiple files concurrently, which can improve the speed of file transfers over a network.

</aside>

1. An FTP client program, such as FileZilla or Cyberduck, is installed on a computer.
2. The user specifies the hostname and login credentials for the FTP server that they want to connect to.
3. The FTP client establishes a connection to the FTP server and authenticates the user.
4. The user can then browse the directories on the FTP server and download or upload files as needed.
5. When the user is finished transferring files, they can close the connection to the FTP server.

## **VSFTPD = FTP + SSL/TLS**

![https://www.mybluelinux.com/img/post/featured-images/0055.vsftpd-server.png](https://www.mybluelinux.com/img/post/featured-images/0055.vsftpd-server.png)

# ADMINER

### Overview

<aside>
❓ Adminer is a tool for managing databases. It is a web-based database management tool that allows users to create and manage databases, as well as perform tasks such as importing and exporting data, running SQL queries, and viewing database statistics.
Adminer is written in PHP and supports a wide range of database management systems, including MySQL, PostgreSQL, SQLite, and Oracle. It is lightweight and easy to install, and it provides a simple and intuitive interface for managing databases.

</aside>

### How does it work

<aside>
❓ When you first open Adminer, you will need to enter the login credentials for your database. Once you are logged in, you will be presented with a dashboard that allows you to manage your databases. From the dashboard, you can create and delete databases, create and delete tables, and perform other tasks such as importing and exporting data and running SQL queries.
Adminer provides a simple and intuitive interface that makes it easy to manage databases, even for users who are not familiar with SQL or database management. It is a useful tool for developers and administrators who need to manage databases for their websites or applications.

</aside>
