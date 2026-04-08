# Changelog

All notable changes to this project will be documented in this file.

## [2.1.0] - 2026-04-08

### Added
- ONVIF protocol support: auto-discovery via unicast WS-Discovery, stream resolution through ONVIF profiles
- ONVIF probe detector: detects ONVIF cameras during network probe (4-7ms response time, no auth required)
- ONVIF camera page: credentials form with option to also test popular stream patterns
- ONVIF stream handler: resolves all camera profiles, tests each via RTSP, returns paired results (onvif:// + rtsp://) with shared screenshots

### Changed
- ONVIF has highest probe priority (above HomeKit and Standard)
- JPEG-only streams classified as Alternative in test results
- HomeKit page redesigned with centered layout
- Hardened URL handling against undefined/null values

## [2.0.0] - 2025-04-05

### Added
- Complete rewrite as a single Go binary with modular architecture
- DVRIP protocol support
- RTMP protocol support
- Bubble protocol support
- HTTP/HTTPS protocol support for snapshots and streams
- Direct stream URL input in web UI
- Frigate config proxy with auto-discovery via HA Supervisor API
- Frigate connectivity check endpoint
- go2rtc module with auto-discovery
- Network probe system: port scanning, ICMP ping, ARP/OUI lookup, mDNS/HomeKit detection, HTTP probing
- Camera stream tester with automatic JPEG screenshot capture and resolution extraction
- Frigate config generator from camera database
- Web UI pages: search, test, config, URLs, go2rtc streams, HomeKit
- SQLite camera database loaded from external StrixCamDB repository
- Universal Linux installer script with Docker/Compose auto-setup
- In-memory log viewer API endpoint
- Dockerfile with multi-stage build and healthcheck

### Fixed
- Screenshot URL path: removed leading slash
- Credentials with special characters are now URL-encoded in stream URLs
- Credentials no longer leak in debug logs

### Changed
- Version is now injected at build time via ldflags (no hardcoded version in source)
- Pure Go build with no CGO dependency (switched from mattn/go-sqlite3 to modernc.org/sqlite)
- Port is always included in URL for protocols with raw TCP dial
- Structured logging with zerolog, separate from human-readable output

## [1.0.11] - 2026-03-19

### Added
- Project icon assets (SVG, 192x192 PNG, 512x512 PNG) for use in app stores and integrations

### Fixed
- Health endpoint now accepts HEAD requests for Docker and CasaOS healthcheck compatibility
- Registered HEAD route in chi router for /api/v1/health endpoint

## [1.0.10] - 2026-03-17

### Added
- Device probe endpoint (GET /api/v1/probe) for network device inspection
- HTTP prober for detecting camera web interfaces
- mDNS discovery for local network devices
- ARP/OUI vendor identification with camera OUI database (2,400+ entries)
- Probe integration into frontend with modal UI
- Added Trassir and ZOSI to OUI database

### Changed
- Unified Docker image for Docker Hub and HA add-on (single image)
- Application version now injected at build time via ldflags
- HA add-on reads /data/options.json natively (no more entrypoint script)
- Optimized mDNS discovery timeout

### Fixed
- Removed experimental SSE warning from Home Assistant Add-on documentation
- Clear probe-filled fields when navigating back in frontend

## [1.0.9] - 2025-12-11

### Fixed
- Fixed real-time SSE streaming in Home Assistant Ingress mode
- SSE events now arrive immediately instead of being buffered until completion

### Technical
- Added automatic detection of Home Assistant Ingress via X-Ingress-Path header
- Implemented 64KB padding for SSE events to overcome aiohttp buffer in HA Supervisor
- Adjusted progress update interval to 3 seconds in Ingress mode to reduce traffic
- Normal mode (Docker/direct access) remains unchanged

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
