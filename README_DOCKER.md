# Docker Install

The docker install is really simple if you follow these steps.

1. In the config directory rename example_config.py to config.py
2. Populate the config file accordingly
3. Run `make build` from the root directory
3. Run `make daemon` to deploy the bot
4. To get the invite link the easy way run `docker logs --tail=20 -f firetail`
