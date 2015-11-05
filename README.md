# surf

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with surf](#setup)
    * [What surf affects](#what-surf-affects)
    * [Beginning with surf](#beginning-with-surf)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Overview

Module to install the [surf browser](http://surf.suckless.org/).

## Module Description

This module compiles and installs the
[surf browser](http://surf.suckless.org/)
on a target node.

## Setup

### What surf affects

* `surf` executable at defined location.

### Beginning with surf

```puppet
include surf
```

## Usage

### I just want `surf` installed

```puppet
include surf
```

### I want to specify the version and location of `surf`

```puppet
class { 'surf':
  version => '0.4.1',
  prefix => '/opt/mysoftware',
}
```

## Reference

### Classes

* `surf`: Installs the surf binary

## Limitations

This module is known to work with the following operating system families:

 - Debian 8.2.0 or newer
