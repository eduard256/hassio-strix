# Strix - Camera Stream Discovery

## What is Strix?

Strix is a smart IP camera stream discovery system that helps you find working stream URLs for your IP cameras without manual configuration. It combines ONVIF discovery, a comprehensive database of 3,600+ camera models, and intelligent URL testing to automatically detect camera streams.

## Features

### Intelligent Camera Search
Search through a database of 3,600+ camera models with fuzzy matching. The system understands brand names and model numbers, making it easy to find your specific camera.

### Automatic Stream Discovery
Multiple discovery methods work together:
- **ONVIF Protocol**: Queries camera directly for stream URLs
- **Database Patterns**: Uses model-specific URL patterns
- **Popular URLs**: Tests common stream path variations

### Real-time Progress
Server-Sent Events (SSE) provide live updates during discovery, showing each URL being tested and streams as they're found.

### Universal Protocol Support
Discovers and validates multiple stream types:
- RTSP streams
- HTTP/HTTPS streams
- MJPEG streams
- JPEG snapshot URLs

## Configuration

### Port
The port number for the web interface and API. Default is 4567.

**Example:**
```json
{
  "port": 4567
}
```

### Log Level
Controls the verbosity of logging output.

**Options:**
- `debug`: Detailed debugging information
- `info`: General informational messages (default)
- `warn`: Warning messages only
- `error`: Error messages only

**Example:**
```json
{
  "log_level": "info"
}
```

## How to Use

### Basic Discovery

1. Open the Strix web interface from your Home Assistant sidebar
2. Enter your camera's IP address (e.g., `192.168.1.100`)
3. Optionally provide the camera model for better results
4. Enter camera credentials if required (username/password)
5. Click "Discover Streams"

### Advanced Options

- **Timeout**: Maximum time to spend discovering streams (default: 240 seconds)
- **Max Streams**: Stop after finding this many working streams (default: 10)
- **Channel**: For NVR systems, specify the channel number

### API Usage

You can also use Strix programmatically via its REST API:

#### Search for Camera Models
```bash
curl -X POST http://localhost:4567/api/v1/cameras/search \
  -H "Content-Type: application/json" \
  -d '{"query": "hikvision", "limit": 10}'
```

#### Discover Streams
```bash
curl -X POST http://localhost:4567/api/v1/streams/discover \
  -H "Content-Type: application/json" \
  -d '{
    "target": "192.168.1.100",
    "model": "Hikvision DS-2CD2xxx",
    "username": "admin",
    "password": "password"
  }'
```

The discovery endpoint returns Server-Sent Events (SSE) with real-time updates.

## Integration with go2rtc

Once you've discovered a working stream URL, you can add it to go2rtc for use in Home Assistant:

1. Copy the discovered stream URL
2. Open your go2rtc configuration
3. Add the stream:
```yaml
streams:
  camera_name: rtsp://admin:password@192.168.1.100:554/stream1
```

## Troubleshooting

### No Streams Found

1. **Check Network Connectivity**: Ensure Home Assistant can reach the camera's IP
2. **Verify Credentials**: Double-check username and password
3. **Try Model Search**: Search for your camera model to verify it's in the database
4. **Enable Debug Logging**: Set `log_level: debug` to see detailed discovery attempts

### Discovery Takes Too Long

1. **Reduce Timeout**: Lower the timeout value if you want faster results
2. **Specify Camera Model**: Providing the exact model focuses the search
3. **Limit Max Streams**: Set a lower `max_streams` value

### Camera Not in Database

If your camera model isn't in the database, Strix will still attempt:
- ONVIF discovery (if camera supports it)
- Common stream path patterns
- Popular URL variations

You can also manually test URLs using the discovery API with a direct stream URL as the target.

## Database

Strix includes a comprehensive camera database with:
- 3,600+ camera models
- 150+ popular stream patterns
- 258 query parameter variations

The database is continuously updated with new camera models and patterns.

## Privacy & Security

- All discovery happens locally on your Home Assistant instance
- No data is sent to external services
- Camera credentials are never stored or logged
- All communication with cameras uses standard protocols

## Support

For issues, feature requests, or contributions:
- [GitHub Repository](https://github.com/eduard256/Strix)
- [Report Issues](https://github.com/eduard256/Strix/issues)
