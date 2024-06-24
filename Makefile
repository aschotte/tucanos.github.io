.PHONY: deploy
deploy:
	rm -rf ./mdbook-publish/ && \
	git worktree add -f ./mdbook-publish mdbook-publish && \
	mdbook build && \
	cd mdbook-publish && \
	cp -rp ../book/* ./ && \
	git add -fA && \
	git commit --amend --no-edit && \
	git push -f origin mdbook-publish && \
	cd ..
