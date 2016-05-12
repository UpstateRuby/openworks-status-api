# Openworks Status API
[![Build Status](https://travis-ci.org/UpstateRuby/openworks-status-api.svg?branch=master&style=flat-square)](https://travis-ci.org/UpstateRuby/openworks-status-api)

API for the status of OpenWorks

For current Ruby version, see `.ruby-version`.

For current dependency list, see `Gemfile` or `Gemfile.lock`.

## Developing

### The production API
openworks-status-api.herokuapp.com/things

### Getting Set Up

#### The Easy Way :tm:

If you've never written Ruby on your machine before, don't have a Ruby version manager, or just don't want to bother setting up an environment manually, this method is for you.

You'll need to Install [Otto](https://ottoproject.io) and [Virtual Box](https://www.virtualbox.org) (At least the most recent 4.3 version). If you're on OS X you can use [Homebrew](http://brew.sh) to install Otto.

```
brew update
brew install otto
```

Once you have Otto and VirtualBox installed you can run:

```
git clone git@github.com:UpstateRuby/openworks-status-api.git
cd openworks-status-api
otto compile
otto dev
```

Otto will create the a local development environment for you. If you don't have the minimum required version of [Vagrant](https://www.vagrantup.com), Otto will prompt to install it for you. It may also download a base virtual machine image. 

The process may take a few minutes depending your connection and processor speeds. If everything goes well Otto should provide some instructions in the terminal.

Otto will run `bundle instlle` so the only thing left to do is SSH into the new VM with `otto dev ssh` and start the server with `rackup --host 0.0.0.0`. In a new terminal or after `exit`ing the current one run otto dev address to get the address of your development environment. Visit port 9292 of that address in your browser. For example, `172.16.1.194:9292`. Your IP address will probably vary. You should see the default Rails "Welcome Aboard" page.

Congratulations! You're now ready to hack on the OpenWorks Status API.

#### The Hard Way

@TODO

##### Troubleshooting

@TODO

### Running Tests

If you're using Otto, ensure you are SSHed into the VM:

```
otto dev ssh
```

Run the full test suite:

```
bundle exec rspec spec
```

## Contributing

### Adding Functionality

Open an issue describing the new feature. Add any appropriate labels and assign yourself if you wish to implement the feature. Create a feature branch with the issue number as the beginning of the branch name. Example, `123-new-feature`. Make and commit changes. **Be sure to add tests for new functionality**. Once your feature is complete and **the entire test suite is passing**, issue a pull request in GitHub.

### Fixing Bugs

Open an issue on GitHub describing the unexpected behavior. Add or modify tests to show unexpected behavior and open a pull request and reference it in the issue you created for the bug. If possible, provide changes necessary to fix the bug and achieve a passing test suite.

## Configuration

## Services

(job queues, cache servers, search engines, etc.)

## Deployment

## Things to track

* Internet
* Power
* Water
* Sewer
* HVAC
* Printer
* Refrigerator
* Security
  * Key Fobs
  * Doors
* Noise
* Seats/desks available
* Coffee

## Example Status Pages

  * https://www.apple.com/support/systemstatus/
  * https://status.github.com
  * https://status.stripe.com
  * https://status.digitalocean.com
  * https://status.simple.com

