# Base image with .NET 8 SDK preinstalled
FROM mcr.microsoft.com/vscode/devcontainers/dotnet:8.0

# Install dependencies
RUN apt-get update && apt-get install -y curl unzip jq && rm -rf /var/lib/apt/lists/*

# Create agent folder
RUN mkdir /azp
WORKDIR /azp

# Download agent
RUN curl -LsS https://vstsagentpackage.azureedge.net/agent/3.220.2/vsts-agent-linux-x64-3.220.2.tar.gz | tar -xz

# Copy entrypoint script
COPY .devcontainer/start-agent.sh .

RUN chmod +x start-agent.sh
