# Changelog

All notable changes to this project will be documented in this file.

## [1.0.5] - 2025-11-22

### Added
- Mock mode for WebUI development with dev-server.sh script
- Interactive tooltips for all configuration fields and stream types
- Vertical stream list UI replacing horizontal carousel
- Smart auto-fill for camera configuration (username, network address)
- Collapsible stream details with expand/collapse functionality
- Support for BUBBLE protocol (XMEye/DVRIP cameras)

### Changed
- Reordered configuration tabs: Frigate first, then Go2RTC, then URL
- Improved stream discovery UI with better layout and hover effects
- Hide Copy/Download buttons until configuration is generated

### Improved
- Enhanced user guidance with comprehensive tooltips
- Better stream URL display (preview in header, full URL in details)
- Faster UI development workflow with mock mode

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
