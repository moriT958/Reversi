package main

const (
	empty = iota
	dark
	light
	boardSize = 8
)

func InitBoard() [][]int {
	board := make([][]int, boardSize)
	for i := range board {
		board[i] = make([]int, boardSize)
	}

	board[3][3], board[4][4] = light, light
	board[3][4], board[4][3] = dark, dark

	return board
}
