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