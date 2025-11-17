# Strix - Camera Stream Discovery

Smart IP camera stream discovery system for Home Assistant.

## About

Strix is an intelligent IP camera stream discovery system that automatically discovers and validates camera streams, eliminating the need for manual URL configuration.

### Features

- **Intelligent Camera Search**: Fuzzy search across 3,600+ camera models
- **Automatic Stream Discovery**: ONVIF, database patterns, and popular URL detection
- **Real-time Updates**: Server-Sent Events (SSE) for live discovery progress
- **Universal Protocol Support**: RTSP, HTTP, MJPEG, JPEG snapshots, and more
- **Smart URL Building**: Automatic placeholder replacement and authentication handling
- **Concurrent Testing**: Fast parallel stream validation with ffprobe

## Installation

1. Add this repository to your Home Assistant instance:
   [![Add Repository](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Feduard256%2Fhassio-strix)

2. Install the "Strix - Camera Stream Discovery" add-on
3. Start the add-on
4. Access the web interface from the sidebar

## Configuration

Available options:

- **port** (default: 4567): Port for the web interface and API
- **log_level** (default: info): Logging level (debug, info, warn, error)

## Usage

1. Open the Strix interface from your Home Assistant sidebar
2. Enter your camera's IP address or stream URL
3. Optionally provide camera model for better results
4. Enter credentials if required
5. Click "Discover Streams" to start the discovery process
6. View discovered streams in real-time

## API Endpoints

### Health Check
```
GET /api/v1/health
```

### Camera Search
```
POST /api/v1/cameras/search
{
  "query": "camera model",
  "limit": 10
}
```

### Stream Discovery (SSE)
```
POST /api/v1/streams/discover
{
  "target": "192.168.1.100",
  "model": "camera model",
  "username": "admin",
  "password": "password",
  "timeout": 240,
  "max_streams": 10
}
```

## Support

For issues and feature requests, please visit:
- [GitHub Issues](https://github.com/eduard256/Strix/issues)
- [Main Project](https://github.com/eduard256/Strix)
