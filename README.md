# PhoenixCowboy2Example

An example application for using [phoenix_cowboy2](https://github.com/voicelayer/phoenix_cowboy2).

The diff for upgrading from cowboy to cowboy2 is available in this commit:

https://github.com/voicelayer/phoenix_cowboy2_example/commit/437f9d1a98a408ce9bae7e46a18beb68d701fa17

## Running

 * `git clone git@gitgub.com:voicelayer/phoenix_cowboy2_example.git`
 * `cd phoenix_cowboy2_example`
 * An SSL certificate is required as most browsers only support
   HTTP/2 when using HTTPS
 * `openssl req -new -newkey rsa:4096 -days 365 -nodes -x509
    -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.example.com"
    -keyout priv/server.key -out priv/server.pem`
 * `mix deps.get`
 * `npm install`
 * `mix phoenix.server`
 * Navigate to [https://localhost:4001](https://localhost:4001)

If the application is successfully running under HTTP/2 then you
should see:

![http2](https://raw.githubusercontent.com/VoiceLayer/phoenix_cowboy2_example/master/docs/http2.png)


Otherwise you should see:

![not-http2](https://raw.githubusercontent.com/VoiceLayer/phoenix_cowboy2_example/master/docs/not-http2.png)

If you navigate to the [http version](http://localhost:4002)
of the site you will see
the message above.
