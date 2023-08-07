to:
	ansible-playbook --ask-become-pass \
        -i hosts \
        TheOrville.yml

sc:
	ansible-playbook --ask-become-pass \
        -i hosts \
        SpaceCruiser.yml

ds:
	ansible-playbook --ask-become-pass \
        -i hosts \
        DeathStar.yml

run:
	ansible-playbook --ask-become-pass \
        -i hosts \
        run.yml

server:
	ansible-playbook --ask-become-pass \
        -i hosts \
        DeathStar.yml

deps: 
        ansible-galaxy install luizgavalda.aur