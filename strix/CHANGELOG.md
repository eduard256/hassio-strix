# Changelog

All notable changes to this project will be documented in this file.

## [1.0.8] - 2025-11-26

### Changed
- Updated Docker deployment to use host network mode for better compatibility
- Simplified add-on name to "Strix"

### Improved
- Better compatibility with unprivileged LXC containers
- Simplified Docker networking configuration
- Direct network access for improved camera discovery performance

## [1.0.7] - 2025-11-23

### Fixed
- Fixed channel numbering for Hikvision-style cameras (reported by @sergbond_com)
- Removed invalid test data from Hikvision camera database
- Fixed brand+model search matching in stream discovery

### Added
- Universal `[CHANNEL+1]` placeholder support for flexible channel numbering
- Support for both 0-based (channel=0 → 101) and 1-based (channel=1 → 101) channel selection
- Added 6 high-priority Hikvision patterns to popular stream patterns database

### Changed
- Updated 14 camera brands with universal channel patterns (Hikvision, Hiwatch, Annke, Swann, Abus, 7links, LevelOne, AlienDVR, Oswoo, AV102IP-40, Acvil, TBKVision, Deltaco, Night Owl)
- Hikvision: replaced 10 hardcoded patterns with 6 universal patterns
- Hiwatch: replaced 4 hardcoded patterns with 8 universal patterns (including ISAPI variants)
- Universal patterns now tested first for faster discovery, hardcoded patterns kept as fallback
- Improved stream discovery performance with intelligent pattern ordering

## [1.0.6] - 2025-11-22

### Added
- Dynamic channel support for HiWatch/Hikvision cameras
- New URL patterns with [CHANNEL] placeholder for flexible channel selection
- Support for multi-channel DVR/NVR systems

### Improved
- HiWatch camera database now supports channels 0-255
- Better stream discovery for multi-camera setups
- Users can now specify exact channel number for testing

## [1.0.5] - 2025-11-22

### Fixed
- SSE timeout issues during long-running stream discovery
- Increased server WriteTimeout from 30s to 5 minutes for SSE support
- Progress updates now sent every second to prevent connection timeouts

### Improved
- More reliable stream discovery progress tracking
- Better handling of cameras with many stream URLs to test

## [1.0.4] - 2025-11-22

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
