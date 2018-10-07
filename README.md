# Docker container eclipse_java10
Container's creation dockerfile.

This image is based on ubuntu lastest image, and the environment (until now) is composed of:
<ul>
  <li>Java 10</li>
  <li>Eclipse Photon</li>
</ul>

This image was created as a initial test and understanding about docker and its uses. The objective was to create a container to be used for developers who doesn't want to have a lot of programs and IDE's in their machines, being able to start this services in a container to use when necessary.

In order to run eclipse (Photon), you must run:
 <b>docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=unix$DISPLAY eclipse_java10 eclipse</b>

This command enables you to use the XServer of the host instead of the guest, allowing to run GUI Applications inside a container. 

Access it on DockerHub : https://hub.docker.com/r/limamatheus/eclipse_java10/
