# tekkit-classic-docker
[![Docker Build](https://img.shields.io/docker/cloud/build/dang1t/tekkit-classic-docker.svg)](https://hub.docker.com/r/dang1t/tekkit-classic-docker)

Tekkit Classic 3.1.2 Docker Container.

To build the container (if I haven't stuck this on DockerHub):
 1. Install git for your distro if you haven't already.
 2. Run `git clone https://github.com/LGDan/tekkit-classic-docker.git`
 3. Ensure you have docker set up right so you can use it without `sudo` or root (not really necessary, just a preference.)
 4. Run `docker build --tag tekkit-classic:latest tekkit-classic-docker`

\
To just get it up and running, replace `your_mc_account_name_here` with your Minecraft player name, and run the command:
```dockerfile
docker run -d \
    -p 25565:25565 \
    -e SERVER_OP=your_mc_account_name_here \
    --name=tekkit-server \
    --restart=unless-stopped \
    tekkit-classic:latest
```
By default, it does store its data in a volume so it's safe to rebuild the container if you need to, and re-attach the previous volume to `/minecraft`.

\
I suggest you put the world folders on better/faster storage that you have available, replace my `/tank/tekkit-zfs` with the path to your storage. I included the `plugins` as well just for easy access.
```
docker run -d \
    -v /tank/tekkit-zfs/world:/minecraft/world \
    -v /tank/tekkit-zfs/world_nether:/minecraft/world_nether \
    -v /tank/tekkit-zfs/world_the_end:/minecraft/world_the_end \
    -v /tank/tekkit-zfs/plugins:/minecraft/plugins \
    -p 25565:25565 \
    -e SERVER_OP=your_mc_account_name_here \
    --name=tekkit-server \
    --restart=unless-stopped \
    tekkit-classic:latest
 ```
  
