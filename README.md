# RemoteTerm - Remote Terminal Application

## Overview

RemoteTerm is a Qt-based remote terminal application that provides secure access to remote systems. It builds upon the qtermwidget terminal emulator component to offer a full-featured terminal application with remote connectivity capabilities.

## Features

- Remote terminal access via SSH and other protocols
- Terminal emulation with VT102 and xterm compatibility
- Secure connection with encryption support
- Customizable color schemes
- Mouse support (click, selection, copy/paste)
- Scrollback buffer
- Unicode support
- Adjustable font and size
- Multiple tabs support for simultaneous connections
- Search functionality
- URL detection and clickable links

## Installation

### Build Requirements

- Qt 6.4.0 or later
- CMake 3.0 or later
- C++ compiler with C++11 support

### Building from Source

```bash
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make
sudo make install
```

## API Documentation

### Main Classes

- `RemoteTermWidget`: The main terminal widget class with remote connection capabilities
- `TerminalDisplay`: The core display component that handles rendering and user interaction
- `RemoteSession`: Manages remote terminal sessions and secure connections

### Basic Usage

To create a remote terminal connection:

```cpp
#include <RemoteTermWidget>

// Create remote terminal widget
RemoteTermWidget *terminal = new RemoteTermWidget();

// Add to your layout
layout->addWidget(terminal);

// Connect to remote host
terminal->connectToHost("example.com", 22, "username");
```

## Configuration

The remote terminal can be configured for various connection scenarios:

```cpp
// Set connection parameters
terminal->setConnectionType(RemoteTermWidget::SSH);
terminal->setHostKeyVerification(RemoteTermWidget::StrictVerification);

// Set terminal appearance
terminal->setColorScheme("SolarizedDark");
terminal->setTerminalFont(QFont("Monospace", 12));

// Configure scrollback buffer
terminal->setHistorySize(5000);

// Set connection timeout
terminal->setConnectionTimeout(30); // seconds
```

## Examples

The project includes example applications demonstrating remote terminal usage:

1. SSH terminal client
2. Multi-tabbed remote terminal
3. Embedded remote terminal in system management application
4. Automated remote command execution tool

## Contributing

We welcome contributions to RemoteTerm! Here's how you can help:

1. Report bugs and security issues
2. Implement new remote protocol support
3. Improve connection management features
4. Enhance documentation and examples
5. Test with various server configurations

Please follow the project's coding standards and include appropriate tests for network-related changes.

## License

RemoteTerm is licensed under the GNU General Public License version 2 (GPLv2). See the [LICENSE](LICENSE) file for details.

## Acknowledgments

This project builds upon the qtermwidget terminal component and incorporates additional remote connectivity features.
