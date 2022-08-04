package lexer

import (
	"github.com/keisuke713/calculator/token"
)

type Lexer struct {
	input     string
	currIndex int
}

var NilToken token.Token

func New(input string) *Lexer {
	return &Lexer{
		input: input,
	}
}

func (l *Lexer) NextToken() token.Token {
	var tok token.Token
	numberOfChars := 1

	currChar := l.input[l.currIndex]
	switch string(currChar) {
	case token.PLUS:
		tok = token.New(token.PLUS, string(currChar))
	case token.MINUS:
		tok = token.New(token.MINUS, string(currChar))
	case token.MULTIPLY:
		tok = token.New(token.MULTIPLY, string(currChar))
	case token.DIVIDE:
		tok = token.New(token.DIVIDE, string(currChar))
	case token.LPAREN:
		tok = token.New(token.LPAREN, string(currChar))
	case token.RPAREN:
		tok = token.New(token.RPAREN, string(currChar))
	default:
		// 数値か空白
		for l.HasNextToken() && isDigits(l.input[l.currIndex+numberOfChars]) {
			numberOfChars++
		}
		tok = token.New(token.INT, l.input[l.currIndex:l.currIndex+numberOfChars])
	}

	l.currIndex += numberOfChars

	return tok
}

func (l *Lexer) HasToken() bool {
	l.skipChar()
	return l.currIndex < len(l.input)
}

func (l *Lexer) HasNextToken() bool {
	return l.hasToken(l.currIndex + 1)
}

func (l *Lexer) skipChar() {
	for l.hasToken(l.currIndex) && isSpace(l.input[l.currIndex]) {
		l.currIndex++
	}
}

func (l *Lexer) hasToken(i int) bool {
	return i < len(l.input)
}

func isDigits(b byte) bool {
	return 48 <= b && b <= 57
}

func isSpace(b byte) bool {
	return b == 9 || b == 32
}

func test() {}
