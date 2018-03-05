# Intercom-Stripe
### Intercom Stripe integration webhook augmentor

This Rails app augments [Intercom's Stripe integration](https://docs.intercom.com/integrations/stripe-integration) by allowing you to connect multiple Intercom applications to one Stripe application.

This in no way replaces the core integration, and the core integration is required for this app to work correctly.

This is done by subscribing to any webhook that Stripe push out, and updating the `stripe_data` maintained by Intercom.

To get started locally, import your users from Stripe in the Intercom Integrations hub for each app you want to work with.

Now download and setup [Ngrok](https://ngrok.com/) to expose your localhost to the web, so you can hook into [Stripe's webhooks](https://stripe.com/docs/webhooks).

Start your local server with `rails s` and point your Ngrok tunnel at `http 3000`.

Add a webhook subscription service to your Slack, choose whatever you want.

This app subscribes in particular to `"customer.created"` `"customer.updated"` and `"customer.deleted"`.

Now get your Personal Access Tokens for Intercom in your application's [Developer Hub](https://docs.intercom.com/building-on-intercom/get-started-building-on-intercom) (don't worry, running this app won't expose your Access Token, as you will need to run this locally or on your own server).

Create [environment variables](http://blog.honeybadger.io/ruby-guide-environment-variables/) for each of your access tokens and add them to the `tokens` array defined in `lib/token.rb` like this.
```
@tokens = [ ENV["INTERCOM_ACCESS_TOKEN_1"], ENV["INTERCOM_ACCESS_TOKEN_2"], ... ]
```

That's all you need to do. Feel free to clone and tinker.

## Disclaimer
This is no way an official Intercom repo. This is just a quick app that was put together for fun.

I can't guarantee that I will be able to maintain this. If things break, play about and fix them.

## Contributing
- Create a branch with the naming convention `yourname/change_title`
- Open up a pull request
- Give me a shout