# Use a base image that supports 32-bit binaries
FROM i386/ubuntu:20.04

# Update the package list and install necessary tools
RUN apt-get update && \
    apt-get install -y nasm gcc libc6-dev

# Create a working directory
WORKDIR /usr/src/app

# Copy your assembly code into the container
COPY . .

# Assemble and link the code (example: assuming main.asm is in the directory)
RUN nasm -f elf32 main.asm -o main.o && gcc -m32 main.o -o main

# Define an entry point (you can change this according to your needs)
ENTRYPOINT ["./main"]