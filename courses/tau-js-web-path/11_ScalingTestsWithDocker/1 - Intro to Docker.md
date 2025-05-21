# 1 - Introduction to Docker

## What is Docker?
> Docker is designed to build, ship, and run business critical applications in production at scale.

You can build and share containers and automate the development pipeline from a single environment. Each of these containers represents a piece of the app or system.

![lesson1_img1.png](assets/lesson1_img1.png)

**Containers** are the building blocks of the containerisation world and allow you to package only the things you need for your application or service without creating a whole operating system, like Virtual Machines. This means they are faster and more lightweight. Containers also give you control over your environment because you can specify exactly what you want each container to look like by using blueprints called Images.

![lesson1_img2.png](assets/lesson1_img2.png)

**Images** are the specs or details used to create containers. Just like how images for VMs let you spin up a Windows instance of Vista or XP, or Linux images let you pick between Ubuntu, Debian, or other versions, images for Docker let you specify which services, libraries, or dependencies you need for a container.

## Without Docker
![lesson1_img4.png](assets/lesson1_img4.png)
If we look at the structure of this very simple web application, there are four pieces that make up our entire app: The database that stores our information, the API layer to communicate between the UI and the database, the front-end code that is the UI, and the web server to host the UI and APIs.

Without containers, organizations would have to manage each piece of these very manually! This is a super simple example for just one environment, but already we have to track:
* Which version of the front-end code are we on
* Which dependencies are required and what are their versions
* Networking the services so they are connected correctly
* Managing services as each one changes
* etc...

This is why many companies struggle when trying to implement their own CI/CD

![lesson1_img5.png](assets/lesson1_img5.png)

Potential issues that arise without Docker containers/images:
* Developers tripping over each other because they are sharing the same Dev or QA environment
* Developers are put into a "queue" because they must wait for Developer A to be done with that test environment or instance of a service
* The bugs you find are caused by "the wrong version" of a service or feature flag
* The bugs you find are "expected" because of your test environment

We do a poor job of controlling our environments, services, and data because of how manual everything is. Docker and containers do a great job of solving this.

## With Docker
![lesson1_img7.png](assets/lesson1_img7.png)

Let's take a look at our simple web app example, but using containers instead. We want our web app's image to have the exact configuration we want. Our code is in React + Typescript, but it is managing its own dependencies. Really, all we need is to specify the exact version of our front-end that we want to use.

We'll label it "DEV" so other DEV services can see and use it. We want the latest version from the Dev Branch and we'll automatically link it to the Web Server so the networking is done for us. We even put our Web Server into a container so we can spin both up at the same time and have them automatically connected!

If we defined each of our services as an image, we could containerize all of them and spin up our entire application with one command and have it all connected for us!

## Why Docker with Grid?

![lesson1_img8.png](assets/lesson1_img8.png)

**How does this apply to running Selenium tests and why use Docker when some of you already have a Selenium Grid setup?**
1. For starters, setting up Selenium Grid is also a manual and tedious task. You need to download and run the Selenium Server, configure your hub and nodes for each machine, and run multiple commands in the command line that can be verbose.
2. Other problems include not being able to easily manage versions of the grid or browsers, it's hard to manage your hub and nodes because they get into bad states, and a lot of it has to be done, again, manually!

In the context of this course, we will be using headless and non-headless Chrome and Firefox images and a Selenium Grid image to spin up as many containers as we need! With a few simple commands, we'll spin up, restart, and tear down an entire grid in seconds.

## Quiz
1. **Which is NOT true about containers?**
   They create an entire operating system

2. **Images are**
   The "blue prints" to create containers

3. **Which are problems that containers can solve?**
   * Managing versions of services is manual and complex
   * Static environments because it's difficult to create environments
   * One small change requires the entire app to be tested

4. **Docker is designed**
   To build, ship, and run business critical applications at scale by using containers

