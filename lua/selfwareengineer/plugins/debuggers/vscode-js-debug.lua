return {
	"microsoft/vscode-js-debug",
	-- opt = true, -- Not sure if this is needed?
	build = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out",
}
