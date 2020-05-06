//Author DrDru

package main

import (
	"fmt"
	"strings"
)

func main() {

	input1 := `
19
(%)(t)[(^(e)){{[(d)c{*}[(*)g]]% [u]{e{f}<w>} }{v}]{x}(e)
<<d(w)>([g][<z>w](z)(t)h[( )z{*}])<y>{-}<z>>([[/]z](f) {/})
[(h)][*](z{b[y]<{+}v<f>>[c]{y}([*]h)})<e>{ }<z
{z}{b}{*( )}[<{ }*<u> v[{u{-}}c]][(%)x][]
<+>()(<t>[z][(e)[w]<a>(d) ]{+}g<y>){a}((z)< >{<{v} ><u>w}b)<g>
{([x{+}]^)(y){b}}(f{w}<v<%<e{*}(e)>>>{ })
{c}[x]{[[z{a}][w]e{a}]{/<{u}z>[b]}{/}[(<e><%>w){h}(g){e} [d]]}
[a]<((t[u])</> <v[-]>{t} a})>(u<{+}{t}g>){[e]<*>+}
<%[<v>[g]-{g}]>{(t)t{{-}-} b>{f{h}}<{+}g>[[ ]a]}<<f><f>>
(u(e))({[(w)g]{*} < }(x)})< >(e(y(f)([a]/)))( ){t>
(<d>v)<{b}{[h]y} (t)(-){d}>[{f}<a>{f[x[u]]}f][]<%>
{z}{g}(t){< <->><{b}(t)^[<f><e>-]>  >}{<*>[f]*{{{+}d}d[ ]}}
[h][{h}a]<{+}%><->{d( <u>[%]{v{{a}u}}[*])}([x]{w[%]}){(/)%}
((w)w)[z{^}]<[*]<b [a]c>[v]>{%}[w]( )([g{*( )}]{ }<w>(g) )>
( )(<<v>^( )>(t{{d}-})u){{-}{d}{ }}[(a)u<g {[(e)(*)z]t}]
{{d}x}[(t[u[w]][w])</>+[*]<(t)->][<(v){ }x><%>]
<([a(f){[t]g}(xc]x)b><[[[%]u]^]h><< [)]>(e)( )[w]>{h}
<< > v>>({<z>x<d>}-(<e>z[<%>{f}y]{e}[f]))([/[c(y)]][{x}u]w)(g)
< (a)>[<e> ><e><f](<h>^(y)<<->[a](d)v>)()(-[z])
`

	input := strings.Split(input1, "\n")

	openbrackets := map[string]int{
		"[": 1,
		"(": 1,
		"<": 1,
		"{": 1,
	}

	closebrackets := map[string]string{
		"]": "[",
		")": "(",
		">": "<",
		"}": "{",
	}

	for i := 2; i < (len(input) - 1); i++ {

		var bracketsstore []string
		brackets_store = append(brackets_store, "aaa")
		for _, c := range input[i] {

			// case  1 :  match an open bracket, append to the store
			if (openbrackets[string(c)]) == 1 {
				bracketsstore = append(bracketsstore, string(c))
			}

			// case  2 :  match a close bracket, delete last element of the store if possible
			if len(closebrackets[string(c)]) == 1 {

				if close_brackets[string(c)] == brackets_store[len(bracketsstore)-1] {
					bracketsstore = bracketsstore[:len(bracketsstore)-1]
				} else {
					bracketsstore = append(bracketsstore, "aaa")
				}

			}

		}

		if len(brackets_store) > 1 {
			fmt.Println("0")
		} else {
			fmt.Println("1")
		}

	}

}
