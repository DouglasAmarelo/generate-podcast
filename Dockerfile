FROM ubuntu:latest

# Update and install required packages, including pip and essential Python tools
RUN apt-get update && apt-get install -y \
  python3.10 \
  python3-pip \
  python3-setuptools \
  python3-wheel \
  git

# Install PyYAML using pip without attempting to upgrade pip
RUN pip3 install PyYAML

# Copy the feed.py script and entrypoint.sh
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script is executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
