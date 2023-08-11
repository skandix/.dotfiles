default: help

help: ## show help message
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m\033[0m\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

to: ## run ansible playbook for TheOrvile (Home)
	ansible-playbook --ask-become-pass \
	-i hosts \
	_TheOrville.yml

sc: ## run ansible playbook for SpaceCruiser (Laptop)
	ansible-playbook --ask-become-pass \
	-i hosts \
	_SpaceCruiser.yml

ds: ## run ansible playbook for DeathStar (Work)
	ansible-playbook --ask-become-pass \
	-i hosts \
	_DeathStar.yml

server: ## run ansible playbook for server (Server)
	ansible-playbook --ask-become-pass \
	-i hosts \
	_Server.yml