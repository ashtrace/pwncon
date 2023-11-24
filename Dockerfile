# Use the official Arch Linux base image
FROM archlinux/archlinux:latest

# Create volumes for persistent data
VOLUME ["/var/cache/pacman/pkg", "/etc/pacman.d/gnupg", "/etc", "/var/lib", "/var/log", "/usr/local", "/root"]

# Update and upgrade the system
RUN pacman -Syu --noconfirm

# Update package databases and install necessary tools
RUN pacman -Sy --noconfirm && \
    pacman -S --noconfirm curl

# Download BlackArch strap.sh script
RUN curl -O https://blackarch.org/strap.sh

# Verify the SHA1 sum
RUN echo "5ea40d49ecd14c2e024deecf90605426db97ea0c strap.sh" | sha1sum -c -
    
# Set execute bit
RUN chmod +x strap.sh

# Run strap.sh
RUN ./strap.sh

# Enable multilib
RUN echo -e "[multilib]\nInclude = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf

# Install all needed files
RUN pacman -Sy --noconfirm && \
    pacman -S --noconfirm gcc gdb core/binutils patchelf strace ltrace python-pwntools tmux vim openssh

# Clean up unnecessary files
RUN pacman -Scc --noconfirm

# Set the working directory to root
WORKDIR /

# Start a shell session
CMD ["/bin/bash"]

