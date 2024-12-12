local M = {}

function M.preprocess_colors(tbl)
	for k, v in pairs(tbl) do
		if type(v) == "table" then
			M.preprocess_colors(v)
		elseif type(v) == "string" then
			tbl[k] = (0xff << 24) | tonumber(v, 16)
		end
	end
end

function M.with_alpha(color, alpha)
	if alpha > 1.0 or alpha < 0.0 then
		return color
	end
	return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
end

return M
