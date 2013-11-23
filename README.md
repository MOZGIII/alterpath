# Alterpath

Alterpath allows you to manipulate the system `PATH` (environment variable) on Windows in a flexible manner.

## Requirements

- Windows

## Installation

    $ gem install alterpath

## Usage

	$ alterpath -h
	Read the usage instructions shown

	$ alterpath prepend "C:\test"
	Prepending PATH with "C:\test"

	$ alterpath list
	C:\test
	...

	$ alterpath remove "C:\test"
	Removing "C:\test" from PATH


## Notes

If the item you're adding is already in `PATH`, 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
