# svg_viewer
This is a web based viewer for the EPICS Archiver Appliance that uses SVG instead of Canvas with the potential to use WebGL in the future. 

## Docker Setup

This project includes a Docker setup to run the viewer in a containerized environment using nginx as a proxy.

### Prerequisites

- Docker
- Docker Compose

### Configuration

1.  Create a `.env` file in the root of the project. You can use the `.env.demo` file as a template.
2.  In the `.env` file, set the `PROXY_ENDPOINT` variable to the URL of your EPICS Archiver Appliance's retrieval endpoint. For example:

    ```
    PROXY_ENDPOINT=http://your_archiver_appliance/retrieval
    ```

### Running the viewer

To build and run the viewer, use the following command:

```bash
docker-compose up --build
```

The viewer will be available at `http://localhost:16000/retrieval/ui/viewer/archViewer.html`.