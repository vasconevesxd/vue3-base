#!/bin/bash
# VSCODE EXTENSIONS

extensionsVSCode=(
	"formulahendry.auto-close-tag"
	"formulahendry.auto-rename-tag"
	"aaron-bond.better-comments"
	"GitLab.gitlab-workflow"
	"xabikos.JavaScriptSnippets"
	"PKief.material-icon-theme"
	"esbenp.prettier-vscode"
	"bradlc.vscode-tailwindcss"
	"jkjustjoshing.vscode-text-pastry"
	"vscode-icons-team.vscode-icons"
	"hollowtree.vue-snippets"
	"Vue.volar"
)

for extension in ${extensionsVSCode[@]} 
do
  code --install-extension $extension
done







