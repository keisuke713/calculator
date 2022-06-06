package lexer_test

import (
	"github.com/keisuke713/calculator/lexer"
	"github.com/keisuke713/calculator/token"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = Describe("Lexer", func() {
	It("[正常]文字列がトークンとして解析される", func() {
		input := "123 * (    1 +4     ) / /3  "
		// よくわからん文字列が入ってきた時のケースも用意しとけ
		// あとはリファクタ。currIndex更新する処理をdeferとかでまとめる？
		expected := []token.Token{
			token.Token{token.INT, "123"},
			token.Token{token.MULTIPLY, "*"},
			token.Token{token.LPAREN, "("},
			token.Token{token.INT, "1"},
			token.Token{token.PLUS, "+"},
			token.Token{token.INT, "4"},
			token.Token{token.RPAREN, ")"},
			token.Token{token.DIVIDE, "/"},
			token.Token{token.DIVIDE, "/"},
			token.Token{token.INT, "3"},
		}
		lexer := lexer.New(input)
		result := []token.Token{}
		for lexer.HasToken() {
			result = append(result, lexer.NextToken())
		}

		Expect(result).To(Equal(expected))
	})
})
