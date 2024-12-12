### Docker Compose Installation

To install Docker Compose, follow the steps below:

#### Step 1: Create the plugins directory
```bash
mkdir -p ~/.docker/cli-plugins/
```
#### Step 2: Download Docker Compose binary
```bash

curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
```
#### Step 3: Set executable permissions
```bash

chmod +x ~/.docker/cli-plugins/docker-compose
```
#### Step 4: Verify the installation
Run the following command to ensure Docker Compose was installed successfully:
```bash

docker compose version
```
Now you can use Docker Compose with the docker compose command.





