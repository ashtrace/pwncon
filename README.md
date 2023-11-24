# pwncon
A docker container based on arch and blackarch linux to spawn a quick binary exploitation environment.

## Installation

- Clone this repositary.
- Build the docker image

    ```
    shell~$ git clone https://github.com/ashtrace/pwncon.git
    shell~$ docker build -t pwncon .
    ```

- Run the docker image

    ```
    shell~$ docker run -it -v pwncon_pkg:/var/cache/pacman/pkg -v pwncon_gnupg:/etc/pacman.d/gnupg -v pwncon_etc:/etc -v pwncon_varlib:/var/lib -v pwncon_varlog:/var/log -v pwncon_usrlocal:/usr/local -v pwncon_root:/root pwncon
    ```
