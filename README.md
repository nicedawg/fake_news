# FakeNews

FakeNews is a rails app that makes it easy to generate fake news articles based on a
given query from data provided by The Guardian OpenPlatform
(https://open-platform.theguardian.com/)

This was created for fun, and to demonstrate writing integration tests for the
Bowling Green Web Developers meetup, in July 2018.

Please only use this for fun and education -- NOT for swaying elections or
harassing anybody. :-)

## Configuration

### The Guardian OpenPlatform

To query against The Guardian's OpenPlatform, you need an API key. See
https://open-platform.theguardian.com for details. Be aware that a free developer
API key has daily limits!

This rails app expects a valid API key in an environment variable.

Copy the provided `.env.example` file from the root of your project directory to
`.env`, and add your key there.
