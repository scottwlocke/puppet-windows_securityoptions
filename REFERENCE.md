# Reference

<!-- DO NOT EDIT: This document was generated by Puppet Strings -->

## Table of Contents

### Resource types

* [`so_privilegerights`](#so_privilegerights): Manage a Windows User Rights Assignment.
* [`so_privilegerights_fragment`](#so_privilegerights_fragment): Append users to a so_privilegerights resource.
* [`so_registryvalue`](#so_registryvalue): Manage a Windows User Rights Assignment.
* [`so_systemaccess`](#so_systemaccess): Manage a Windows User Rights Assignment.

## Resource types

### `so_privilegerights`

Manage a Windows User Rights Assignment.

#### Properties

The following properties are available in the `so_privilegerights` type.

##### `ensure`

Valid values: `present`, `absent`

The basic property that the resource should be in.

Default value: `present`

##### `sid`

List of SIDs to allow for this right

#### Parameters

The following parameters are available in the `so_privilegerights` type.

##### `name`

namevar

The long name of the privilege right as it shows up in the local security policy

##### `provider`

The specific backend to use for this `so_privilegerights` resource. You will seldom need to specify this --- Puppet will
usually discover the appropriate provider for your platform.

### `so_privilegerights_fragment`

Append users to a so_privilegerights resource.

#### Parameters

The following parameters are available in the `so_privilegerights_fragment` type.

##### `name`

namevar

The mandatory namevar...just name it however you want

##### `right`

The right to append users to...long displayname from secedit_mapping.json

##### `sid`

List of SIDs to append to the right

### `so_registryvalue`

Manage a Windows User Rights Assignment.

#### Properties

The following properties are available in the `so_registryvalue` type.

##### `ensure`

Valid values: `present`, `absent`

The basic property that the resource should be in.

Default value: `present`

##### `sovalue`

the value of the registry setting

#### Parameters

The following parameters are available in the `so_registryvalue` type.

##### `name`

namevar

The long name of the setting as it shows up in the local security policy

##### `provider`

The specific backend to use for this `so_registryvalue` resource. You will seldom need to specify this --- Puppet will
usually discover the appropriate provider for your platform.

### `so_systemaccess`

Manage a Windows User Rights Assignment.

#### Properties

The following properties are available in the `so_systemaccess` type.

##### `ensure`

Valid values: `present`, `absent`

The basic property that the resource should be in.

Default value: `present`

##### `sovalue`

the value for the setting

#### Parameters

The following parameters are available in the `so_systemaccess` type.

##### `name`

namevar

The long name of the setting as it shows up in the local security policy

##### `provider`

The specific backend to use for this `so_systemaccess` resource. You will seldom need to specify this --- Puppet will
usually discover the appropriate provider for your platform.
