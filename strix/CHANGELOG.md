# Changelog

All notable changes to this project will be documented in this file.

## [1.0.3] - 2025-11-18

### Fixed
- Fix stream discovery API URL for Home Assistant Ingress compatibility
- Remove URL() constructor that broke Ingress path resolution

## [1.0.2] - 2025-11-18

### Fixed
- Fix camera search and other API paths for Home Assistant Ingress
- Change absolute paths to relative paths in API requests

## [1.0.1] - 2025-01-18

### Fixed
- Fix CSS and JS loading in Home Assistant Ingress by using relative paths
- Maintains full compatibility with direct Docker installations

## [1.0.0] - 2025-01-18

### Added
- Initial release of Strix Home Assistant Add-on
- Web interface with ingress support
- Camera stream discovery with 3,600+ camera models
- ONVIF protocol support
- Real-time discovery progress via SSE
- Multi-architecture support (amd64, aarch64, armv7)
- RESTful API with comprehensive endpoints
- Smart URL building and validation
- Concurrent stream testing with ffprobe
- Configurable port and log level
- Health check endpoint
