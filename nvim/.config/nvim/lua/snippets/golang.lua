local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

local fmta = require("luasnip.extras.fmt").fmta

ls.add_snippets("go", {
	s("vmodule", fmta([[
type Module struct {
	Mux *http.ServeMux
	Controller *Controller
}

func NewModule(mux *http.ServeMux) *Module {
	controller := &Controller{}
    module := &Module{
		Mux: mux,
		Controller: controller,
	}

	return module
}

func (m *Module) RegisterEndpoints() {
	m.Mux.HandleFunc("GET /", m.Controller.RenderIndex)
}
	]], {})),

	s("vcontroller", fmta([[
//go:embed *.html
var FS embed.FS
var Tmpl *template.Template

func init() {
    Tmpl = template.Must(template.ParseFS(FS, "*.html"))
}

type Controller struct {
}

func (c *Controller) RenderIndex(w http.ResponseWriter, r *http.Request) {
    // Adicione a função de renderização correta aqui, se aplicável
    // Exemplo: renderutil.Render(Tmpl, w, "index.html", nil, nil)
}
	]], {})),
})
