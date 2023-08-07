# Home Assistant Add-on: iSpy Agent DVR

## How to use

The user manual for iSpy Agent DVR can be found [here](https://www.ispyconnect.com/userguide-agent-dvr.aspx)

Recommended settings can be found [here](https://github.com/doitandbedone/ispyagentdvr-docker#ispy-agent-dvr)

## Recommended settings

### Ports
| Port             | Description                                           |
| -----------------| ------------------------------------------------------|
| `8090`           | By default the container will use port 8090 for Web UI. To access the panel go to http://localhost:8090 or replace localhost with your local IP |
| `3478`           | Main port used for TURN server communication  |
| `50000 - 50010`  | Ports used to create connections or WebRTC. These will be used as needed |

### Volumes
| Folder             | Folder path                                         |
| -------------------| ----------------------------------------------------|
| `Config`           | /agent/Media/XML/ |
| `Media`            | /agent/Media/WebServerRoot/Media/  |
| `Commands`         | /agent/Commands |