## Resources
[.NET Core 2.1 Installation](https://dotnet.microsoft.com/download/dotnet-core/2.1)
[VS Code](https://visualstudio.microsoft.com/downloads/)
[Docker Compose Documentation](https://docs.docker.com/compose/overview/)

# 2 - Installing Docker

Because Docker Containers use Linux kernels, using Docker with Mac or Linux is easiest and the best experience, but it works for Windows as well.

## Installation for Windows
**Prerequisites:**
* Windows 10, 64 bit
* Virtualization is enabled in BIOS. Typically, virtualization is enabled by default. This is different from having Hyper-V enabled
  * [Microsoft Support Article](https://support.microsoft.com/en-us/windows/enable-virtualization-on-windows-c5578302-6e43-4b4b-a449-8ced115f58e1)
* At least 4GB of RAM

**Steps:**
1. Go to www.docker.com
2. Click Get Started
3. Click Download for Windows
4. Create a Docker account and login
5. Click Get Docker
6. Install Docker and start the Docker app
7. Open Command Prompt or Powershell
8. Run ``docker version`` to check that it worked!

`````shell
mattf@LAPTOP-OIHM264A MINGW64 /
$ docker version
Client:
 Version:           28.1.1
 API version:       1.49
 Go version:        go1.23.8
 Git commit:        4eba377
 Built:             Fri Apr 18 09:53:24 2025
 OS/Arch:           windows/amd64
 Context:           desktop-linux

Server: Docker Desktop 4.41.2 (191736)
 Engine:
  Version:          28.1.1
  API version:      1.49 (minimum version 1.24)
  Go version:       go1.23.8
  Git commit:       01f442b
  Built:            Fri Apr 18 09:52:57 2025
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.7.27
  GitCommit:        05044ec0a9a75232cad458027ca83437aae3f4da
 runc:
  Version:          1.2.5
  GitCommit:        v1.2.5-0-g59923ef
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
`````
## Resources
[Docker Installation Docs](https://docs.docker.com/install/)
[Enable Virtualization in BIOS](https://www.tutorialspoint.com/windows10/windows10_virtualization.htm)

# 3 - Setting up Docker
There are three main pieces to the setup of our grid:

1. The Docker machine with the Docker Engine
2. The "Hub" container
3. And the "Node" containers with the browsers that are connected to the Hub

![lesson3_img1.png](assets/ lesson3_img1.png)

Our tests are run against the Hub which balances them across the Nodes.

You can run docker commands and tests through your laptop, so think of it as the Docker Engine that the hub is connected to which ultimately connects the browser nodes.

**Docker Hub has the Images**
Hub and Nodes are containers. Containers need to be started by using images.

We get these images from a place called **Docker Hub **which is a repository for holding our images. You can either save your images to the hub, or you can download them from the hub!

1. Go to www.hub.docker.com and sign in 
2. Enter 'Selenium' in the search field
3. Look for the official images from Selenium. These are the images that start with 'selenium' or are by selenium
4. Find 'seleniun/hub' and click on it
5. This opens the Image Details and provides some information about the image, like the commands to pull the image
6. Cope the command and paste it into your terminal, i.e. git bash, & hit enter
7. You now have the _selenium/hub_ image installed

You can see what images are installed by running ``docker images``
![bash-docker-images.png](assets/bash-docker-images.png)
## Pull the Images
Now that the Hub container has been downloaded, we want to do the same thing for the headless and non-headless browsers by running the following commands:

``docker pull selenium/node-chrome``
``docker pull selenium/node-chrome-debug``
``docker pull selenium/node-firefox``
``docker pull selenium/node-firefox-debug``

> NOTE: The non-debug images are headless, and the debug images are not.

Now you should see 5 images when you run ``docker images``
![bash-docker-images.png](assets/bash-docker-images-2.png)

We can start creating containers now that we have the images. You are able to run and start containers one at a time through the docker run command, but we don't want to create one container at a time. We'd rather create the containers and network them together in ONE command.
![lesson3_img3.png](assets/lesson3_img3.png)

## Docker Compose & YML Overview
![lesson3_img4.png](assets/lesson3_img4.png)

**docker-compose** is part of Docker but has its own commands and uses a yml file to know which images you want to use, how you want to create your containers, and link them together. You define a single yml file with the services you want and then use the following command to create all of it at once.

> NOTE: had to change some stuff from the course based on - https://github.com/SeleniumHQ/docker-selenium/tree/trunk?tab=readme-ov-file#dev-and-beta-channel-browser-images
> New lines marked with ``# NEW``
> Removed lines marked with ``# REMOVED``

**!!!! TO DO - UPDATE CODE HERE WHEN ITS WORKING AND CLEANED UP**
````yaml
name: "Selenium Grid Docker Demo"

# Containers
services:
   # 1st Container called selenium-hub
   selenium-hub:
      image: selenium/hub
      ports:
         - "4442:4442"
         - "4443:4443" # NEW
         - "4444:4444" # NEW
      environment:
         # Only 16 browsers at a time on this grid
         GRID_MAX_SESSION: 16
         # Grid timeouts are recommended to be 300 seconds
         GRID_BROWSER_TIMEOUT: 300
         GRID_TIMEOUT: 300

   # 2nd Container called chrome
   chrome:
      image: selenium/node-chrome
      # has to wait selenium-hub to be up & running before this can be successfully marked as created
      depends_on:
         - selenium-hub
      environment:
         # link to selenium hub container
         #HUB_PORT_4444_TCP_ADDR: selenium-hub # REMOVED
         #HUB_PORT_4444_TCP_PORT: 4444 # REMOVED
         SE_EVENT_BUS_HOST: selenium-hub # NEW
         # 2 Chrome browsers per container
         NODE_MAX_SESSION: 2
         NODE_MAX_INSTANCES: 2
      # volumes:
      #   - /dev/shm:/dev/shm

   # 3rd Container called firefox
   firefox:
      image: selenium/node-firefox
      # has to wait selenium-hub to be up & running before this can be successfully marked as created
      depends_on:
         - selenium-hub
      environment:
         # link to selenium hub container
         #HUB_PORT_4444_TCP_ADDR: selenium-hub # REMOVED
         #HUB_PORT_4444_TCP_PORT: 4444 # REMOVED
         SE_EVENT_BUS_HOST: selenium-hub # NEW
         # 4 Firefox browsers per container
         NODE_MAX_SESSION: 4
         NODE_MAX_INSTANCES: 4
````
## Spin up our Grid using Docker Compose
Save the file as docker-compose.yml. Open your terminal in the directory where you just saved your yaml file and run:
``docker-compose up -d``

After the process is completed, run:
``docker ps -a``
This will list all of your containers. Observe that you have 3 containers running: hub, chrome, and firefox.

![docker-compose.png](assets/docker-compose.png)

Because this also spun up your grid and linked your chrome and firefox nodes, we can visually take a look at our grid in a browser!
Just go to http://localhost:4444/grid/console and you'll see a firefox container with 4 browser and a chrome container with 2 browsers!

## Teardown or Restart Grid
**Restart**
``docker-compose restart``
> Note: I noticed that if you change a value in the ``docker-compose.yml`` changes aren't always reflected, maybe containers are cached for a period?
> It seems doing ``docker-compose down`` then ``docker-compose up`` is a better way.

**Teardown**
``docker-compose down``

**Logs**
``docker logs <container-id>``

**Pipe Logs to File**
``docker logs <container-id> > filename.log``

## Resources
[Docker Compose Documentation](https://docs.docker.com/compose/overview/)

## Quiz
1. **What are the main pieces of the setup of our Grid?**
   * Docker Engine
   * Hub
   * Browser Nodes

2. **Where do we get images from?**
   Docker Hub at hub.docker.com

3. **What is the Docker command to download images?**
   ``docker pull``

4. **What is the Docker command to list your images?**
   ``docker images``

5. **Which file is used for docker-compose up?**
   ``docker-compose.yml``

6. **What is the docker-compose command to restart your Grid?**
   ``docker-compose restart``

7. **What is the docker-compose command to completely tear down the Grid?**
   
