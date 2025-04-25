local ls = require("luasnip")
local s = ls.snippet
local f = ls.function_node
local t = ls.text_node

local function get_component_name()
  local filename = vim.fn.expand('%:t:r')
  return vim.fn.substitute(filename, '_%w*', '', 'g'):gsub('^%l', string.upper)
end

ls.add_snippets("typescriptreact", {
  s("fc", {
    t({"type "}),
    f(get_component_name, {}),
    t({"Props = {active: boolean;};"}),
    t({"export const "}),
    f(get_component_name, {}),
    t({" = ("}),
    t({"props:"}),
    f(get_component_name, {}),
    t({"Props"}),
    t({") => {"}),
    t({"  return ("}),
    t({"<div>"}),
    t({"<p>"}),
    f(get_component_name, {}),
    t({" {props.active}</p>"}),
    t({"</div>"}),
    t({");"}),
    t({"};"}),
    t({"export default "}),
    f(get_component_name, {}),
    t({";"}),
  }),
})

ls.add_snippets("typescriptreact", {
  s("fcs", {
    t({"type "}),
    f(get_component_name, {}),
    t({"Props = {active: boolean;};"}),
    t({"export const "}),
    f(get_component_name, {}),
    t({" = ("}),
    t({"props:"}),
    f(get_component_name, {}),
    t({"Props"}),
    t({") => {"}),
    t({"const useState<boolean>(false)"}),
    t({"  return ("}),
    t({"<div>"}),
    t({"<p>"}),
    f(get_component_name, {}),
    t({" {props.active}</p>"}),
    t({"</div>"}),
    t({");"}),
    t({"};"}),
    t({"export default "}),
    f(get_component_name, {}),
    t({";"}),
  }),
})



