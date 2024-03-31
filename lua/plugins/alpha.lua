local setup, alpha = pcall(require, "alpha")
if not setup then
	return
end
alpha.setup(require("alpha.themes.dashboard").config)
